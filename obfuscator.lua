--Obfuscation settings:
local options = {
    encodeStrings=false,
    ConstantEncode=false,
    Minify=true,
    AddComments=false,
    SmallerOutput=true;
}
--obfuscator
local loadstringName = "encode"
function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

--Load to binary algorithm
function EncodeBinary(Text)
    Text = tostring(Text)
    local Table = {}
    for i = 1, #Text do
    local T = Text:sub(i, i)
    table.insert(Table, T)
    end
    local T = {}
    local MyText = "'"
    for i, v in pairs(Table) do
    local Key = string.byte(v)
    MyText = MyText..math.floor(Key/128)
    Key = Key % 128
    MyText = MyText..math.floor(Key/64)
    Key = Key % 64
    MyText = MyText..math.floor(Key/32)
    Key = Key % 32
    MyText = MyText..math.floor(Key/16)
    Key = Key % 16
    MyText = MyText..math.floor(Key/8)
    Key = Key % 8
    MyText = MyText..math.floor(Key/4)
    Key = Key % 4
    MyText = MyText..math.floor(Key/2)
    Key = Key % 2
    MyText = MyText..math.floor(Key/1)
    Key = Key % 1
    MyText=MyText.."','"
    end
    MyText = MyText:sub(1, #MyText -1)
    if tonumber(MyText) then
    MyText = tonumber(MyText)
    end
    return MyText
    end


local __l_I_llIX = RandomVariable(30)
local __l_I_llIY = RandomVariable(30)
--encode algorithm ( thanks to stackoverflow )
local keyO = math.random(1, 999999999)
local keyT = math.random(1, 999999999)
    local Key53 = keyO
    local Key14 = keyT
  
    local inv256
  
    function enc(str)
      if not inv256 then
        inv256 = {}
        for M = 0, 127 do
          local inv = -1
          repeat inv = inv + 2
          until inv * (2*M + 1) % 256 == 1
          inv256[M] = inv
        end
      end
      local K, F = Key53, 16384 + Key14
      return (str:gsub('.',
        function(m)
          local L = K % 274877906944
          local H = (K - L) / 274877906944
          local M = H % 128
          m = m:byte()
          local c = (m * inv256[M] - (H - M) / 128) % 256
          K = L * F + H + c + m
          return ('%02x'):format(c)
        end
      ))
    end

-- Loadstring encode    
local function ToBytecode(msg)
        local encoded = msg:gsub(".", function(bb) return "\\" .. bb:byte() end) or msg .. "\""
        return encoded
    end
--Open a thread ( very simple )
Thread = io.open("script.lua", "r")
local scriptContent = Thread:read("*a")
Thread:close()
local newScript = scriptContent
local function splitter(input)
    local result = {}
    for non_word, word, final_non_word in input:gmatch "([^%w]*)(%w+)([^%w]*)" do
      if non_word ~= '' then
        table.insert(result, non_word)
      end
      table.insert(result, word)
      if final_non_word ~= '' then
        table.insert(result, final_non_word)
      end
    end
    return result
end
-- Smaller output option
if not options["SmallerOutput"] then
scriptContent = [[
    local function __lIIlI_lIlIllIIl(lI)
        if lI > 1 then
            lI = lI -math.random(1,9999)
            lI = lI /3123
            lI = lI *999
            lI = lI +1234
        else
            lI = lI +math.random(1,9999)
            lI = lI *3123
            lI = lI /999
            lI = lI -1234
        end
        if lI >= 999 then
            lIIllllIlIlllI_llIIl_IllIlIlIIIl = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X","Y", "Z", " ", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", "*", "'", "^", "~", "!"}
            for i,v in pairs(lIIllllIlIlllI_llIIl_IllIlIlIIIl) do
                if v == "a" or v == "A" or v == "b" or v == "B" or v == "z" or v == "x" or v == "!" or v == "L" or v == "o" then
                    lI = lI +321
                    return lI+999;
                end
            end
        else
            lIIllllIlIlllI_llIIl_IllIlIlIIIl = nil, "Can't decrypt"
            return lIIllllIlIlllI_llIIl_IllIlIlIIIl; 
        end
        return false
    end
  -- Watermark Check ( if you remove watermark code returns and script doest execute)
]] .. "getfenv().lelBallz = false; function loadGab1tzu() if _ == 'Secured by your obfuscator name' == true then " .. scriptContent .. [[  = false
 else
    return
]] .. " end end loadGab1tzu();"
 else
    -- Watermark Check x2 ( if you remove watermark code returns and script doest execute)
    scriptContent = "getfenv().lelBallz = false; function loadGab1tzu() if  _ == 'Secured by your obfuscator name' == true then " .. scriptContent .. [[ getfenv().Gab1tzu = false
 else
    return
]] .. " end end loadGab1tzu();"
end
scriptContent = splitter(scriptContent)

