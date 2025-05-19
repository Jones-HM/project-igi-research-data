/*
 * Reverse-engineered version of FUN_00471f60 with renamed variables and detailed comments.
 * This is likely from a C++ game from around the 2000s, and we're analyzing compiled binary behavior.
 * 
 * Assumptions:
 * - The contextBase points to a large structure, likely "GameContext".
 * - At offset 0x2C44 begins an array of 10 overlay slots, each 0x2C (44 bytes) in size.
 * - Each slot corresponds to one AI target being tracked for drawing overlays (e.g., binocular HUD).
 */

uint32_t EnemyDetectorOverlay_00471F60(int contextBase, int targetID, float sortingDistance, int configFlag, int *screenPosition, int eventParam, int extraParam1, int extraParam2) {
    unsigned int slotIndex       /* old: uVar1 */ = 0;
    int          currentTimer    /* old: iVar2 */;
    int         *scanPtr         /* old: piVar3 */;
    int         *slotPtr         /* old: piVar4 */;
    float       *distanceScanPtr /* old: pfVar5 */;

    // Each overlay slot is 0x2C (44 bytes), i.e., 11 integers (4 bytes each).
    // Overlay slot table starts at offset 0x2C44 inside the GameContext structure.
    scanPtr = (int *)(contextBase + 0x2C44);  
    slotPtr = scanPtr;

    // 1) Try to find an existing slot for this targetID
    do {
        if (*slotPtr == targetID) {
            // Found matching ID, point slotPtr directly to that slot's memory
            slotPtr = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
            if (slotPtr != NULL) 
                goto InitializeSlot;
            break;
        }
        slotIndex++;
        slotPtr += 11;  // Move to next slot (11 ints = 44 bytes)
    } while (slotIndex < 10); // We have 10 slots max

    // 2) Find the first empty slot (where targetID == 0)
    slotIndex = 0;
    do {
        if (*scanPtr == 0) {
            slotPtr      = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
            currentTimer = GetTickCount();  // Retrieve current system time
            slotPtr[8]   = currentTimer;    // Save as "time last used"
            if (slotPtr != NULL)
                goto InitializeSlot;
            break;
        }
        slotIndex++;
        scanPtr += 11; // Move to next slot
    } while (slotIndex < 10);

    // 3) Fallback: Evict one slot if all are used — pick one with low distance <= sortingDistance
    slotIndex       = 0;
    distanceScanPtr = (float *)(contextBase + 0x2C5C); // Distance field starts at 0x2C5C (offset of float inside each slot)
    while (*distanceScanPtr <= sortingDistance) {
        slotIndex++;
        distanceScanPtr += 11; // Next float (stride of 11 floats = 44 bytes)
        if (slotIndex > 9)
            return 0; // No viable slot found
    }
    slotPtr      = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
    currentTimer = GetTickCount();
    slotPtr[8]  = currentTimer;
    if (slotPtr == NULL)
        return 0;

InitializeSlot:
    // Initialize or reuse the selected slot with new target info
    slotPtr[0]  = targetID;               // targetID
    slotPtr[6]  = (int)sortingDistance;   // distance stored as int (maybe for sorting or LRU)
    slotPtr[4]  = 1;                      // mark slot as enabled/active
    slotPtr[5]  = configFlag;             // configuration flag (UI type, mode, etc.)
    slotPtr[3]  = eventParam;             // event ID or type
    currentTimer = GetTickCount();        // get another time marker (e.g., time activated)
    slotPtr[7]  = currentTimer;
    slotPtr[2]  = extraParam1;
    slotPtr[1]  = extraParam2;
    slotPtr[9]  = screenPosition[0];      // screen X position
    slotPtr[10] = screenPosition[1];      // screen Y position

    return 1; // Success
}
