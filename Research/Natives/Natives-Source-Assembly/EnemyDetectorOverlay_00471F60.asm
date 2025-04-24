; --------------------------------------------
; Function start 00471F60
; Arguments (from stack):
;   [esp+0x0C] – value to search for (passed in EBX)
;   [esp+0x10] – base pointer to data structure (passed in EDI)
; --------------------------------------------

push    ebx                    ; Save EBX on stack (callee-saved register)
mov     ebx, [esp+0x0C]       ; EBX ← first function argument (search key)
push    esi                    ; Save ESI on stack
push    edi                    ; Save EDI on stack
mov     edi, [esp+0x10]       ; EDI ← second function argument (base pointer)
xor     eax, eax              ; EAX = 0 (initialize index/counter)
lea     ecx, [edi + 0x2C44]   ; ECX = pointer to array element 0: edi + offset 0x2C44
mov     edx, ecx              ; EDX = ECX (iterator pointer)

; Loop 1: scan up to 10 entries comparing first DWORD with EBX
cmp     [edx], ebx            ; Compare array[index].field0 with search key
je      igi.exe+71F84         ; If equal, jump to “found” handler
inc     eax                   ; index++
add     edx, 0x2C             ; advance pointer to next element (size = 0x2C)
cmp     eax, 0xA              ; have we checked 10 entries?
jb      igi.exe+71F75         ; if less than 10, repeat loop
jmp     igi.exe+71F95         ; otherwise, exit loop (not found)

; Compute pointer: esi = &array[eax] + baseOffset
lea     edx, [eax + eax*4]    ; edx = eax * 5
lea     eax, [eax + edx*2]    ; eax = eax + edx*2 = eax * 11
lea     esi, [edi + eax*4 + 0x2C44] ; esi = &array[eax] + baseOffset
test    esi, esi              ; Test if pointer is non-zero
jne     igi.exe+71FFD         ; If non-zero, jump to after failure

; If pointer was NULL, scan again using ECX for first non-zero entry
xor     eax, eax              ; EAX = 0 (reset index)
cmp     dword ptr [ecx], 0    ; Check array[0].field0 again
je      igi.exe+71FA7         ; If zero, skip increment
inc     eax                   ; index++
add     ecx, 0x2C             ; ECX = next element
cmp     eax, 0xA              ; have we scanned 10 entries?
jb      igi.exe+71F97         ; if less than 10, repeat
jmp     igi.exe+71FC0         ; otherwise, give up

; Compute esi again based on new EAX
lea     ecx, [eax + eax*4]    ; ecx = eax * 5
lea     edx, [eax + ecx*2]    ; edx = eax + ecx*2 = eax * 11
lea     esi, [edi + edx*4 + 0x2C44] ; esi = &array[eax] + baseOffset

call    igi.exe+90370         ; Call helper function (e.g., allocate or lookup)
test    esi, esi              ; Check returned pointer
mov     [esi+0x20], eax       ; Store return value in esi->field20
jne     igi.exe+71FFD         ; If successful, jump past failure handling

; FPU comparison loop: find first entry with float < given threshold
xor     ecx, ecx              ; ECX = 0 (reset counter)
lea     edx, [edi + 0x2C5C]   ; EDX = pointer to float array start (offset 0x2C5C)
fld     dword ptr [edx]       ; Load array[ecx] float into FP stack
fcomp   dword ptr [esp+0x18]  ; Compare with threshold passed at [esp+0x18]
fnstsw  ax                    ; Store FPU status word into AX
test    ah, 0x41              ; Check C0 (carry) or C3 flags (unordered or <)
je      igi.exe+71FE4         ; If not less, skip increment
inc     ecx                   ; index++
add     edx, 0x2C             ; advance to next float (stride = 0x2C)
cmp     ecx, 0xA              ; have we tried 10 floats?
jb      igi.exe+71FC8         ; if less than 10, repeat
; No match or exhausted
pop     edi                   ; Restore EDI
pop     esi                   ; Restore ESI
xor     eax, eax              ; EAX = 0 (return failure)
pop     ebx                   ; Restore EBX
ret                           ; Return

; If we did not early-return, fall through to record new entry
lea     eax, [ecx + ecx*4]    ; eax = ecx * 5
lea     ecx, [ecx + eax*2]    ; ecx = ecx + eax*2 = ecx * 11
lea     esi, [edi + ecx*4 + 0x2C44] ; esi = &array[ecx] + baseOffset

call    igi.exe+90370         ; Allocate or get new entry
test    esi, esi              ; Check pointer
mov     [esi+0x20], eax       ; Store return value
je      igi.exe+71FDE         ; If NULL, jump to failure

; On success, populate structure at esi with passed arguments
mov     edx, [esp+0x18]       ; Load float threshold argument
mov     eax, [esp+0x1C]       ; Load next argument
mov     ecx, [esp+0x24]       ; Load next argument
mov     [esi], ebx            ; struct.field0 = search key
mov     [esi+0x18], edx       ; struct.field18 = threshold
mov     [esi+0x10], 1         ; struct.field10 = 1 (flag)
mov     [esi+0x14], eax       ; struct.field14 = argument
mov     [esi+0x0C], ecx       ; struct.field0C = argument

call    igi.exe+90370         ; Possibly another helper call
mov     edx, [esp+0x28]       ; Load next argument
mov     [esi+0x1C], eax       ; struct.field1C = return value
mov     eax, [esp+0x2C]       ; Load next argument
mov     [esi+0x08], edx       ; struct.field08 = argument
mov     [esi+0x04], eax       ; struct.field04 = argument
mov     eax, [esp+0x20]       ; Load final argument

pop     edi                   ; Restore EDI
mov     ecx, [eax]            ; ecx = pointer from final arg
mov     [esi+0x24], ecx       ; struct.field24 = dereferenced final arg
mov     edx, [eax+4]          ; edx = pointer at final arg + 4
mov     [esi+0x28], edx       ; struct.field28 = second deref

pop     esi                   ; Restore ESI
mov     eax, 1                ; EAX = 1 (return success)
pop     ebx                   ; Restore EBX
ret                           ; Return to caller
