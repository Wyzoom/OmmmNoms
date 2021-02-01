// the name of this mission
VAR title = "Words between worlds" 

//The subtitle of the mission
VAR subtitle = "The subtitle of the mission"

//The entire description when you select the mission
VAR description = "Construct the anomalous signal interface"

// A short blurb of what you need to do
VAR objective = "Short mission objective" 

// The hint at the bottom of a page of what to do
VAR page_hint = "This is a page hint"


//The icon that appears as a marker and in the menu
// This will be either a set of preset things from the game, or a custom icon you make ourself
VAR icon = "SOME_ICON_ID"

// mision priority ( probbaly has to be set fixed, we will see)
VAR priority = "4"

TODO
// mission category // this should be figured out from existing assets
VAR mission_category = ""

//the starting knot. What is the name of the knot that defines the opening stage of the mission?
VAR starting_point = "mission_pickup"

// mission class : Primary or Secondary - for the mission log on top / vs below
VAR is_primary_mission =  true

// mission is critical
VAR is_critical = false

TODO //things to think about
//<Property name="AutoStart" value="None" />
//<Property name="RestartOnCompletion" value="False" />
//<Property name="CancelSetsComplete" value="False" />

//dialogues

TODO Verify double enter forcing net page
// Double enter forces the text to appear on next page of dialogue

// trigger sounds?
//<AUDIO>TXT_RadioNoise<>
//<AUDIO>UI_Destination_Reached<>
//<AUDIO>UI_Nanites_Received<>
//<AUDIO>UI_NoWhereToLand<>

//<STELLAR>– kzzzkkt –<> 
//<SPECIAL>EXTREME GRAVITATIONAL EVENT<>
//<TRADABLE>DETECTED<>
//<TECHNOLOGY>NEUTRALISED<>


TODO Figure out how to link to langauge files

TODO Figure out the unique types of scan events

//For things that hae to happen for story to progress, like externl conditions, we should

//Items : 4 types of default items. Ëach of these types can be any of the ~2000 items in substance tables
// https://docs.google.com/spreadsheets/d/1J8WdrubKgo8A9hPY-hbQLq4eVrb3n3lZAgiI2J7ncAU/edit#gid=66931870

// for scan events that do item checks in inventory. 
// Primary is condition  1 and secondary the second. In total you can have a check of two substances/products  
// These have to be specified in the scan events.
// "PrimarySubstances / "SecondarySubstances" = ""
// "PrimaryProducts / "SecondaryProducts"

//Specify being at a location
// ScanEvent, with location ID. There is a table for the user to look up. 
// BuildingType is avariable in scan event
// <Property name="BuildingType" value="SpaceStation" />
// <Property name="BuildingLocation" value="Nearest" />


// things that might change per know/mission stage must be tags.

VAR ObjectNeeded = "SalvagedFrigateModule"
VAR ObjectNeededIsInInventory = "false"

VAR FlyingInSpace = false
VAR HasPerformedScan = false
VAR InteractWithBeacon = false
VAR Reward = "nanites"

VAR ExosuitMessage = ""
VAR ExosuitAction = ""
VAR CommMessage = ""


// dialogue can only lead to two types of things :
    // Another knot with a dialogue
    // a entry from a RewardTable
    
    // <Property name="Costs" />

VAR event_type = ""

-> mission_pickup
== mission_pickup ==
{~ event_type = "incoming_comm_message"}


The incoming signal is unlike anything you have ever seen before. Carrier frequency oscilates, modulation makes no sense. Ship is struggly to keep tracking the signal, as it is shifting across the spectrum.

With some difficulty, the communicator tunes in. There is silence at first. Then, very faint, I can hear distorted words being spoken. 
I can hear the urgency in the voice, and who, or whatever, is trying to communicate with me clearly has a lot to say.

No matter how carefully, I listen, I just can not make out the words.


+ [Continue listening]
    -> mission_start
    
+ [Close the connection]
    -> dont_start_mission

== mission_start ==
I continue listening to the voice mesmerised, as the sounds continues shifting, crackling, fading in and out.  After a while, I realize tha there is a pattern in the noise. I set the ships computer to track the pattern. Yes, there is information in there!

VAR ship_message = "Anomalous coordinates identified"
"WARNING: Coordinates extracted from anomalous signal!" 

+ [Set course to anomalous coordinates?]
    -> towards_the_signal

== towards_the_signal ==
VAR set_destination = "Nearest Boundary Failure"
-> DONE
== found_freighter ==
VAR interact_with = "Bondary Failure"

This is the source of the anomalous transmission. There is a message waiting for me.

+ [Download the data]
    -> interact_with_beacon
    
+ [Leave]
    -> towards_the_signal


== interact_with_beacon ==
VAR mission_reward = "comunity_mission_interface_blueprint"
-> build_interface

== build_interface ==
VAR is_community_mission_interface_present = true

-> mission_end

== mission_end == 
# interact_with: community_mission_interface

TODO write the first interaction with the interface
# keep_mission_active: true
-> END

== dont_start_mission ==
Dont bother
TODO elaborate on nice end
-> END