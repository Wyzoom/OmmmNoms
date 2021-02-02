local narrator = require 'narrator.narrator'
local book = narrator.parseFile('ReadBook',{save = true})
local story = narrator.initStory(book)
local inspect = require 'inspect'


story:jumpTo('global_variables')
a = story.variables
print(inspect(a))

story:choose(1)
story:continue()

a = story.variables
print(inspect(a))

a = story.temp
print(inspect(a))

--print(inspect (book))


--print( string.format(story.constants.is_critical))

--local MissionCritical= tostring(story.constants.is_critical)
--print (tostring(story.constants.is_critical))
local bool_build = false

local MissionID = "SimpleMission" -- Name as you see Fit

local MissionClass = story.variables.mission_class



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
		<Property name="MissionClass" value=]] .. [["]].. MissionCritical .. [["]] .. [[/>
	]]

    MB_FrameOut=
    [[
        </Property>
    ]]

    SimpleMission = "".. MB_FrameIn .. MB_ID .. MB_Class .. MB_Critical .. MB_FrameOut .. ""
end

--print(story.variables.event_type)
--story:jumpTo('mission_pickup')
--print(story.variables.event_type)
print(SimpleMission)

NMS_MOD_DEFINITION_CONTAINER =
{
  ["MOD_FILENAME"] = "DMission.pak",
  ["MOD_AUTHOR"] = "Kiiritsugu",
  ["MOD_DESCRIPTION"] = [[Demo Mission]],
  ["NMS_VERSION"] = "3.10",
  ["MODIFICATIONS"] =
  {
    {
      ["PAK_FILE_SOURCE"] = "",
      ["MBIN_CHANGE_TABLE"] =
      {
        ["MBIN_FILE_SOURCE"] 	= "",
				["EXML_CHANGE_TABLE"] =
				{
					{
          }
        }
      }
    }
  }
}



