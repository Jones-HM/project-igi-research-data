# Project IGI 1 Humanplayer QVM Parameter Reference

The `DefineHumanPlayerGeneral` function in Project IGI 1's Humanplayer QVM configures core player mechanics. While structurally similar to IGI 2, IGI 1 uses unique parameter sequences with critical gameplay implications. Due to the absence of official documentation, these values were reverse-engineered by the modding community through extensive testing. Below is a complete parameter breakdown with verified defaults and contextual explanations.

## Parameter Documentation
```c
// Project IGI 1 - Humanplayer QVM Parameter Reference
// Verified defaults (community-researched via reverse engineering)
// Note: Parameters beyond healthFence follow undocumented patterns (0.5/0.75/1 sequences)
DefineHumanPlayerGeneral(
    1.75,       // movementSpeed: Base movement speed multiplier (default: 1.75)
                // Controls overall walking/running pace. Higher = faster movement
    
    17.5,       // forwardSpeed: Forward jump directional speed (default: 17.5)
                // Determines forward momentum when jumping toward targets
    
    27.0,       // upwardSpeed: Vertical climbing/jumping speed (default: 27.0)
                // Controls jumping and heights.
    
    0.5,        // AirSpeed: Air movement multiplier (default: 0.5)
                // Speed of player movements while in air.
    
    0.85,       // peekLRLen: Horizontal peek distance (left/right) (default: 0.85)
                // Distance player can lean sideways while peeking around cover
    
    0.85,       // peekCrouchLen: Crouched peek distance (default: 0.85)
                // Vertical peek range when crouching
    
    0.25,       // peekTime: Peek animation duration (seconds) (default: 0.25)
                // Time to complete peek and reset it back to normal position.
    
    3.0,        // healthScale: Health scale of player (default: 3.0)
                // Health scale from 0.0 - 3.0
    
    0.5,        // healthFence: Critical health threshold (default: 0.5)
                // Health damage multiplier by fence.
    
    // Undocumented parameters (pattern analysis by modding community):
    0.5, 0.75, 1,  
    0.5, 0.75, 1,  
    0.5, 0.75, 1,   
    0.5, 0.75, 1,   
    1, 1, 1, 1, 1, 
    0.5, 0.75, 1, 
    0.5, 0.75, 1,  
    0.5, 0.75, 1,   
    0.5, 0.75, 1,  
    1, 1, 1, 1,   
    100000,        
    100000    
);
