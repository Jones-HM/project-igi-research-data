# Project IGI QVM File Format

## What is QVM?

QVM stands for "Q Virtual Machine". It is a compiled binary file used in Project IGI to run game logic like AI, objects, and player scripts. The virtual machine interprets bytecode from these files during gameplay.</br>
The **QVM** are not **readable** to make them **readable** we need to **decompile** them to **QSC** file.

## File Signature & Variability

Most QVM files start with the ASCII signature `LOOP`. They vary in internal layout: object files use task trees (`objects.qvm`), while AI scripts are logic-based (`ai.qvm`). File sizes range from 270 bytes to 990 KB.</br>


## What Are QSC and QAS file formats?

- **QSC**: Human-readable source script written in _C-style_ syntax.
- **QAS**: Intermediate assembly generated from _QSC_ during build.
- **QVM**: Final compiled binary executed by the game engine.

These files follow this path:
```
QSC → QAS → QVM
```

## Compilation and Decompilation Flow

During development:
```
QSC (source) → QAS (assembler) → QVM (compiled)
```

When reverse engineering:
```
QVM → QSC (decompiled)
```

QAS is only generated if a flag is set during compilation.

## File Header Structure

| Offset | Type | Name        | Description              |
|--------|------|-------------|--------------------------|
| 0x00   | U4   | signature   | Must be `'LOOP'`         |
| 0x04   | U4   | ver_major   | Major version number     |
| 0x08   | U4   | ver_minor   | Minor version number     |

This header defines where tables for integers, strings, and bytecode instructions are located inside the file.

## Opcodes Information

| Hex | Name  | Description                            |
|-----|-------|----------------------------------------|
| 00  | BRK   | Stops execution                        |
| 01  | NOP   | No action                              |
| 02  | PUSH  | Pushes 32-bit value to stack           |

These are basic commands interpreted by the virtual machine to control flow and data handling.

## Task-Based Structure - objects.qvm

`objects.qvm` uses recursive task trees built using:
- `Task_DeclareParameters`: Defines expected types
- `Task_New`: Creates node with ID, type, context, and values

Example:
```c
Task_New(-1, "EditRigidObj", "", 24977198.0, -55751300.0, 174413136.0, 0, 0, 0.6645680069923401, "905_01_1", 1, 1, 1, 0, 0, 0)
```

Each child task can be referenced via ID later in scripts.

## Script-Based Logic - ai.qvm

AI logic lives in `ai.qvm`. These are QSC scripts that use C-like syntax with conditionals, functions, and logical operators.

Example:
```c
if(AIFunction_GetCurrentEventType() == AIEVENT_IDLE) 
{ 
    AIAction_Patrol(1203, 0, AIACTIONFLAG_NONE); 
}
```

They define behavior routines and event handlers used by in-game characters.

# Project IGI QVM Versions & Tools

## Overview

Project IGI is split into two major versions — **IGI 1** and **IGI 2**, each using its own QVM format. These formats are not compatible with each other, making direct file sharing or reuse between the two games impossible.

---

## 🎮 Project IGI 1 – QVM 0.5

IGI 1 uses the `QVM 0.5` format, which contains structured bytecode for various game elements like AI, human characters, and objects. Each type of QVM file may have a different internal layout depending on its use case.

### Decompiler
There is no official SDK, compiler, or decompiler available for this version. However, an unofficial tool called [DConv](https://github.com/NEWME0/Project-IGI/tree/master/tools/dconv), created by modder **Artiom**, can successfully decompile IGI 1 QVM files into readable QSC (source code). It also supports conversion between QVM 0.5 and QVM 0.7, helping bridge the gap between the two IGI versions.

### Compiler
For compiling IGI 1 files, there has been recent progress a **DLL based compiler** [IGI-Compiler](https://github.com/Jones-HM/project-igi-editor/blob/develop/IGIEditor/QCompiler.cs#L119) with [Native-method](https://github.com/search?q=repo%3AJones-HM%2Fproject-igi-internals%20QSCRIPT_COMPILE&type=code) thanks to a discovery by **Jones-HM**. He found a way to compile files directly inside the game by using **DLL injection** to call the game’s internal compilation functions. This method is fast, doesn't require external tools, and is now used in the **Project IGI Editor**.

---

## 🎮 Project IGI 2 – QVM 0.7

IGI 2 uses the newer `QVM 0.7` format, which has a completely different structure from IGI 1. The two formats are incompatible, meaning you cannot use QVM files from one version in the other.

Unlike IGI 1, IGI 2 comes with an **[official SDK](https://www.nexusmods.com/igi2covertstrike/mods/1)** that includes a powerful tool called [GConv](https://www.gamepressure.com/download/igi-2-covert-strike-map-editor-mod/zbbfc). This tool allows full decompilation and compilation of QVM files to QSC and back again. It is widely used for mod development and scripting support.

Despite having official tools, GConv is not always user-friendly or well-documented, so community tools and documentation continue to play a big role in expanding modding support.
