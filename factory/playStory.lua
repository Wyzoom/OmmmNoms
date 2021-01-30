--require('lpeg')
package.path = package.path .. ";../lib/?.lua"
local narrator = require('narrator.narrator')

local enums = require('narrator.enums')
local lume = require('narrator.libs.lume')
local Object = require('narrator.libs.classic')
local listMT = require('narrator.list.mt')




-- Parse a book from the Ink file.
local book = narrator.parseFile(arg[1])
--local book = narrator.parseFile('SimpleMission.ink',{save = false})


-- Init a story from the book
local story = narrator.initStory(book)

-- Begin the story
story:begin()

while story:canContinue() do
  
  -- Get current paragraphs to output
  local paragraphs = story:continue()

  for _, paragraph in ipairs(paragraphs) do
    local text = paragraph.text

    -- You can handle tags as you like, but we attach them to text here.
    if paragraph.tags then
      text = text .. ' #' .. table.concat(paragraph.tags, ' #')
    end

    -- Output text to the player
    print(text)
  end

  -- If there is no choice it seems like the game is over
  if not story:canChoose() then break end
  
  -- Get available choices and output them to the player
  local choices = story:getChoices()
  for i, choice in ipairs(choices) do
    print(i .. ') ' .. choice.text)
  end

  -- Read the choice from the player input
  local answer = tonumber(io.read())

  -- Send answer to the story to generate new paragraphs
  story:choose(answer)
end

