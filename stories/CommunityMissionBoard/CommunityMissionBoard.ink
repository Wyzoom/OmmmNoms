// Tags defined BEFORE the first knot are global and apply to this entire book
// tages defined within a knot belong to that knot
// all tags MUST have the following structure :
// # tag_name: Some value that you want your tag to have
// tag_name MUST NOT have spaces


// the name of this mission
# title: The crashed freighter

//The subtitle of the mission
# subtitle:  This is the mission subtitle

//The entire description when you select the mission
# description: This is the extended mission description

// A short blurb of what you need to do
# objective: Short mission objective

// The hint at the bottom of a page of what to do
# page_hint = ""


//The icon that appears as a marker and in the menu
// This will be either a set of preset things from the game, or a custom icon you make ourself
# icon = SOME_ICON_ID

// mision priority ( probbaly has to be set fixed, we will see)
# priority: 4

TODO
// mission category // this should be figured out from existing assets

//the starting knot. What is the opening stage of the mission?
# starting_point = mission_pickup

// mission class : Primary or Secondary - for the mission log on top / vs below
# is_primary_mission:  true

// mission is critical
# is_critical: false

TODO //things to think about
//<Property name="AutoStart" value="None" />
//<Property name="RestartOnCompletion" value="False" />
//<Property name="CancelSetsComplete" value="False" />

//dialogues


TODO
//Figure out how to link to langauge files

TODO
// Figure out the unique tyeps of scan events

//For things that hae to happen for tory to pgroess, like externl conditions, we should

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


VAR ObjectNeeded = "SalvagedFrigateModule"
VAR ObjectNeededIsInInventory = "false"

VAR FlyingInSpace = false
VAR HasPerformedScan = false
VAR InteractWithBeacon = false
VAR Reward = "nanites"

VAR ExosuitMessage = ""
VAR ExosuitAction = ""
VAR CommMessage = ""


// General points 
// ink VAR has to be treated as global constants
// things that might change per know/mission stage must be tags.

// dialogue can only lead to two types of things :
    // Another knot with a dialogue
    // a entry from a RewardTable
    
    // <Property name="Costs" />


-> mission_pickup

== mission_pickup ==


"The client is concerned with the suddent lack of communication from the Gek freighter they had contracted to deliver them a single item. You mission is to locate the freighter, identify the reason for loss of contact and bring back the item. 
As the item is of personal nature, your discretion is essential. The client promises to reward you handsomely."

The mission agent shuffles nervously as I examine the mission details.


+ [Accept the mission]
    -> mission_start
    
+ [Leave]
    -> dont_start_mission



== mission_start ==
I should head out to space.
#IsInSpace = true
#HasPerformedAScan = true


*   [Leave station] {~ FlyingInSpace = true}

{ FlyingInSpace :
-> space_encounter
}

-> space_encounter

== space_encounter ==
#ShipMessage "Coordinates recieved" 
I recieve coordinates
-> found_freighter

== found_freighter ==

As I land next to the freighter, it is clear that is has made its last trip.  Debris is scatered everywhere and  the warp engines are torn to shreds by the emergency warp core ejection.

The bodies of the Gek crew are scattered throughout the mangled wreck. Scan is very clear : No lifesigns detected.  Not just that, but all of their exosuit and multitool technology is damaged. Strange. The only functioning piece of technology left is the emergency beacon, its lights pulsating angrily.

As approach the beacon the same uneasy feeling starts creeping up by back, just like it did back at the station.

+ [Examine the beacon]
    -> interact_with_beacon
    
+ [Leave]
    -> abandon_mission


== interact_with_beacon ==
~ InteractWithBeacon = true
I switch on my exosuits comm interface, and connect it to the beacon. A power surge arcs and hits my life suport, leaving a nasty cloud of smoke and immediately triggering my suits toxicity warning.


~ ExosuitMessage = " WARNING: Unexpected traces of Pugneum detected. Initalising gas purge." 

  { ExosuitMessage }
  
Damn! These things are supposed to be holograpically separated from their antimater generators! Now my comm port is fused with the beacon.
In the meantime, automatic download of the logs and cargo manifest is ongoing.

~ ExosuitAction = "DamageWarning"
~ ExosuitMessage = "WARNING: Malformatted data packet recieved. Logging for analysis."

{ExosuitMessage}

Damn, I had enough of this. I pull hard on the com interface, breaking it off at the port. Nooo, this is going to cost me at least 5  Activated Indum stacks to repair!

Ah well, at least I got the damn manifest downloaded intact. Lets see... 
Curious, only a single crate. Who charters an entire freighter with crew to ship a single crate?

Well, standing around wondering about the facies of  excentric rich aliens is not going to earn me those nanite. Lets find that crate.

-> search_for_object

== search_for_object ==
I shoot the lock off the nearest crate and find a {ObjectNeeded}.

-> found_object

== found_object == 

Hmm, the client did say they wanted {ObjectNeeded}.

Could this be it?
*   [No?] -> search_for_object
*   [Yes?] -> return_to_mission_board

== return_to_mission_board == 

Go to mission agent and recieve reward

-> END

== abandon_mission ==
This beacon is all kinds of wrong. Nah, forget it, no way I am touching that thing. I turn around, enter my ship and take to the stars.
-> END

== dont_start_mission ==
That Gek looks way to nervous. I wonder what is going on?. This does not feel right. No ammount of nanites is worth sleeping with the sentinels. 

-> END