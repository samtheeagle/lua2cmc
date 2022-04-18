-- Converts DCS keyboard config Lua file
-- (default in \Mods\aircrafts\<aircraft>\Input\<profile>\keyboard\default.lua)
-- to CH Control Manager CMC file

keymapping = {
  ['SysRQ'] = 'PRTSC',
  ['Scroll'] = 'SCRLK',
  ['Pause'] = 'PAUSE',

  ['Insert'] = 'KBINS',
  ['Delete'] = 'KBDEL',
  ['Home'] = 'KBHOME',
  ['End'] = 'KBEND',
  ['PageUp'] = 'KBPGUP',
  ['PageDown'] = 'KBPGDN',

  ['NumLock'] = 'NUMLOCK',
  ['Num.'] = 'KP.',
  ['Num0'] = 'KP0',
  ['Num1'] = 'KP1',
  ['Num2'] = 'KP2',
  ['Num3'] = 'KP3',
  ['Num4'] = 'KP4',
  ['Num5'] = 'KP5',
  ['Num6'] = 'KP6',
  ['Num7'] = 'KP7',
  ['Num8'] = 'KP8',
  ['Num9'] = 'KP9',
  ['Num/'] = 'KP/',
  ['Num*'] = 'KP*',
  ['Num-'] = 'KP-',
  ['Num+'] = 'KP+',
  ['NumEnter'] = 'KPENT',

  ['Esc'] = 'ESC',
  ['Tab'] = 'TAB',
  ['CapsLock'] = 'CAPS',

  ['LShift'] = 'LSHF',
  ['RShift'] = 'RSHF',
  ['LCtrl'] = 'LCTL',
  ['RCtrl'] = 'RCTL',
  ['LWin'] = 'LWIN',
  ['RWin'] = 'RWIN',
  ['LAlt'] = 'LALT',
  ['RAlt'] = 'RALT',

  ['Space'] = 'SPC',
  ['Back'] = 'BKSPC',
  ['Enter'] = 'ENT',

  ['Up'] = 'KBUP',
  ['Down'] = 'KBDOWN',
  ['Left'] = 'KBLEFT',
  ['Right'] = 'KBRIGHT',
  
  ['JOY_BTN1'] = '', -- Required for AJS37 default mapping which upsets CH Control Manager!
}

accents = {
  ['à'] = 'a',
  ['á'] = 'a',
  ['â'] = 'a',
  ['ã'] = 'a',
  ['ä'] = 'a',
  ['ç'] = 'c',
  ['è'] = 'e',
  ['é'] = 'e',
  ['ê'] = 'e',
  ['ë'] = 'e',
  ['ì'] = 'i',
  ['í'] = 'i',
  ['î'] = 'i',
  ['ï'] = 'i',
  ['ñ'] = 'n',
  ['ò'] = 'o',
  ['ó'] = 'o',
  ['ô'] = 'o',
  ['õ'] = 'o',
  ['ö'] = 'o',
  ['ù'] = 'u',
  ['ú'] = 'u',
  ['û'] = 'u',
  ['ü'] = 'u',
  ['ý'] = 'y',
  ['ÿ'] = 'y',
  ['À'] = 'A',
  ['Á'] = 'A',
  ['Â'] = 'A',
  ['Ã'] = 'A',
  ['Ä'] = 'A',
  ['Ç'] = 'C',
  ['È'] = 'E',
  ['É'] = 'E',
  ['Ê'] = 'E',
  ['Ë'] = 'E',
  ['Ì'] = 'I',
  ['Í'] = 'I',
  ['Î'] = 'I',
  ['Ï'] = 'I',
  ['Ñ'] = 'N',
  ['Ò'] = 'O',
  ['Ó'] = 'O',
  ['Ô'] = 'O',
  ['Õ'] = 'O',
  ['Ö'] = 'O',
  ['Ù'] = 'U',
  ['Ú'] = 'U',
  ['Û'] = 'U',
  ['Ü'] = 'U',
  ['Ý'] = 'Y',
}

abbreviations = {
--  ['Adjustment'] = 'Adj',
--  ['Aircraft'] = 'Acft',
--  ['Altimeter'] = 'Alt',
--  ['Altitude'] = 'Alt',
--  ['Autopilot'] = 'AP',
--  ['Button'] = 'Btn',
--  ['Camera'] = 'Cam',
--  ['Communication'] = 'Comm',
--  ['Coordinates'] = 'Coords',
--  ['Control'] = 'Ctl',
--  ['Course'] = 'Crs',
--  ['Decrease'] = 'Dec',
--  ['Designator'] = 'Des',
--  ['Flight'] = 'Flt',
--  ['Forward'] = 'Fwd',
--  ['Frequency'] = 'Freq',
--  ['Ground'] = 'Gnd',
--  ['Heading'] = 'Hdg',
--  ['Increase'] = 'Inc',
--  ['Kneeboard'] = 'Knbd',
--  ['Navigation'] = 'Nav',
--  ['Previous'] = 'Prev',
--  ['Radar'] = 'Rdr',
--  ['Range'] = 'Rng',
--  ['Ranging'] = 'Rng',
--  ['Reverse'] = 'Rev',
--  ['Target'] = 'Tgt',
--  ['Temperature'] = 'Temp',
--  ['Track'] = 'Trk',
}

-- Some of the input.lua files make a call to this function, but it cannot be reference by this script.
-- To work around this issue I have added this empty method with the same method signature. Hopefully
-- this won't negatively impact the output file created.
-- This seemed to affect the MI-8MTV2 and some of the FC3 aircraft.
function ignore_features(commands, features) end

