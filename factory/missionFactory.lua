--Imports
package.path = package.path .. ";../lib/?.lua"
local narrator = require 'narrator.narrator'

local book = narrator.parseFile('stories.Story.ink',{save = true})
local story = narrator.initStory(book)
local inspect = require 'inspect'


--a = book.constants
--print(inspect(a))

--story:jumpTo('global_variables')
--story:choose(1)
--story:continue()
--a = story.variables
--a = story.temp




--local MissionCritical= tostring(story.constants.is_critical)
--print (tostring(story.constants.is_critical))
local bool_build = true

local MissionID = "StoryMission" -- Name as you see Fit
local MissionClass = book.constants.MissionClass
local MissionCritical = book.constants.MissionCritical
local MissionObjective = book.constants.objective
local MissionTitle = book.constants.title
local MissionSubtitle = book.constants.subtitle
local MissionDescription = book.constants.description

SimpleMission =[[]] -- String output of MissionSequence

if(bool_build) then
    MB_FrameIn=
    [[
        <Property value="GcGenericMissionSequence.xml">
    ]]

    MB_ID =
    [[
		<Property name="MissionID" value=]] .. [["]] .. MissionID .. [["]] .. [[/>
	]]

    MB_Class =
    [[
		<Property name="MissionClass" value=]] .. [["]].. MissionClass .. [["]] .. [[/>
	]]

	MB_Critical =
    [[
		<Property name="MissionIsCritical" value=]] .. [["]].. MissionCritical .. [["]] .. [[/>
	]]
	MB_Objective =
    [[
		<Property name="MissionObjective" value=]] .. [["]].. MissionObjective .. [["]] .. [[/>
	]]
	MB_Titles = -- Needs to be replaced by language entry
    [[
		<Property name="MissionTitles" value="GcNumberedTextList.xml">
				<Property name="Format" value=]] .. [["]].. MissionTitle .. [["]] .. [[/>
				<Property name="Count" value="1"
			</Property>
	]]
	MB_Subtitles = -- Needs to be replaced by language entry
    [[
		<Property name="MissionSubtitles" value="GcNumberedTextList.xml">
				<Property name="Format" value=]] .. [["]].. MissionSubtitle .. [["]] .. [[/>
				<Property name="Count" value="1"
			</Property>
	]]
	MB_Descriptions = -- Needs to be replaced by language entry
    [[
		<Property name="MissionDescriptions" value="GcNumberedTextList.xml">
				<Property name="Format" value=]] .. [["]].. MissionDescription .. [["]] .. [[/>
				<Property name="Count" value="1"
			</Property>
	]]
	MB_ProcFill = -- Not Used properties
    [[
		<Property name="MissionProcDescriptionHeader" value="GcNumberedTextList.xml">
				<Property name="Format" value="" />
				<Property name="Count" value="1" />
			</Property>
		<Property name="MissionProcDescriptionA" value="GcNumberedTextList.xml">
				<Property name="Format" value="" />
				<Property name="Count" value="1" />
			</Property>
		<Property name="MissionProcDescriptionB" value="GcNumberedTextList.xml">
				<Property name="Format" value="" />
				<Property name="Count" value="1" />
			</Property>
		<Property name="MissionProcDescriptionC" value="GcNumberedTextList.xml">
				<Property name="Format" value="" />
				<Property name="Count" value="1" />
			</Property>
	]]
    MB_FrameOut=
    [[
        </Property>
    ]]

    SimpleMission = "".. MB_FrameIn .. MB_ID .. MB_Class .. MB_Critical .. MB_Objective .. MB_Titles .. MB_Subtitles .. MB_Descriptions .. MB_ProcFill .. MB_FrameOut .. ""
	print(SimpleMission)
end

--print(story.variables.event_type)
--story:jumpTo('mission_pickup')
--print(story.variables.event_type)


NMS_MOD_DEFINITION_CONTAINER =
{
  ["MOD_FILENAME"] 			= "BookBuilder.pak",
  ["MOD_AUTHOR"]				= "Kiiritsugu",
  ["MODIFICATIONS"] 		=
	{
		{
			["PAK_FILE_SOURCE"] 	= "",
			["MBIN_CHANGE_TABLE"] =
			{
				{
					["MBIN_FILE_SOURCE"] 	= "\\METADATA\\SIMULATION\\MISSIONS\\NPCMISSIONTABLE.MBIN",
					["EXML_CHANGE_TABLE"] =
					{
						{
							["PRECEDING_KEY_WORDS"] = {"" },
							["VALUE_CHANGE_TABLE"] 	=
							{
								{"IGNORE",	"IGNORE"},
							}
						},
					}
				},
			}
		},
	}
}



