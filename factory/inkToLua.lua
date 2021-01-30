package.path = package.path .. ";../lib/?.lua"
local narrator = require('narrator.narrator')

local enums = require('narrator.enums')
local lume = require('narrator.libs.lume')
local Object = require('narrator.libs.classic')
local listMT = require('narrator.list.mt')


-- Parse a book from the Ink file and save it as a lua book object
local book = narrator.parseFile(arg[1],{save = true})