function _(str) return str end

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then 
    io.close(f) 
	return true 
  else 
    return false
  end
end

function external_profile(p)
  --print(p)
  root = string.gsub(folder, "(.*\\)(.*\\.*\\.*\\.*\\.*\\.*\\)", "%1")
  --print(root)
  f = string.match(p, '^'..root) and p or root..p
  if not file_exists(f) then -- Required for AJS37 which uses a slightly different folder structure
    root = string.gsub(folder, "(.*\\)(.*\\.*\\.*\\.*\\.*\\)", "%1")
    f = string.match(p, '^'..root) and p or root..p
  end
  return dofile(f)
end

function join(t1, t2)
  for j, k in pairs(t2) do
    table.insert(t1, k)
  end
  return t1
end

function mapkey(key)
  -- there is a mapping for key
  if(keymapping[key]) then
    map = keymapping[key]
    -- key is a single uppercase letter character
  elseif(string.match(key, '^[A-Z]$')) then
    map = string.lower(key)
    -- F1 [ . ; ' 0-9 and so on
  else
    map = key
  end
  return map
end

function upperFirst( first, rest )
  return first:upper()..rest
end

function fixname(name)
  name = string.gsub(name, "(%a)([%w_']*)", upperFirst)					-- Uppercase the first letter of each word
  name = string.gsub(name, '^%s+', '')					        		-- Trim whitespace from the start of the string (I think?)
  name = string.gsub(name, '%s+$', '')					        		-- Trim whitespace from the end of the string (I think?)
  name = string.gsub(name, '[%s][-][%s]', ' ')			    			-- Replace space-dash-space with single space
  name = string.gsub(name, '[:]', '')									-- Remove colons
  name = string.gsub(name, '%s+', '_')					        		-- Replace spaces with underscores 
  name = string.gsub(name, "[%z\1-\127\194-\244][\128-\191]*", accents) -- Replace accented characters
  for original, abbreviation in pairsbykeys(abbreviations) do
  	name = string.gsub(name, original, abbreviations)	  				-- Abbreviate common words to reduce command name length
  end
  return name
end

function fixcategory(category)
  if (type(category) == "table") then
    category = table.concat(category, ',')
  end
  category = string.gsub(category, "(%a)([%w_']*)", upperFirst)
  category = string.gsub(category, '^%s+', '')
  category = string.gsub(category, '%s+$', '')
  return category
end

-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end

-- return an iterator for a table that sorts by key value
function pairsbykeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      				-- iterator variable
  local iter = function ()   	-- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

function processkeys(infile, name, key, keys, commands)
	-- insert HOLD at the beginning if reformers present
	if(#keys > 0) then
		table.insert(keys, 1, 'HOLD')
	end
	-- combine reformers and key
	table.insert(keys, key)
	
	-- get mappings for all keys
	for j, k in pairs(keys) do
		keys[j] = mapkey(k)
	end
	keys = table.concat(keys, ' ')
	
	-- add the command string to the set of commands for the category
	if(commands[name] ~= nil) then
		print(string.format('Command name clash - possible conflict: %s', name) .. '\n\t' .. infile)
	end
	commands[name] = string.format('%-65s %-21s', name, keys)
end

function getcommandsbycategory(cat)
	-- see if the category has already been encountered
	commands = commandsByCategory[cat]
	if(commands == nil) then
		-- if not create an empty table for the category commands
		commands = {}
		commandsByCategory[cat] = commands
	end
	return commands
end

function processfile(infile)
	if(infile:lower():match("[^\\]+$") == 'keyboard.diff.lua') then
		processuserdifffile(infile)
	else
		processstandardfile(infile)
	end
end

function processuserdifffile(infile)
	f = dofile(infile)
	userdiffs = f['keyDiffs']
	for k, v in pairs(userdiffs) do
		name = fixname(v['name'])
		cat = 'Custom Key Bindings'
		commands = getcommandsbycategory(cat)
		if (v['added'] ~= nil) then
			for i, c in ipairs(v['added']) do
				key = c['key']
				keys = c['reformers'] or {}
				processkeys(infile, name, key, keys, commands)
			end
		end
	end
end 

function processstandardfile(infile)
  folder = string.gsub(infile, "(.*\\)(.*)", "%1") -- dirname of infile
  f = dofile(infile)
  keyCommands = f['keyCommands']

  if(keyCommands ~= nil) then
    for i, cmd in ipairs(keyCommands) do
      name = fixname(cmd.name)
      cat = fixcategory(cmd.category or '<no category>')
      commands = getcommandsbycategory(cat)
      if(cmd.combos and #cmd.combos > 0) then
        key     = cmd.combos[1].key
        keys    = cmd.combos[1].reformers or {}
        processkeys(infile, name, key, keys, commands)
      else
        commands[name] = string.format('//%-65s %-21s', name, '')
      end
    end
  end
end

-- Get the output and input files from the command line arguments
args = {...}
outfile = args[1]
infiles = {select(2, unpack(args))}
commandsByCategory = {}

table.foreach(infiles, function(k,v) processfile(v) end)

out = io.open(outfile, "w")

for category in pairsbykeys(commandsByCategory) do
  out:write('/////////////////////////////////////\n')
  out:write(string.format('// %-65s\n', category))
  out:write('/////////////////////////////////////\n')
  for i,command in pairsbykeys(commandsByCategory[category]) do
    out:write(string.format('%-65s\n', command))
  end
end

io.close(out)
