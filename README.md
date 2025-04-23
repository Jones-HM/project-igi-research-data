# IGI-Research-Data
IGI-Research-Data 🕵️‍♂️ is a repository that contains all the research information for [Project I.G.I](https://en.wikipedia.org/wiki/Project_I.G.I.) game for educational purposes.

## Data - Section
### `Data` section contains all the data that were used for Game Level/A.I/3D-Objects/Graphs etc.
- `Data/AI` - Contains data scripts regarding A.I behaviors and Actions used in the level like `level/AI/503.qvm`.
- `Data/Graphs` - Contains data regarding Graphs of the game like `Areas` information and Graph _Nodes, Vertices, Material_ information stored. It also contains some graphs converted to [SVG](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) format.
- `Data/Misc` - The Misc section contains information about Game variables/constants used in the IGI Game engine, and a fully advanced [Cheat-Engine Table](https://en.wikipedia.org/wiki/Cheat_Engine) 🕹️ _PROJECT-IGI-1.CT_ which has data for Player/A.I/Vehicles/Game State/Profile and more.

## Research - Section
### `Research` section contains all the research that was done on game files/memory using _Runtime_ or _Static_ analysis methods.
- `Research/GRAPH` - Contains all the information about Graph structure, nodes/vertices/signature with detailed analysis, including _Russian translation_ for notes. 📈🔍
- `Research/MEF` - Contains a file explaining the structure of MEF. 📂
- `Research/QVM` - Contains a file explaining the structure of QVM. 🧩
- `Research/QSC` - Contains a file explaining the structure of QSC _Q-Scripts_. These files were decompiled using *Python* 🐍 tool. 📜
- `Research/Natives` - File contains Natives now as `Source Code` in `Assembly/C++` format as well used for `Project IGI 1`. All natives methods were decompiled using the original game `igi.exe` using **IDA/Ghidra** for educational purposes, not intending any harm to game files and their property. 📝
- `Research/Models` - File `IGI-Models.json` contains a list of almost 600 different building/object model information, including `MEF` data. This data was extracted using `Debug-Mode` used by developers in testing, which can be unlocked using this script [IGI-Debug-Mode](https://gist.github.com/haseeb-heaven/721d82fccc8de3e6da95cfa609230cea). 🏗️
- `Research/BONES` - Contains `BONES` information of Players joint structures.
- `Research/LEVEL` - Contains `LEVEL` related information like _building,objects,ai_ in the levels.
- `Research/SCRIPT` - Contains `SCRIPT` of the game known as *QSC* (*Q* _Script File_) which is used to manipulate _AI/Building/Objects and more_.

  
## Tools - Section
### 🛠️ `Tools` section contains all the custom tools that were built for Project IGI 1/2 during research. 🛠️

| Tool Name               | Description                                                   | Developer      |
|-------------------------|---------------------------------------------------------------|----------------|
| 📜 IGI Compiler     | Compile/Decompile game binary (_QVM_) files on web.      | [Link](https://igi-compiler.streamlit.app/) |
| 📊 IGI Graph Viewer     | Explore the game's graphs in a user-friendly interface.      | [Link](https://igi-graphviewer-hm.streamlit.app/) |
| 🔍 IGI Models Search    | Find I.G.I models with ease.                                  | [Link](https://igi-models-search.netlify.app/) |
| 🕵️ IGI Natives Search  | Search for game natives efficiently.                         | [Link](https://igi-natives-search.netlify.app/) |
| 📈 IGI Natives Analyzer | Analyze game natives with detailed insights.                  | [Link](https://igi-natives-analyzer.streamlit.app/) |
| 🗺️ I.G.I Level Information | Explore data related to I.G.I levels.                      | [Link](https://igi-levels-data.netlify.app/) |
| 📜 I.G.I AI Data Information | Explore *A.I* information of all I.G.I levels.                      | [Link](https://igi-ai-info.streamlit.app/) |
| 📜 I.G.I Missions AI Analyzer | Explore Mission *Soldiers* information of all I.G.I levels.                      | [Link](https://igi-missions-analyzer.streamlit.app/) | 
| 🖼️ IGI-Language-Mod              |  Language Mod (_Urdu Roman_) for Project IGI 1  | [Link](https://www.nexusmods.com/projectigi/mods/7?tab=description) |
| 📁 IGI-Resource-Viewer  | View IGI resource files like _.tex, .spr, .tga_ without extraction | Dark  |
| 📦 IGI-Resource-Convertor | Pack/Unpack IGI resource files like _.res_ Resource files       | Dark/Jones-HM |
| 🎨 IGI-3dsMax-tools     | Export models from 3ds Max v8-Year 2005 to IGI's MEF format   | IGI-Devs |
| 📜 IGI-QCompiler        | Compile/Decompile game scripts and binary files (QSC -> QVM, QVM -> QSC) | Jones-HM |
| 🌐 IGI-Mtp_Decoder      | MTP converter for objects (e.g., level1.dat to level1.mtp)     | Unknown |
| 📡 IGI-EngineExtractor  | Extract variables/data from the game engine and save data externally | Jones-HM |
| ✏️ IGI-QVMEditor            | Powerful tool to view/edit game QVM files with features like model information, syntax highlighting, auto-complete, and more | Jones-HM |
| 📊 IGI-GraphEditor      | Powerful tool to view/edit game Graphp files (e.g., Graph4019.dat) and analyze nodes, links, and vertices of graphs | Jones-HM |
| 📋 IGI-Natives-Info     | Tool to view game native methods and get info about their signature and hash | Jones-HM |
| 🖼️ IGI-TGaConvertor              | Texture converter for objects (e.g., wood_material.tex, concrete_bullet.tex) to convert to PNG format | Jones-HM |


## Templates - Section
### `Templates` section contains templates for [010 Editor](https://www.sweetscape.com/010editor/) for both IGI1 and IGI2 game.

## Data Disclaimer
This data is for educational purposes to learn how the game reacts with [Game Engine](https://en.wikipedia.org/wiki/Game_engine) and to understand game mechanics behind `QVM` Virtual machine and all its stuff. Please don't use this data to make `cheats/hacks` for this game, as this data was originally used by Game developers to develop the game. So, respect the developers and don't ruin any data posted here.

Some data were decompiled using the original game `igi.exe` using [IDA](https://hex-rays.com/ida-pro/)/[Ghidra](https://ghidra-sre.org/) for educational purposes, not intending any harm to game files and their property.

## Credits and People
If you want to use this data, respect fellow researchers and give proper credits to people. (давать людям должные кредиты)
- [Yoejin Light](https://vk.com/id436486682) 🌟 : _MTP, Models structure_ and information.
- [Dimon Krevedko](https://vk.com/dimonkrevedko) 🌟 : **Graphs and Nodes** structure and information.
- [Artiom Rotari](https://github.com/NEWME0) 🌟 : _DConv Tools for Decompiler_ and **Scripts**.
- [ORWA S](https://www.youtube.com/@totalwartimelapses6359) 🌟 - **Graphs Area and Nodes** compilation of information.
- [GM123](https://www.youtube.com/@gm1233) 🌟 - **Detailed Models Information**.
- [Dark](https://www.youtube.com/@CRONOQUILLOFFICIAL)🌟 - **Contrinuted on Various Projects and files (Resources,QVM,QSC etc) and UI/UX Designs**.
- [Ferit Coder](https://www.youtube.com/channel/UCpn_gZMkFVBUAe9SJK9hYQA) 🌟 - **Helped with IGI 2 Editor **Maps/Models** conversion to IGI 1.**.
- [IGI ResearchDevs@HM](https://vk.com/id679925339) 🌟 - **Maintainer of this repo**.
- [Chat-GPT Advanced](https://chat.openai.com/) 🌟 - **Understanding complex game mechanics** with _Reverse Engineering_ and **Advaced Data Analysis** of Game files _QVM,QSC,.DAT and more_.

Copyright @2021 - IGI Research Devs @ HM.