-- encode strings ( better security )
if options["encodeStrings"] then
newScript = "return(function(...)" .. [[
(({...})[1])[1]=(({...})[2])()[__l_I_llI(']] .. enc("game") .. [[')]; 
]] .. "" .. loadstringName .. "=loadstring;"
else
newScript = [[
return(function(...)
    (({...})[1])[1]=(({...})[2])()['game'];
]] .. "" .. loadstringName .. "=loadstring;"
end
--Obfuscating (main algorith encoding)
local count = 1
for i,v in pairs(scriptContent) do
    if count == 1 then
        local line 
        if options["encodeStrings"] then
            line = "(({...})[1])[1]=__l_I_llI('" .. enc(v) .. "');"
        else
            line = "(({...})[1])[1]=[[" .. v .. "]];"
        end
        newScript = newScript .. "\n" .. line
    else
        local line 
        if options["encodeStrings"] then
            if options["ConstantEncode"] then
                line = "(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count)) .. "'))]=(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count-1)) .. "'))] .. __l_I_llI('" .. enc(v) .. "')"
            else
                line = "(({...})[1])[" .. count .. "]=(({...})[1])[" .. count-1 .. "] .. __l_I_llI('" .. enc(v) .. "')"
            end
        else
            line = "(({...})[1])[" .. count .. "]=(({...})[1])[" .. count-1 .. "] .. [[" .. v .. "]]"
        end
        newScript = newScript .. "\n" .. line .. ";"
    end
    count = count +1
end


newScript = newScript .. [[encode(__l_I_llI(']] .. enc([[__i_l_llil = loadstring]]) .. "'))();" --Add check var

if options["ConstantEncode"] then
    newScript = newScript .. "if __i_l_lli == __i_l_llil then __i_l_lli" .. "(" .. "(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count-1)) .. "'))])() else while true do end end"
else
    newScript = newScript .. "__i_l_lli" .. "(" .. "(({...})[1])[" .. count-1 .. "])()"
end
if options["SmallerOutput"] then
    
else
end
-- comments
if options["AddComments"] then
    local comments = {
        "loadstring = print succesfull deobfuskation",
"You cant constant dump this lmao",
"Boronide 0.2.3 forks = math.huge",
"local devfuscator = prometheus",
"ilililil = crazy obfuscation",
"Luraph > this obfuscator",
"Anti Tamper Succesfully Loaded",
"luaseel > all",
"AztupBrew > IronBrew",
"ChatGPT < Using your brain",
"Incorrect Lua Version. Please Use LuaU",
"this is a fork btw",
"Warning: any attepmt in cracking this obfuscator will result in logging all your photos  (real)",
"'To know your Enemy, you must become your Enemy.' ― Sun Tzu",
"SunTzu qoutes are the best  (Real)",
"'Opportunities multiply as they are seized.' ― Sun Tzu",
"I love putting unfunny memes in the meme-strings",
"Moonsec V3 is actuallly good , nice job Federal",
"i love putting spam variable just to make the obf look more secure",
"imagine using krnl lol",
"This Obfuscator uses loadstrings , to make it work go to ServerScriptService > click on it and enable Loadstrings.",
"if someone makes a deobf on this i swear to god im gonna kill myself.",
"Fun Fact: Most of fun facts are not fun and they are unfunny",
"Warning : Krnl is banned from using this obf (real)",
    }
-- randomize meme-strings ( commnets )
    newScript = newScript:gsub(" ", function(c)
        if c == " " then
            return " --[[" .. comments[math.random(1, #comments)] ..  "]] "
        end
    end)
end
-- minify option 
if options["Minify"] then
    newScript = "" .. newScript:gsub("\n", " ")
end

newScript = newScript .. " end)({},getfenv,table.remove)"

--Add enc

local algorithm = tostring([[ local deobfuscated = false ]]  .. __l_I_llIX .. [[ = tonumber(']] .. ToBytecode(tostring(keyO)) .. [[') local ]] .. __l_I_llIY .. [[= tonumber(']] .. ToBytecode(tostring(keyT)) ..  [[') local inv256 function __l_I_llI(str) local K, F =]] .. __l_I_llIX .. [[, 16384 + ]] .. __l_I_llIY .. [[ return (str:gsub('%x%x', function(c) local L = K % 274877906944 local H = (K - L) / 274877906944 local M = H % 128 c = tonumber(c, 16) local m = (c + (H - M) / 128) * (2*M + 1) % 256 K = L * F + H + c + m return string.char(m) end )) end; __i_l_lli=loadstring; if loadstring ~= print and loadstring ~= warn and loadstring ~= setclipboard and loadstring ~= writefile then else while true do local Deobfuscated="no" end end]])
local Encoded = EncodeBinary(algorithm)
local finalAlgorithm = [[)_='Secured by your obfuscator name';local __IllIIIIl_IllI = ]].."table.concat({"..Encoded.."})"..[[ function _I_llIlIlIIl(str) local function _IIllIllI_to_string(_IlI) return string.char(tonumber(_IlI, 2));end;return (str:gsub("(".. ("[01]"):rep(8) .. ")", _IIllIllI_to_string));end;local _IIllIllI = __IllIIIIl_IllI _llIIl_IllI = _I_llIlIlIIl(_IIllIllI);loadstring(_llIIl_IllI)();]]

newScript = newScript:gsub('%)', finalAlgorithm:gsub('%%', '%%%%'), 1)

local watermark = ""

-- Add the watermark to the script
newScript = string.format([[
_, Protected_By_Your_Obfuscator_ = true

]], watermark) .. newScript

--Writing final output
Thread = io.open("output.lua", "w")
Thread:write(newScript)
Thread:close()
--Finished
print("yo shit was obfuscated")
