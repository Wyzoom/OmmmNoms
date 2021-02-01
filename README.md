# OmmmNoms
Open Mission Mod Maker for No Man's Sky

## Vision
The OmmmNoms mod introduces a new main mission category, Community Missions, in a form of mission to acquire the blueprints for and construct a buildable technology that serves as the community mission board. Once constructed, all the missions included in this mod become available.

##  Goals
The goal is twofold :
* Make custom No Mans Sky mission creation as easy as possible.
  * Creating a interesting mod requires a great deal of software development skills and has a steep learning curve. Creating an interesting and engaging missions requires creative writing skills. These two skills are not often found in one person. We want to lower the difficulty of the process of going from  writing a good story and converting it to a NMS mission and making it available for players.
* Reverse engineer and document the NMS mission structures
  * The way missions are described in the NMS assets is fairly complex, and multi-layered. By documenting the structure and by creating a MissionFactory tool we hope to enable moders to add missions to their mods

## Status
At this moment the toolchain is verified to work and we are  is moving towards an initial release, containing the initial mission to acquire the community missions interface and the first chapter of a much longer story.

# How does it work
* A mission narrative is written in Inky/ink.
  * You must use a number of specific tags, see documentation below (upcoming).
  * Not all ink language features can be used, see the [limitations of narrator library](https://github.com/astrochili/narrator#unsupported)
* If you do not want to bother with the technical aspects of mod creation, contact us and share our ink file. We will check it for technical correctness, and convert it to mission which is included on the community mission board. We will then publish a new version of the OmmmNoms mod.
* You get the OmmmNoms code from here by forking or downloading, set up your modding toolchain, run the ModFactory with AMUMSS, pack and distribute your own mod.

# Documentation
(WIP)
## Writing a story of the mission
* Using Inkle or any text editor, start a .ink document
  * HeloWorld tutorial mission is WIP
* You communicate with the mission factory using ink #tags. Tags are attached either to the highest level, specifying mission name, various properties. Tags attached to specific knows inform the factory of conditions that have to be met, rewards that have to be given and such. 
    * Be aware that you will not be able to use variables in a usual sense, except to store  global static values. 
    * We distinguish two concepts *book* and *story*. Book is a static description of what is there and conditions. Story is an active playthrough, where various variables and states change. You can turn your book into a story by using the right hand screen in Inkle, or my running the inkToStory.lua script. 
    * if inkToStory.lua can play your story without errors, it will probably work as a mission.
* NMS missions have stages, and each *stage* end with a *reward* This *reward* is either the next stage of the story, or a substance / product or a *puzzle*
* all dialogues (either with NPCs or with any object in the world)  are *puzzles* to NMS, which consist of a text describing  what they say, and a number of choices we as a player can make.
  * a choice always leads to a *reward*, which as mentioned can be a new *puzzle* (dialog option) or a new mission stage, or whatever
 * you can *interact* with an object, without dialogue. In that case, there is an immediate *reward* which can be a change of state of object. Press switch on the wall, light turns on. Interaction is pressing the switch, reward is the light turning on
 
  

### Story elements
From the perspective of the writer, we have the following to work with
The world
* Has : 
  * various states, list is WIP
* Does :
  * Regularly performs a state update with a "scan", if a ScanCondition is being met, a ScanEvent is generated. This allows for "While flying towards the planet, X happens" or "As I enter the alen ruin, I hear a voice speak"
  * There is a long list of possible ScanEvents, list is WIP

As a player I 
* Have :
  * Substances & Products in my exosuit/ship/exocraft/freigther inventory
  * Blueprints known and Technologies installed
  * Location, inside, outside, in trade post, in ship
  * status ( health, shield, etc)
    
* I do :
  * interact with object / NPC
  * Destroy objects with my multitool
  * make choices during dialogues
  * receive "rewards"
  * change what is in inventory
  * install / remove technology

(note that these list are  incomplete, but these kids of actions are translatable into mission events)


## NMS mission structure
A MISSION entity consists of a series of GenericMissionSequence's, which are stages

```
MIssionEntry
          Stage1
                 ScanEvent(condition that is being checked)
                     Condition
          Stage2
                ScanEvent(condition that is being checked)
                     Condition
          Stage3
                 ScanEvent(condition that is being checked)
                      Condition
          Stage4 { GcMissionSequenceReward}
                  Reward = RewardMission(RewardTabIeID)
           Stage5 {GcMissionSequenceReward }
                 Reward = Item (RewardTabIeID)

Mission 
      Trigger
             Reward
                    APE_ (alien puzzle)
                        APO_(AlienPuzzleOption)
                               APE_
                                     APO_
                                     APO_
                        APO_(AlienPuzzleOption)
                              *RewardMIssion = MissionEntry
                        APO_(AlienPuzzleOption)
                              EndEvent

Mission
      Trigger
             Reward
                    APE_ (alien puzzle)
                            *RewardMission = MissionEntry
   
                
```

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

