# OmmmNoms
Open Mission Mod Maker for No Man's Sky

## Vision
The OmmmNoms mod introduces a new main mission category, Community Missions, in a form of mission to acquire the blueprints for and construct a buildable technology that serves as the community mission board. Once constructed, all the missions included in this mod become available.

##  Goals
The goal is twofold :
* Make cutom No Mans Sky mission creation as easy as possible.
  * Creating a interesting mod requires a great deal of software development skills and has a steep learning curve. Creating an interesting and engaging missions requires creative writing skills. These two skilla are not often found in one person. We want to lower the difficulty of the process of going from  writing a good story and converting it to a NMS mission and making it available for players.
* Rreverse engineer and document the NM mission structures
  * The way missions are described inthe NMS assets is fairly complex, and multilayered. By documenting the structure and by creating a MissionFactory tool we hope to enable modders to add missions to their mods

## Status
At this moment the toolchain is verified to work and we are  is moving towards an initial release, containing the initial mission to acquire the community missions interface and the first chapter of a much longer story.

# How does it work
* A mission narrative is written in Inky/ink.
  * You must use a number of specific tags, see docummentation below (upcoming).
  * Not all ink language features can be used, see the [limitations of narrator library](https://github.com/astrochili/narrator#unsupported)
* If you do not want to bother with the technical aaspects of mod creation, contact us and share our ink file. We will check it for technical correctness, and convert it to mission which is included on the community mission board. We will then publish a new vesion of the OmmmNoms mod.
* You get the OmmmNoms code from here by forking or downloading, set up your modding toolchain, run the ModFactory with AMUMSS, pack and distribute your own mod.

# Documentation
(incoming)



# Credits and thanks
OmmmNoms uses several libraries, tools and resources and has recieved invaluable support from members of the moddign community members.

## NMS modding community
* [No Man's Sky modding discord](https://discord.gg/22ZAU9H)
* [NMS Modding wiki](https://wiki.step-project.com/NMS:Modding_Tools)

## Libraries
We are using the following libraries :
* [narrator](https://github.com/astrochili/narrator)
* [json.lua](https://github.com/rxi/json.lua)
* [inspect.lua](https://github.com/kikito/inspect.lua)

## Tools
* [Inkly](https://github.com/inkle/inky) Tool (editor and language) for writer friendly way to create structured, playable narratives and connect them to games.
* [AMUMSS](https://www.nexusmods.com/nomanssky/mods/957) :  Auto modbuilder-updater with MOD script definition system

