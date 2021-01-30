VAR mission_name = "The crashed freighter"
VAR MissionObjective = "Explore the fate of the crashed freighter."
VAR MissionSubtitles = "Explore the crashed freighter."
VAR ObjectNeeded = "SalvagedFrigateModule"
VAR ObjectNeededIsInInventory = "false"

VAR CurrentMissionStage = -> mission_pickup
VAR NextMissionStage = -> mission_start

VAR FlyingInSpace = true
VAR HasPerformedScan = true
VAR InteractWithBeacon = true
VAR Reward = "nanites"

VAR ExosuitMessage = ""
VAR ExosuitAction = ""
VAR CommMessage = ""


-> CurrentMissionStage

== mission_pickup ==
{ mission_name }
"The client is concerned with the suddent lack of communication from the Gek freighter they had contracted to deliver them a single item. You mission is to locate the freighter, identify the reason for loss of contact and bring back the item. 
As the item is of personal nature, your discretion is essential. The client promises to reward you handsomely."

The mission agent shuffles nervously as I examine the mission details.


+ [Accept the mission]
    -> NextMissionStage
    
+ [Leave]
    -> dont_start_mission



== mission_start ==
~ CurrentMissionStage = NextMissionStage
~ NextMissionStage = "space_encounter"
{ FlyingInSpace && HasPerformedScan:
~ NextMissionStage = space_encounter
-> space_encounter
}

== space_encounter ==
~ CurrentMissionStage = space_encounter
~ NextMissionStage = found_freighter

~ CommMessage = " Alert, incoming navigational data "
{ CommMessage }
-> found_freighter

== found_freighter ==
~ CurrentMissionStage = found_freighter
~ NextMissionStage = return_to_mission_board

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

~ ExosuitAction = "ToxicityWarning"
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