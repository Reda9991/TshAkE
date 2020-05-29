--[[
BY:RIDHA MOHAMMED
@riida
           CH > @disco3
--]]
serpent = require('serpent')
serp = require 'serpent'.block
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
lgi = require ('lgi')
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
notify.init ("Telegram updates")
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_idkeko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_idkeko[1])
sudo_users = {sudo_add,bot_id,426795071}
URL33 = require('socket.url')
tdcli=dofile('./libs/utils.lua')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_tshake = database:smembers("files"..bot_id)
print(Blue.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_tshake) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(red.."\nList files \n\n\n"..reset)
io.popen("mkdir files_tshake")
print(Blue.."\n by Ridha mohammed ^_^  \n\n\n"..reset)
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
function keko_get_user( user )
    keko_hack = HTTPS.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id="..(database:get('keko:ch_username'..bot_id) or "@disco3").."&user_id="..user)
    if keko_hack and (keko_hack:match('"status":"left"') or keko_hack:match('USER_ID_INVALID') or keko_hack:match('kicked')) then 
        return "no"
    end 
    return "true"
end
--         »»                 Start Functions                         ««              --
--         »»                 is_sudo                         ««              --
function devboos(msg)  
local ta = false  
for k,v in pairs(sudo_users) do  
if msg.sender_user_id_ == v then  
ta = true  
end  end  
return ta  
end 
function is_devboos(user)  
local ta = false  
for k,v in pairs(sudo_users) do  
if user == v then  
ta = true  
end  end  
return ta  
end 
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if keko_add_sudo then var = true end return var
end
--         »»                 is_admin                         ««              --
function is_admin(msg)
user_id = msg.sender_user_id_
local var = false 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_admin                         ««              --
function ck_admin(user_id)
local var = false 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--------------------
function is_malik(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if malik then 
var = true 
end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
function is_malikid(user_id,chat_id)
local var = false
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if malik then 
var = true 
end
if admin then var = true end
return var
end
-------------
--         »»                 is_creator                         ««              --

function is_creatorbasic(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) 
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if creatorbasic then var = true end
if malik then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
function is_creatorbasicid(user_id,chat_id)
local var = false
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if creatorbasic then var = true end 
if admin then var = true end
return var
end
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) 
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) 
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if creatorbasic then var = true end
if malik then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_vip                         ««              --
function is_vip(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id)  
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id)  
local vip = database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if creatorbasic then var = true end
if malik then vae = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var end
o023121 = true
--         »»                 is_owner                         ««              --
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) 
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id)  
if owner then var = true end 
if admin then var = true end
if creator then var = true end
if malik then var = true end
if creatorbasic then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_mod                         ««              --
function is_setban(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('tshake:'..bot_id..'SET:BAN'..chat_id, user_id)  
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id)  
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if creatorbasic then var = true end
if malik then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creatorbasic = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id)  
local malik = database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id)  
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creatorbasic then var = true end
if creator then var = true end
if malik then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('tshake:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
end032 = o023121 or true
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
k2342 = io.open("Tshake.lua")
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
--         »»                 Rutba                  ««              --
function  Rutba(user_id,chat_id)
if is_devboos(user_id) then
var = 'المطور الاساسي'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'المطور' 
elseif database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) then
var = 'مالك المجموعه'
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'المنشئ اساسي'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'المنشئ'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'المدير'  
elseif database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id) then
var = 'الادمن'  
elseif database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = 'المميز'  
else  
var = 'العضو'
end  
return var
end 
function RemBot(user_id,chat_id)
if is_devboos(user_id) then
var = 'sudo1'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'sudo' 
elseif database:sismember('tshake:'..bot_id..'malik:'..chat_id, user_id) then
var = 'malik1'
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'creato1'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'creato'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'owner'  
else  
var = 'No'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember("thsake:gog"..bot_id, chat_id) then
var = true
else 
var = false
end
return var
end
--         »»                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--         »»                 do_notify                         ««              --
function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         »»                 vardump                         ««              --
local function sendtext(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end

function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 

local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "TshAkE TEAM")..'', url=''..(channel_user_ts or 't.me/disco3_files')..''},
},
}
local keko = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
keko = keko .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق تشاكي لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
keko = keko .. '&disable_web_page_preview=true'
end
if text then
keko = keko..'&text='..URL33.escape(text2)
end
if parse_mode then
keko = keko .. '&parse_mode='..parse_mode
end
keko = keko..'&reply_markup='..JSON.encode(keyboard)
https.request(keko)
else
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end
local function SendText(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         »»                 add_user                         ««              --
function add_user(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --
local o0321 = o023121
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end
info = '💬¦بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_disco3(disco31,disco32,disco33)
local id_disco3 = disco32.sender_user_id_
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end
info = '🤖¦ العضو »> ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_disco3, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_disco3)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end
info = '🤖¦ العضو »> ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'disco3')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
vardump(Json_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
SendText(msg.chat_id_,msg.id_,'\n🚸¦ صلاحياته منشئ الكروب 🍃')   
return false  end 
if Json_Info.result.status == "member" then
SendText(msg.chat_id_,msg.id_,'\n🚸¦ مجرد عضو هنا 🍃')   
return false  end
if Json_Info.result.status == 'left' then
SendText(msg.chat_id_,msg.id_,'\n🚸¦ الشخص غير موجود هنا 🍃')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = ' ✓'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = ' ✓'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = ' ✓'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = ' ✓'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = ' ✓'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = ' ✓'
else
promote = '✘'
end
SendText(chat,msg.id_,'\n📌¦ الرتبة : مشرف 🍃 '..'\n💢¦ والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n📋¦ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨¦ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷¦ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻¦ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘¦ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸¦ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
--         »»                 End Functions                         ««              --
function TSadd(msg) -- Function add && rem
local text = msg.content_.text_
if (text == 'تعطيل') and not is_sudo(msg) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '💬¦بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕¦المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️¦تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
database:del('tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦قام بتعطيل مجموعه \n🎫¦ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️¦اسم المجموعه ~⪼ ("..k2.title_..")\n📎¦رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2)
--
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️¦انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
-- end function
if (text == 'تفعيل') and not is_sudo(msg) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '☸¦المستخدم~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(keko)
local data2 = json:decode(stats)
local kekon = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(kekon) or tonumber(data2.result) > tonumber(kekon))) then
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕¦المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔¦قام بتفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error"))
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦قام بتفعيل مجموعه \n🎫¦ايدي المالك ~⪼ ("..msg.sender_user_id_..")\n☑️¦معرف المالك~⪼ @"..(result.username_ or "لا يوجد").."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️¦اسم المجموعه ~⪼ ("..k2.title_..")\n📎¦رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2)
--
if data.result.can_promote_members  then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
database:sadd('tshake:'..bot_id..'malik:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️¦المجموعه قليله لا يمكن تفعيلها", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️¦انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
if text == "تفعيل" and is_sudo(msg) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '💬¦بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕¦المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️¦تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error"))
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦قام بتفعيل مجموعه \n🎫¦ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️¦اسم المجموعه ~⪼ ("..k2.title_..")\n📎¦رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2)
--
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '💬¦بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'disco3')..')\n'
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕¦المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️¦تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
--
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error"))
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘¦قام تعطيل مجموعه \n🎫¦ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️¦اسم المجموعه ~⪼ ("..k2.title_..")\n📎¦رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2)
--
end
end
getUser(msg.sender_user_id_, TSby)
end
end
function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
end
--         »»               Start tshake lock                       ««              --
if is_mod (msg) then
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التاك")
else
tsX000("lock",msg,"✔¦تم قفل التاك")
database:set("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الشارحه")
else
tsX000("lock",msg,"✔¦تم قفل الشارحه")
database:set("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل تعديل الميديا") then
local tsX_o = database:get("ridha:lock:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"¦ بالفعل تم قفل تعديل المديا")
else
tsX000("lock",msg,"¦تم قفل تعديل الميديا")
database:set("ridha:lock:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدخول") then
local tsX_o = database:get("lock_join:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الدخول")
else
tsX000("lock",msg,"✔¦تم فتح الدخول للمجموعه")
database:del("lock_join:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكلايش") then
local tsX_o = database:get("lock_word:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الكلايش")
else
tsX000("lock",msg,"✔¦تم قفل الكلايش")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدخول") then
local tsX_o = database:get("lock_join:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الدخول للمجموعه ")
else
tsX000("lock",msg,"✔¦تم قفل الدخول للمجموعه ")
database:set("lock_join:tshake"..msg.chat_id_..bot_id,"ok")
end
end 
if (text == "قفل التعديل") then
local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التعديل")
else
tsX000("lock",msg,"✔¦تم قفل التعديل")
database:set("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل بالتحذير") then
local tsX_o = database:get("editmsg2"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التعديل")
else
tsX000("lock",msg,"✔¦تم قفل التعديل")
database:set("editmsg2"..msg.chat_id_..bot_id,"ok")
end
end

if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التكرار")
else
tsX000("lock",msg,"✔¦تم قفل التكرار")
database:set("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل المتحركه")
else
tsX000("lock",msg,"✔¦تم قفل المتحركه")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الملفات")
else
tsX000("lock",msg,"✔¦تم قفل الملفات")
database:set("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الماركدون")
else
tsX000("lock",msg,"✔¦تم قفل الماركدون")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الصور")
else
tsX000("lock",msg,"✔¦تم قفل الصور")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الملصقات")
else
tsX000("lock",msg,"✔¦تم قفل الملصقات")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الفيديو")
else
tsX000("lock",msg,"✔¦تم قفل الفيديو")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الانلاين")
else
tsX000("lock",msg,"✔¦تم قفل الانلاين")
database:set("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الدردشه")
else
tsX000("lock",msg,"✔¦تم قفل الدردشه")
database:set("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التوجيه")
else
tsX000("lock",msg,"✔¦تم قفل التوجيه")
database:set("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل التثبيت")
else
tsX000("lock",msg,"✔¦تم قفل التثبيت")
database:set("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الاغاني")
else
tsX000("lock",msg,"✔¦تم قفل الاغاني")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الصوت")
else
tsX000("lock",msg,"✔¦تم قفل الصوت")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الجهات")
else
tsX000("lock",msg,"✔¦تم قفل الجهات")
database:set("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل العربيه") then
local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل العربيه")
else
tsX000("lock",msg,"✔¦تم قفل العربيه")
database:set("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الانكليزيه")
else
tsX000("lock",msg,"✔¦تم قفل الانكليزيه")
database:set("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الميديا")
else
tsX000("lock",msg,"✔¦تم قفل الميديا")
database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الروابط")
else
tsX000("lock",msg,"✔¦تم قفل الروابط")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المعرف") then
local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل المعرف")
else
tsX000("lock",msg,"✔¦تم قفل المعرف")
database:set("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل الاشعارات")
else
tsX000("lock",msg,"✔¦تم قفل الاشعارات")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل البوتات بالطرد")
else
tsX000("lock",msg,"✔¦تم قفل البوتات بالطرد")
database:set("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل البوتات")
else
tsX000("lock",msg,"✔¦تم قفل البوتات")
database:set("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم قفل بصمه فيديو")
else
tsX000("lock",msg,"✔¦تم قفل بصمه فيديو")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكل") then
database:set("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐¦ تم قفل جميع الاوامر ")
end
--         »»                 End tshake lock                         ««              --
--         »»               Start tshake unlock                       ««              --
if (text == "فتح الكل") then
database:del("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"⚠️¦ تم فتح جميع الاوامر ")
end
end
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الاشعارات")
else
tsX000("lock",msg,"✔¦تم فتح الاشعارات")
database:del("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح التاك")
else
tsX000("lock",msg,"✔¦تم فتح التاك")
database:del("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الكلايش")
else
tsX000("lock",msg,"✔¦تم فتح الكلايش")
database:del("lock_word:tshake"..msg.chat_id_..bot_id)
end
end
if (text == "فتح تعديل الميديا") then
local tsX_o = database:get("ridha:lock:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح ")
else
tsX000("lock",msg,"✔¦تم فتح تعديل الميديا")
database:del("ridha:lock:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الشارحه")
else
tsX000("lock",msg,"✔¦تم فتح الشارحه")
database:del("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح التكرار")
else
tsX000("lock",msg,"✔¦تم فتح التكرار")
database:del("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") then
local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح التعديل")
else
tsX000("lock",msg,"✔¦تم فتح التعديل")
database:del("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح المتحركه")
else
tsX000("lock",msg,"✔¦تم فتح المتحركه")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الملفات")
else
tsX000("lock",msg,"✔¦تم فتح الملفات")
database:del("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الماركدون")
else
tsX000("lock",msg,"✔¦تم فتح الماركدون")
database:del("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الصور")
else
tsX000("lock",msg,"✔¦تم فتح الصور")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الملصقات")
else
tsX000("lock",msg,"✔¦تم فتح الملصقات")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الفيديو")
else
tsX000("lock",msg,"✔¦تم فتح الفيديو")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الانلاين")
else
tsX000("lock",msg,"✔¦تم فتح الانلاين")
database:del("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الدردشه")
else
tsX000("lock",msg,"✔¦تم فتح الدردشه")
database:del("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح التوجيه")
else
tsX000("lock",msg,"✔¦تم فتح التوجيه")
database:del("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح التثبيت")
else
tsX000("lock",msg,"✔¦تم فتح التثبيت")
database:del("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الاغاني")
else
tsX000("lock",msg,"✔¦تم فتح الاغاني")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الصوت")
else
tsX000("lock",msg,"✔¦تم فتح الصوت")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح البوتات بالطرد")
else
tsX000("lock",msg,"✔¦تم فتح البوتات بالطرد")
database:del("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الجهات")
else
tsX000("lock",msg,"✔¦تم فتح الجهات")
database:del("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح العربيه") then
local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح العربيه")
else
tsX000("lock",msg,"✔¦تم فتح العربيه")
database:del("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الانكليزيه")
else
tsX000("lock",msg,"✔¦تم فتح الانكليزيه")
database:del("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الميديا")
else
tsX000("lock",msg,"✔¦تم فتح الميديا")
database:del("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المعرف") then
local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح المعرف")
else
tsX000("lock",msg,"✔¦تم فتح المعرف")
database:del("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح بصمه فيديو")
else
tsX000("lock",msg,"✔¦تم فتح بصمه فيديو")
database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح الروابط")
else
tsX000("lock",msg,"✔¦تم فتح الروابط")
database:del("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"✔¦بالفعل تم فتح البوتات")
else
tsX000("lock",msg,"✔¦تم فتح البوتات")
database:del("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
end
end  --         »»               End tshake unlock                       ««              --
end
--         »»               Start Function Check Msg                       ««              --
function TSCheckMsg(msg)
local text = msg.content_.text_
if text then
if database:get("lock_word:tshake"..msg.chat_id_..bot_id) then
local tshake_wr = (database:get("tshake:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(tshake_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if  msg.content_.ID == "MessageChatJoinByLink" then
if database:get("lock_join:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers"  then
if database:get("lock_join:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return "stop"
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
end

if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'tshake:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
database:set('tshake:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️¦تم كشف عمليه تخريب في المجموعة \n‼️¦وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🎫¦الايدي ~⪼*('..msg.sender_user_id_..')* \n❕¦قمت بعمل تكرار للرسائل المحدده\n✔¦وتم كتمك في المجموعه\n', 1, 'md')
end
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end -- end fun
--         »»               Start Function Sudo                       ««              --
function TSsudo(msg)
text = msg.content_.text_
if msg.content_.text_ then
if text:match("^مغادره$") then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
if not database:get('tshake:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "✔¦تم مغادره المجموعه", 1, 'md')
else
end
end
------------
if text == ("رفع المالك") and msg.reply_to_message_id_ then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
function promote_by_reply(extra, result, success)
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, result.id_)
database:sadd('tshake:'..bot_id..'malik:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'*☑¦ تم رفعه مالك في البوت ،!*')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع المالك @(.*)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
local apmd = {string.match(text, "^(رفع المالك) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n*")   
return false 
end      
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, result.id_)
database:sadd('tshake:'..bot_id..'malik:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n☑¦ تم رفعه مالك في البوت ،! '
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^رفع المالك (%d+)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
local apmd = {string.match(text, "^(رفع المالك) (%d+)$")}
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, result.id_)
database:sadd('tshake:'..bot_id..'malik:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"*☑¦ تم رفعه مالك في البوت ،!*")
return false
end
if text == ("تنزيل المالك") and msg.reply_to_message_id_ then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
function promote_by_reply(extra, result, success)
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'*☑¦ تم تنزيله مالك من البوت ،!*')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^تنزيل المالك @(.*)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
local apmd = {string.match(text, "^(تنزيل المالك) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n*☑¦ تم تنزيله مالك من البوت*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^تنزيل المالك (%d+)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end end
local apmd = {string.match(text, "^(تنزيل المالك) (%d+)$")}
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"*☑¦ تم تنزيله مالك من البوت ،!*")
return false
end
------------------------------------------------------------------------
if text == 'توجيه خاص' and tonumber(msg.reply_to_message_id_) > 0 then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('tshake:'..bot_id.."userss")
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('tshake:'..bot_id.."userss")  
local text = '♻¦ تم ارسال توجيه الى *{ '..gps..' }* مشترك في الخاص'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
------------------------------------------------------------------------
if text:match("^تنظيف المشتركين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local pv = database:smembers('tshake:'..bot_id.."userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem('tshake:'..bot_id.."userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖¦ لا يوجد مشتركين وهميين في البوت \n', 1, 'md')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_, 1,'🔖¦ عدد المشتركين الان ↫ ( '..#pv..' )\n📬¦ تم ازالة ↫ ( '..sendok..' ) من المشتركين\n📌¦ الان عدد المشتركين الحقيقي ↫ ( '..ok..' ) مشترك \n', 1, 'md')   
end
end
end,nil)
end,nil)
end
return false
end
------------------------------------------------------------------------
if text:match("^تنظيف الكروبات$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local group = database:smembers('tshake:'..bot_id..'groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_, 1,'📬¦ لا يوجد مجموعات وهميه في البوت\n', 1, 'md')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*🚸¦ تم ازالة ↫ ❪ '..q..' ❫ مجموعات من البوت*'
end
if w == 0 then
storm = ''
else
storm = '\n*📬¦ تم ازالة ↫ ❪'..w..'❫ مجموعه لان البوت عضو*'
end
send(msg.chat_id_, msg.id_, 1,'*🔖¦ عدد المجموعات الان ↫ ( '..#group..' )*'..storm..''..taha..'\n*📌¦ الان عدد المجموعات الحقيقي ↫ ( '..sendok..' ) مجموعات*\n', 1, 'md')   
end
end
end,nil)
end
return false
end
if text and text == "اذاعه" then
if (not database:get('tshake:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '✔¦ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "tshake"
else
send(msg.chat_id_, msg.id_, 1, '✔¦ الاذاعه معطله ', 1, 'md')
end
end
if (text:match("^عدد الكروبات$") or text:match("^الاحصائيات$")) and is_vip(msg) then
local gps = database:scard('tshake:'..bot_id.."groups") or 0
local user = database:scard('tshake:'..bot_id.."userss") or 0
local gps2 = database:scard("thsake:gog"..bot_id) or 0
local gps9 = database:scard("thsake:good"..bot_id..os.date("%d")) or 0
local gps3 = database:scard('tshake:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊¦عدد الكروبات الكلي ~⪼  *{'..gps..'}*\n🔋¦عدد الكروبات المفعله ~⪼  *{'..gps2..'}*\n🔌¦عدد الكروبات الغير مفعله ~⪼  *{'..(gps - gps2)..'}*\n💡¦عدد الكروبات المدفوعه ~⪼  *{'..(gps3)..'}*\n⏱¦عدد الكروبات المتفاعله اليوم ~⪼  *{'..(gps9)..'}*\n\n• الاعضاء :\n👥¦ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("thsake:gog"..bot_id, gps[i])
database:set('tshake:'..bot_id.."enable:"..gps[i],true)
database:set( 'tshake:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🔋¦تم تفعيل ~⪼  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."enable:"..gps[i])
database:del( 'tshake:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌¦تم تعطيل ~⪼  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣¦تم مغادره ~⪼  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('tshake:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."groups")
end
end
if text:match("^روابط الكروبات$") then
local gpss = database:smembers('tshake:'..bot_id.."groups") or 0
text233 = '📊¦روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('tshake:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('TshAkE.txt', 'w')
f:write(text233)
f:close()
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'TshAkE.txt' .. '"'
io.popen(curl)
end
if text and (text == "الكروبات المتفاعله" or text == "روابط الكروبات المتفاعله") then
local gpss = database:smembers("thsake:good"..bot_id..os.date("%d")) or 0
text233 = '📊¦روابط الكروبات المتفاعله\n\n'
for i=1, #gpss do
local link = database:get('tshake:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('TshAkE.txt', 'w')
f:write(text233)
f:close()
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'TshAkE.txt' .. '"'
io.popen(curl)
end
if text:match("^تحديث السورس$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔¦*تم جلب التحديثات*', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('cd libs && wget https://raw.githubusercontent.com/Reda9991/Tshake/master/libs/utils.lua')
os.execute('rm -rf Tshake.lua')
os.execute('wget https://raw.githubusercontent.com/Reda9991/Tshake/master/Tshake.lua')
os.exit()
return false
end
if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'tshake:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘¦تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘¦وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕¦عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end
if text:match("^مغادره (-%d+)$")  then
local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘¦المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
database:del("thsake:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local txt = {string.match(text, "^(المده1) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '✔¦المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '✔¦تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘¦قام بتفعيل مجموعه المده كانت 30 يوم \n🎫¦ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ "..keko_info.."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ¦اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '✔¦المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '✔¦تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘¦قام بتفعيل مجموعه المده كانت 90 يوم \n🎫¦ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ "..keko_info.."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ¦اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'tshake:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '✔¦المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '✔¦تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘¦قام بتفعيل مجموعه المده كانت لا نهائية \n🎫¦ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜¦معرف المطور ~⪼ "..keko_info.."\n🌐¦معلومات المجموعه \n\n🎫¦ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ¦اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (msg.content_.text_ == 'الملفات' ) then
local files_tshake = database:smembers("files"..bot_id)
local keko = io.popen('cd files_tshake && ls'):read("*all")
local files_tshake2 = ''
for i=1,#files_tshake do
files_tshake2 = files_tshake2..'{'..files_tshake[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '✔¦جميع الملفات : \n '..keko..'\n ---------------------- \n\n✔¦الملفات المفعله \n'..files_tshake2..'', 1, 'html')
end
text = msg.content_.text_
if text then
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/Reda9991/files_tshake/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = "\n📂¦اهلا بك في متجر الملفات \n📮¦الملفات الموجوده حاليا \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n\n"
local TextE = "\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n📌¦تدل علامة (✔) الملف مفعل\n".."📌¦تدل علامة (✖) الملف معطل\n"
local NumFile = 0
for name in pairs(res.plugins_) do
local Check_File_is_Found = io.open("files_tshake/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."~⪼* {`"..name..'`} » '..CeckFile..'\n[- Info file](t.me/files_info)\n'
end
send(msg.chat_id_, msg.id_, 1,TextS..TextE, 1, 'md') 
end
else
send(msg.chat_id_, msg.id_, 1,"📮¦ لا يوجد اتصال من ال api \n", 1, 'md') 
end
return false
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_tshake/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*🗂¦ الملف » {"..file.."}\n📬¦ تم تعطيله وحذفه بنجاح \n✓*"
database:srem("files"..bot_id,file)
else
t = "*📬¦ بالتاكيد تم تعطيل وحذف ملف » {"..file.."} \n✓*"
database:srem("files"..bot_id,file)
end
local json_file, res = https.request("https://raw.githubusercontent.com/Reda9991/files_tshake/master/files_tshake/"..file)
if res == 200 then
os.execute("rm -fr files_tshake/"..file)
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
dofile('Tshake.lua')  
else
send(msg.chat_id_, msg.id_, 1,"*📮¦ عذرا لا يوجد هكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_tshake/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*📬¦ بالتاكيد تم تنزيل وتفعيل ملف » {"..file.."} \n✓*"
database:sadd("files"..bot_id,file)
else
t = "*🗂¦ الملف » {"..file.."}\n📬¦ تم تنزيله وتفعيله بنجاح \n💥*"
database:sadd("files"..bot_id,file)
end
local json_file, res = https.request("https://raw.githubusercontent.com/Reda9991/files_tshake/master/files_tshake/"..file)
if res == 200 then
local chek = io.open("files_tshake/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
dofile('Tshake.lua')  
else
send(msg.chat_id_, msg.id_, 1,"*📮¦ عذرا لا يوجد هكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end
if text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖¦تم تعطيل {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(مسح جميع الملفات)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑¦تم حذف جميع الملفات", 1, 'html')
end
if text:match("^(حذف ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(حذف ملف) (.*)(.lua)$")}
io.popen("rm -fr files_tshake/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖¦تم حذف {"..name_t[2]..".lua}", 1, 'html')
end
if text:match("^(جلب ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(جلب ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡¦ انتظر بعض الوقت وسيتم جلب \n 📁¦ملف : {"..name_t[2]..".lua}", 1, 'html')
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_tshake/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end
end -- end if sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text then
if (text and text == 'تفعيل الانلاين' ) then
database:set('key_ts'..bot_id,"yes")
send(msg.chat_id_, msg.id_, 1, "✔¦تم تفعيل خاصيه الازرار الشفافه", 1, 'html')
end
if (text and text == 'تعطيل الانلاين') then
database:del('key_ts'..bot_id)
send(msg.chat_id_, msg.id_, 1, "⚠¦تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
end
if text:match("^(تغير نص الانلاين) (.*)$") then
local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
database:set("channel_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡¦تم تغير النص ~⪼ {"..name_t[2].."}", 1, 'html')
end

if text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
database:set("channel_user_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡¦تم تغير الرابط ~⪼ {"..name_t[2].."}", 1, 'html')
end
end

end --sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text == 'تفعيل التفعيل التلقائي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "✔¦تم تفعيل التفعيل التلقائي", 1, 'html')
end
if (text == 'تعطيل التفعيل التلقائي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "❎¦تم تعطيل التفعيل التلقائي", 1, 'html')
end
if text == 'توجيه للكل' and tonumber(msg.reply_to_message_id_) > 0  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('tshake:'..bot_id..'groups') 
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('tshake:'..bot_id.."groups")  
local text = '🚸 ❯❯ تم ارسال توجيه الى *{ '..gps..' }* مجموعات'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
if text:match("^(تعين عدد الاعضاء) (.*)$") then
local kekoj = {string.match(text, "^(تعين عدد الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,kekoj[2])
send(msg.chat_id_, msg.id_, 1, "🔘¦ تم تعين : "..kekoj[2], 1, 'html')
end
end
end
end -- end function sudo

function tshake_run_file(data)
local files_tshake = database:smembers("files"..bot_id)
for i=1,#files_tshake do
local tshakeee = dofile("files_tshake/"..files_tshake[i])
local kt = tshakeee.keko_tshake(data)
if kt == 'end' then
return false
end
end
end
function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '✔¦تم وضع صوره للمجموعه', 1, 'md')
database:del('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
if text then
-------------------------------------------
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return false
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
if database:get( 'tshake:'..bot_id.."enable:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."enable:"..msg.chat_id_)
for k,v in pairs(sudo_users) do
end
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('tshake:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
end
end
end
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
database:incr('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('tshake:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '❕¦قم بارسال المنشور من القناة', 1, 'md')
database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊¦عدد المشاهدات ~⪼ <b>('..msg.views_..')</b> ', 1, 'html')
database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
end
end
if msg.content_.members_ then
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
if text and is_malik(msg) then
if text == 'المنشئين الاساسين' and is_malik(msg) then
local list = database:smembers('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_)
if #list == 0 then
text = "❗️¦ لا يوجد منشئين اساسين "
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
text = "🛅¦قائمة المنشئين الاساسيين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
 if text == ("مسح الاساسين") then
text = '✔¦تم مسح قائمه المنشئين الاساسين'
database:del('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
return false
end
if text:match("^رفع منشئ اساسي$") and msg.reply_to_message_id_ then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
function promote_by_reply(extra, result, success)
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'*✔¦تم رفعة منشئ اساسي  في البوت*')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع منشئ اساسي @(.*)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
local apmd = {string.match(text, "^(رفع منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n¦ *✔¦تم رفعة منشئ اساسي  في البوت*  '
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع منشئ اساسي (%d+)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
local apmd = {string.match(text, "^(رفع منشئ اساسي) (%d+)$")}
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"*✔¦تم رفعة منشئ اساسي  في البوت*")
end
if text:match("^تنزيل منشئ اساسي$") and msg.reply_to_message_id_ then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
function promote_by_reply(extra, result, success)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'*✔¦تم تنزيله منشئ اساسي من البوت*')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل منشئ اساسي @(.*)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n¦ *✔¦تم تنزيله منشئ اساسي من البوت*  '
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^تنزيل منشئ اساسي (%d+)$") then
local res = https.request('https://riida22.ibuser.xyz/ridha?id='..msg.sender_user_id_..'')
 
if res then
if res == 'false' then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @disco3 🤖️\n', 1, 'html')   
return false end
if res == 'kicked' then
 hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'عذراً انتا محظور من جميع بوتات السورس \n راسل مطورين السورس لمعرفه سبب الحظر @disco3', 1, 'html')   
return false end
end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) (%d+)$")}
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"*✔¦تم تنزيله منشئ اساسي من البوت*")
end
end
if text:match("^رفع منشئ$") and (is_malik(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function promote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'*✔¦بالفعل تم رفعه منشئ*')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'✔¦تم رفعه منشئ')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع منشئ @(.*)$") and (is_malik(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apmd = {string.match(text, "^(رفع منشئ) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n✔¦تم رفعه منشئ'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع منشئ (%d+)$") and (is_malik(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apmd = {string.match(text, "^(رفع منشئ) (%d+)$")}
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"✔¦تم رفعه منشئ")
end
if text:match("^تنزيل منشئ$") and (is_malik(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*✔¦ بالفعل تم تنزيله من منشئ في البوت*")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"*✔¦ تم تنزيله من منشئ في البوت*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
if text:match("^تنزيل منشئ @(.*)$") and (is_malik(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n✔¦تم تنزيله من منشئ في البوت'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
if text:match("^تنزيل منشئ (%d+)$") and (is_malik(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"*✔¦ تم تنزيله من منشئ في البوت*")
end
if text == ("المنشئين") and (is_malik(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅¦قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️¦ لا يوجد منشئين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^رفع ادمن$")  and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function promote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'*☑¦بالفعل تم رفعه ادمن*')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'*☑¦تم رفعه ادمن*')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '👤¦العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n*☑¦تم رفعه ادمن*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع ادمن (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"☑¦تم رفعه ادمن")
end
if text:match("^تنزيل ادمن$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*☑¦ بالفعل تم تنزيله من ادمنيه البوت*")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"*☑¦ تم تنزيله من ادمنيه البوت*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
if text:match("^تنزيل ادمن @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤¦العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n*☑¦تم تنزيله من ادمنيه البوت*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
if text:match("^تنزيل ادمن (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"*☑¦ تم تنزيله من ادمنيه البوت*")
end
if (text:match("^رفع عضو مميز$") or text:match("^رفع مميز$"))  and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*☑¦بالفعل تم رفعه عضو مميز*")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"*☑¦تم رفعه عضو مميز*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
local text = text:gsub('رفع مميز','رفع عضو مميز')
if text:match("^رفع عضو مميز @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^(رفع عضو مميز) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
texts = '👤¦العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n*☑¦تم رفعه عضو مميز*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
local text = text:gsub('رفع مميز','رفع عضو مميز')
if text:match("^رفع عضو مميز (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^(رفع عضو مميز) (%d+)$")}
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"*☑¦تم رفعه عضو مميز*")
end
if text and text == "تعين الايدي" and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1,  '✔¦ ارسل الان النص\n✔¦ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#photos` > عدد صور المستخدم\n- `#id` > ايدي المستخدم\n- `#auto` > تفاعل المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات\n- `#game` > المجوهرات', 1, 'md')
database:set("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'tshake')
return "tshake"
end
if (text and text == 'قفل تعديل المجموعه')  and  (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("group_edit:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
database:set("group_edit:tshake"..msg.chat_id_..bot_id,true)
tsX000("lock",msg,"📝تم قفل تعديل المجموعه ✓")
else
tsX000("lock",msg,"📝تم قفل تعديل المجموعه بالفعل✓")
end
end
if (text and text == 'فتح تعديل المجموعه')  and  (is_creator(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("group_edit:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"📝 بالفعل فتح تعديل المجموعه ✓")
else
tsX000("lock",msg,"📝تم فتح تعديل المجموعه ✓")
database:del("group_edit:tshake"..msg.chat_id_..bot_id)
end
end
if text and (is_owner(msg) or is_creatorbasic(msg)) and database:get("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then
database:del("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,  '✔¦ تم الحفض بنجاح', 1, 'md')
database:set("tshake:gr:id:text:"..bot_id..msg.chat_id_,text)
end
if text and text == "مسح الايدي" and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1,  '✖¦ تم المسح بنجاح', 1, 'md')
database:del("tshake:gr:id:text:"..bot_id..msg.chat_id_)
end
if (text:match("^تنزيل عضو مميز$") or text:match("^تنزيل مميز$")) and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*✔¦بالفعل تم تنزيله من اعضاء المميزين*")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"*✔¦تم تنزيله من الاعضاء المميزين*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
if text:match("^تنزيل عضو مميز @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل عضو مميز) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n*✔¦تم تنزيله من الاعضاء المميزين*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
if text:match("^تنزيل عضو مميز (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل عضو مميز) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"*✔¦تم تنزيله من الاعضاء المميزين*")
end
if text:match("^حظر$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الحظر معطل داخل المجموعه', 1, 'md')
return "tshakke"
end
function ban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع حظر \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔¦بالفعل تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"✔¦تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end

if text:match("^حظر @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الحظر معطل داخل المجموعه', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^(حظر) @(.*)$")}
function ban_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع حظر \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apba[2] or 'disco3')..')\n✔¦تم حظره من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],ban_by_username)
end

if text:match("^حظر (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الحظر معطل داخل المجموعه', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع حظر \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
chat_kick(msg.chat_id_, apba[2])
tsX000(apba[2],msg,"✔¦تم حظره من المجموعه")
end
end
if text:match("^رفع القيود$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function clear_all1(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
local hash1 =  'tshake:'..bot_id..'banned:'..msg.chat_id_
database:del(hash, result.sender_user_id_)
database:del(hash1, result.sender_user_id_)
tsX000("prore",msg,"✔¦تم تحريره من القيود")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,clear_all1)
end
if text:match("^رفع القيود @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(رفع القيود) @(.*)$")}
function clear_all(extra, result, success)
if result.id_ then
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '💁🏻‍♂️※ العضو ✓['..result.title_..'](t.me/'..(apba[2] or 'disco3')..')\n✔¦تم تحريره من القيود'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],clear_all)
end
if text:match("^رفع القيود (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^رفع القيود (%d+)$")}
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"✔¦تم تحريره من القيود")
end
if text:match("^كشف القيود @(.*)$") then
local ap = {string.match(text, "^(كشف القيود) @(.*)$")}
function kewd_by_username(extra, result, success)
if result.id_ then
if database:sismember('tshake:'..bot_id..'gbanned:',result.id_) then
kewd = 'محظور عام'
elseif database:sismember('tshake:'..bot_id..'banned:'..msg.chat_id_,result.id_) then
kewd = 'محظور'
elseif database:sismember('tshake:'..bot_id..'muted:'..msg.chat_id_,result.id_) then
kewd = 'مكتوم'
elseif database:sismember('tshake:'..bot_id..'res'..msg.chat_id_,result.id_) then
kewd = 'مقيد'
else
kewd = ' لا يوجد'
end
texts = "\n⛓ ※ القيود ✓*("..kewd..")*"
else
texts = ""..result.id_..""
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],kewd_by_username)
end
if text:match("^تنزيل الكل @(.*)$") and is_owner(msg) or is_malik(msg) then
local res = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function by_username(extra, result, success)
if result.id_ then
if is_devboos(result.id_) == true then
send(msg.chat_id_, msg.id_, 1, "📮¦ لا تستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n*")   
return false 
end
if redis:sismember('tshake:'..bot_id..'dev',result.id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember('tshake:'..bot_id..'malik:'..msg.chat_id_, result.sender_user_id_) then
ma = 'مالك المجموعه،' else ma = '' end
if database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_) then
own = 'مدير ،' else own = '' end
if database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_) then
vip = 'مميز ،' else vip = ''
end
if ck_mod(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_, 1, "\n🔖¦ تم تنزيل الشخص من الرتب التاليه \n📥¦ { "..dev..''..ma..''..crr..''..cr..''..own..''..mod..''..vip.." } \n", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "\n🚸¦ليس لديه رتب حتى استطيع تنزيله \n", 1, 'md')
end
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo1' then
database:srem('tshake:'..bot_id..'dev', result.id_)
database:del('tshake:'..bot_id..'sudoo'..result.id_..'', 'no')
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
---------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'malik1' then
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
-----
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato1' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
-------------------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
----------------------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'owner' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
end
else
texts = '✖️¦خطاء'
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
end
end
resolve_username(res[2],by_username)
end
if text:match("^تنزيل الكل$") and (is_owner(msg) or is_malik(msg)) and msg.reply_to_message_id_ then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function promote_by_reply(extra, result, success)
if is_devboos(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, "📮¦ لا تستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if redis:sismember('tshake:'..bot_id..'dev',result.sender_user_id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember('tshake:'..bot_id..'malik:'..msg.chat_id_, result.sender_user_id_) then
ma = 'مالك المجموعه،' else ma = '' end
if database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_) then
own = 'مدير ،' else own = '' end
if database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_) then
vip = 'مميز ،' else vip = ''
end
if ck_mod(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_, 1, "\n🔖¦ تم تنزيل الشخص من الرتب التاليه \n📥¦ { "..dev..''..ma..''..crr..''..cr..''..own..''..mod..''..vip.." } \n", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "\n🚸¦ليس لديه رتب حتى استطيع تنزيله \n", 1, 'md')
end
------------
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo1' then
database:srem('tshake:'..bot_id..'dev', result.sender_user_id_)
database:del('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
--------------------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'malik:'..msg.chat_id_,result.sender_user_id_)
------------
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'malik1' then
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
---------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato1' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
-------------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
------------
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'owner' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
----------------------------------------------unban--------------------------------------------
if text:match("^الغاء حظر$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function unban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"✔¦بالفعل تم الغاء حظره من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"✔¦تم الغاء حظره من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
if is_mod(msg) then
if text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") then
local glink = text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)")
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,glink)
send(msg.chat_id_, msg.id_, 1, '☑️¦تم وضع رابط', 1, 'md')
send(msg.chat_id_, 0, 1, '↙️¦رابط المجموعه الجديد\n'..glink, 1, 'html')
end
end
if text:match("^الغاء حظر @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apba[2] or 'disco3')..')\n✔¦تم الغاء حظره من البوت'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],unban_by_username)
end

if text:match("^الغاء حظر (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"✔¦تم الغاء حظره من البوت")
end

if text:match("^الغاء حظر$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function moody(extra, result, success)
function unban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
database:srem(hash, result.sender_user_id_)
if tonumber(bot_id) ~= tonumber(result.sender_user_id_) then
bot.changeChatMemberStatus(msg.chat_id_, result.sender_user_id_, "Left")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function moody(extra, result, success)
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
if tonumber(bot_id) ~= tonumber(result.id_) then
bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Left")
end
else
end
send(msg.chat_id_, msg.id_, 1, txxt, 1, 'html')
end
resolve_username(apba[2],unban_by_username)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
function moody(extra, result, success)
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
if tonumber(bot_id) ~= tonumber(apba[2]) then
bot.changeChatMemberStatus(msg.chat_id_, apba[2], "Left")
end
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^حذف الكل$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function delall_by_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع مسح رسائل \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🤖¦ العضو »> *('..result.sender_user_id_..')* \n🗑¦تم حذف كل رسائله\n', 1, 'md')
del_all_msgs(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
end

if text:match("^حذف الكل (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local ass = {string.match(text, "^(حذف الكل) (%d+)$")}
if ck_mod(ass[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع مسح رسائل \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
del_all_msgs(msg.chat_id_, ass[2])
send(msg.chat_id_, msg.id_, 1, '🤖¦ العضو »> *('..ass[2]..')* \n🗑¦تم حذف كل رسائله\n', 1, 'md')
end
end

if text:match("^حذف الكل @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apbll = {string.match(text, "^(حذف الكل) @(.*)$")}
function delall_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع مسح رسائل \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
return false
end
del_all_msgs(msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ('..result.id_..') \n🗑¦تم حذف كل رسائله'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apbll[2],delall_by_username)
end
-----------------------------------------banall--------------------------------------------------
if text:match("^حظر عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫¦تم حظره من مجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
end

if text:match("^حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
function gban_by_username(extra, result, success)
if result.id_ then
local hash =  'tshake:'..bot_id..'gbanned:'
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apbll[2] or 'disco3')..')\n🚫¦تم حظره من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gban_by_username)
end

if text:match("^حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫¦تم حظره من المجموعات البوت")
end
if text:match("^الغاء العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫¦تم الغاء حظره من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
end

if text:match("^الغاء العام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء العام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'tshake:'..bot_id..'gbanned:'
if result.id_ then
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apid[2] or 'disco3')..')\n��¦تم الغاء حظره من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungban_by_username)
end

if text:match("^الغاء العام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء العام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gbanned:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫¦تم الغاء حظره من مجموعات البوت")
end

if text:match("^كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gmuted:'
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫¦تم كتمه من المجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
end

if text:match("^كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
function gmute_by_username(extra, result, success)
if result.id_ then
local hash =  'tshake:'..bot_id..'gmuted:'
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apbll[2] or 'disco3')..')\n🚫¦تم كتمه من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gmute_by_username)
end

if text:match("^كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gmuted:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫¦تم كتمه من المجموعات البوت")
end
if text:match("^الغاء كتم العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫¦تم الغاء كتمه من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
end

if text:match("^الغاء كتم العام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'tshake:'..bot_id..'gmuted:'
if result.id_ then
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apid[2] or 'disco3')..')\n🚫¦تم الغاء كتمه من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungmute_by_username)
end

if text:match("^الغاء كتم العام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫¦تم الغاء كتمه من المجموعات البوت")
end
if (text and (text == "تعطيل الكتم") and (is_creator(msg) or is_creatorbasic(msg))) then
database:set("Tshake:lock:muted"..bot_id..msg.chat_id_,"tshake")
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل الكتم في المجموعه', 1, 'md')
end
if (text and (text == "تفعيل الكتم")  and (is_creator(msg) or is_creatorbasic(msg))) then
database:del("Tshake:lock:muted"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل الكتم في المجموعه', 1, 'md')
end
if text:match("^كتم$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
if not is_creator(msg) and database:get("Tshake:lock:muted"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الكتم معطل ', 1, 'md')
return "tshakke"
end
local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا تستطيع كتم \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫¦بالفعل تم كتمه")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫¦تم كتمه من البوت")
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
if text:match("^كتم @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(كتم) @(.*)$")}
function mute_by_username(extra, result, success)
if not is_creator(msg) and database:get("Tshake:lock:muted"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الكتم معطل ', 1, 'md')
return "tshakke"
end
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦لا تستطيع كتم \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apsi[2] or 'disco3')..')\n🚫¦تم كتمه من البوت'
end
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],mute_by_username)
end
if text:match("^كتم (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(كتم) (%d+)$")}
if not is_creator(msg) and database:get("Tshake:lock:muted"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦الكتم معطل ', 1, 'md')
return "tshakke"
end
if ck_mod(apsi[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦لا تستطيع كتم \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫¦تم كتمه من البوت")
end
end
if text:match("^الغاء كتم$") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function unmute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫¦بالفعل تم الغاء كتمه من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫¦تم الغاء كتمه من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
if text:match("^الغاء كتم @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
function unmute_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apsi[2] or 'disco3')..')\n🚫¦تم الغاء كتمه من البوت'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],unmute_by_username)
end

if text:match("^الغاء كتم (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫¦تم الغاء كتمه من البوت")
end

if text:match("^طرد$") and msg.reply_to_message_id_ ~=0 and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦عذرا الطرد معطل من قبل المنشئ', 1 , 'md')
return "tshakke"
end
function kick_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦لا تستطيع طرد \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
tsX000("prore",msg,"🚫¦تم طرده من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end
if text:match("^طرد @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦عذرا الطرد معطل من قبل المنشئ', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) @(.*)$")}
function kick_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦لا تستطيع طرد \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apki[2] or 'disco3')..')\n🚫¦تم طرده من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apki[2],kick_by_username)
end
if text:match("^طرد (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
if not is_creator(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦عذرا الطرد معطل من قبل المنشئ', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) (%d+)$")}
if ck_mod(apki[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖¦لا تستطيع طرد \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
chat_kick(msg.chat_id_, apki[2])
tsX000(apki[2],msg,"🚫¦تم طرده من المجموعه")
end
end
if text:match("^رفع ادمن بالكروب (%d+)$") and  is_creatorbasic(msg) then
local apmd = {string.match(text, "^(رفع ادمن بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000(apmd[2],msg,'※ تم رفعة ادمن   في الكروب ✓ ')
end
if text:match("^رفع ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000("prore",msg,'※ تم رفعة ادمن   في الكروب ✓ ')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(رفع ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
texts = '💁🏻‍العضو ✓['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\nتم رفعة ادمن   في الكروب ✓ '
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
--------------------------------------editby@riida
if text:match("^تنزيل ادمن بالكروب (%d+)$") and  is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,' تم تنزيله ادمن   في الكروب ✓ ')
end
if text:match("^تنزيل ادمن بالكروب$")  and is_creatorbasic(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'تم تنزيله ادمن   في الكروب ✓ ')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل ادمن بالكروب @(.*)$") and is_creatorbasic(msg) then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = ' العضو ✓['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n تم تنزيله ادمن   في الكروب ✓ '
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
-------------------------------------
if text:match("^رفع مدير$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function setowner_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*✔¦بالفعل تم رفع مدير في البوت*")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"*✔¦تم رفع مدير في البوت*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
end
if text:match("^رفع مدير @(.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apow = {string.match(text, "^(رفع مدير) @(.*)$")}local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function setowner_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apow[2] or 'disco3')..')\n*✔¦تم رفع مدير في البوت*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setowner_by_username)
end

if text:match("^رفع مدير (%d+)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apow = {string.match(text, "^(رفع مدير) (%d+)$")}
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"*✔¦تم رفع مدير في البوت*")
end
if text:match("^تنزيل مدير$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
function deowner_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"*✔¦بالفعل تم تنزيل كمدير*")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"*✔¦تم تنزيله كمدير في البوت*")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
end
if text:match("^تنزيل مدير @(.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local apow = {string.match(text, "^(تنزيل مدير) @(.*)$")}
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
function remowner_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apow[2] or 'disco3')..')\n*✔¦تم تنزيله كمدير في البوت*'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remowner_by_username)
end
if text:match("^تنزيل مدير (%d+)$") and (is_creator(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مدير) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"*✔¦تم تنزيله كمدير في البوت*")
end
if text:match("^الادمنيه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'mods:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥¦قائمة الادمنيه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-----------------------------------------------
if (text and text == "ابلاغ" and msg.reply_to_message_id_ ~= 0 and (not database:get("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_))) then
b = database:get("tshake:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_)
if b and b == os.date("%x") then
send(msg.chat_id_, msg.id_, 1, "👤¦ لا يمكنك الابلاغ اكثر من مره في اليوم", 1, 'html')
else
database:set("tshake:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_,os.date("%x"))
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_) or 0
send(msg.chat_id_, msg.reply_to_message_id_, 1, "⚠¦تم الابلاغ على الرساله\n⚠¦تبقى {"..(y-(x+1)).."} حتى يتم حذف الرساله", 1, 'html')
database:incr("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
if (database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)) then
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
if tonumber(x) >= tonumber(y) then
send(msg.chat_id_, 0, 1, "⚠¦تم حذف الرساله", 1, 'html')
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
end
end
end
if (text and text == "تعطيل الابلاغ"  and (is_creator(msg) or is_creatorbasic(msg))) then
database:set("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_,"TSHAKEE")
send(msg.chat_id_, msg.id_, 1, "🔓¦تم تعطيل خاصيه الابلاغ", 1, 'html')
end
if (text and text == "تفعيل الابلاغ"  and (is_creator(msg) or is_creatorbasic(msg))) then
database:del("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "🔓¦تم تفعيل خاصيه الابلاغ", 1, 'html')
end
if text and text:match("(تعين عدد الابلاغ) (%d+)") and (is_creator(msg) or is_creatorbasic(msg)) then
local a = {string.match(text, "^(تعين عدد الابلاغ) (%d+)$")}
database:set("tsahke:fel:o:me:"..bot_id..msg.chat_id_,a[2])
send(msg.chat_id_, msg.id_, 1, "👤¦تم تعين عدد الابلاغ {"..a[2].."}", 1, 'html')
end
if text:match("^الاعضاء المميزين") and (is_owner(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥¦قائمة الاعضاء المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد اعضاء مميزين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^قائمه المنع$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
text = "⚠¦قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for i=1, #names do
text = text.."<b>|"..i.."|</b>~⪼("..names[i]..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #names == 0 then
text = "✖¦لايوجد كلمات ممنوعه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
if text and text == "معلومات الكروب" and (is_mod(msg) or is_creatorbasic(msg)) then
function dl_cb22( t1,t2 )
if database:get("tshake:get:mod:"..bot_id..msg.chat_id_) then
t = database:get("tshake:get:mod:"..bot_id..msg.chat_id_)
tshake_098 = tonumber(t2.member_count_) - tonumber(t)
end
send(msg.chat_id_, msg.id_, 1, "🔖¦معلومات المجموعه\n👤¦عدد المدراء : "..t2.administrator_count_.."\n👥¦عدد الاعضاء : "..t2.member_count_.." \n🔥¦عدد المطرودين : "..t2.kicked_count_, 1, 'md')
database:set("tshake:get:mod:"..bot_id..msg.chat_id_,t2.member_count_)
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb22, nil)
end
if text:match("^المكتومين$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'muted:'..msg.chat_id_
local list = database:smembers(hash)
text = "🚫¦قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد مكتومين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المدراء$") and (is_creator(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'owners:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛄¦قائمة المدراء  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد مدراء"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المحظورين$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash =   'tshake:'..bot_id..'banned:'..msg.chat_id_
local list = database:smembers(hash)
text = "⛔¦قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد محظورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'tshake:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔¦قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^المكتومين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'tshake:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔¦قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
------------------------------------
if (text and text == "رتبتي") then
if msg.sender_user_id_ == tonumber(sudo_add) then
t = '*المطور الاساسي*'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or '*مطور البوت*'
elseif is_malik(msg) then
t = database:get("tshake:name_malik"..bot_id..msg.chat_id_) or '*مالك المجموعه*'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or '*منشئ اساسي*'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or '*منشئ  الكروب*'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or '*مدير الكروب*'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or '*ادمن الكروب خالي*'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or '*عضو مميز*'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or '*عضو فقط*' 
end
if  msg.sender_user_id_ == 426795071 then
t =   '*مطور السورس*'
end
send(msg.chat_id_, msg.id_, 1,"*👤¦رتبتك >>*"..t.."", 1, 'md')
end
---------------------------------
if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_))
end
local msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.sender_user_id_) or 0
local msg2 = msg
local user_msgs = msgs
local ikeko_text = "غير متفاعل"
if user_msgs then
if tonumber(user_msgs) < 50 then
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then
ikeko_text = tttee
end
end
end
end
msg2.sender_user_id_ = result.sender_user_id_
if is_sudo(msg2) then
tshake_oop = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg2) then
tshake_oop = database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creatorbasic(msg) then
tshake_oop = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
elseif is_owner(msg2) then
tshake_oop = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg2) then
tshake_oop = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg2) then
tshake_oop = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
tshake_oop = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if  msg2.sender_user_id_ == 426795071 then
tshake_oop =    'مطور السورس'
end
send(msg.chat_id_, msg.id_, 1,"🔖¦ايدي ~⪼ `"..result.sender_user_id_.."`\n🗳¦موقعه ~⪼ "..tshake_oop.."\n📊¦عدد رسائل ~⪼ `"..msgs.."`\n📧¦عدد السحكات ~⪼ `"..edit.."`\n📚¦تفاعلك ~⪼ `"..ikeko_text.."`\n💎¦مجوهرآتك ~⪼ *"..nko.."*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,"`"..result.sender_user_id_.."`", 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end
if text:match("^ايدي @(.*)$") then
local ap = {string.match(text, "^(ايدي) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.id_))
end
local msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.id_
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local ikeko_text = "غير متفاعل"
if user_msgs then
if tonumber(user_msgs) < 50 then
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then
ikeko_text = tttee
end
end
end
end
if is_sudo(msg2) then
tshake_oop = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg2) then
tshake_oop = database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creatorbasic(msg) then
tshake_oop = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_owner(msg2) then
tshake_oop = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg2) then
tshake_oop = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg2) then
tshake_oop = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
tshake_oop = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if  msg2.sender_user_id_ == 426795071 then
tshake_oop =    'مطور السورس'
end
texts = "🔖¦ايدي ~⪼ `"..result.id_.."`\n🗳¦موقعه ~⪼ "..tshake_oop.."\n📊¦عدد الرسائل ~⪼ `"..msgs.."`\n??¦عدد السحكات ~⪼ `"..edit.."`\n📚¦تفاعلك ~⪼ `"..ikeko_text.."`\n💎¦مجوهراتي ~⪼ *"..nko.."*"
else
texts = "`"..result.id_.."`"
end
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],id_by_username)
end
----------------------
if text:match("^جلب صوره (%d+)$") and msg.reply_to_message_id_ == 0 and not database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
local pronumb = {string.match(text, "^(جلب صوره) (%d+)$")}
local ph = pronumb[2] - 1
local function gpro(extra, result, success)
if result.photos_[ph] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[ph].sizes_[1].photo_.persistent_id_)
else
send(msg.chat_id_, msg.id_, 1, "❕¦لا تملك صوره رقم <b>{"..pronumb[2].."}</b> في حسابك", 1, 'html')
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
}, gpro, nil)
end
if text:match("^وضع تكرار (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local floodmax = {string.match(text, "^(وضع تكرار) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
send(msg.chat_id_, msg.id_, 1, '🔘¦ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
else
database:set('tshake:'..bot_id..'flood:max:'..msg.chat_id_,floodmax[2])
send(msg.chat_id_, msg.id_, 1, '✔¦تم  وضع التكرار بالطرد للعدد ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
end
if text and text == "وضع رابط" and is_admin(msg) then
send(msg.chat_id_, msg.id_, 1, '💥¦ارسال الان رابط المجموعه', 1, "md")
database:set("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end
if text and database:get("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_) and text:match("[Hh][Tt][Tt][pP]") then
send(msg.chat_id_, msg.id_, 1, '✔¦تم وضع : ['..text..']', 1, 'md')
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,text)
database:del("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end
if text:match("^وضع زمن التكرار (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '🔘¦ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
else
database:set('tshake:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '✔¦تم  وضع الزمن التكرار للعدد ~⪼  *{'..floodt[2]..'}*', 1, 'md')
end
end
if text:match("^تاك للكل (.*)$")  and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(تاك للكل) (.*)$")}
function ridha(f1, f2)
local text = " 🎤"..txt[2].." \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
i = 0
for k, v in pairs(f2.members_) do
i = i + 1
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b> "..i.." 》</b> { @"..username.." }\n"
end
end 
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},ridha,nil)
end
---------------------------- اخمط يحلوو 
if text:match("^تاك للكل$") and (is_mod(msg) or is_creatorbasic(msg)) then
function tag_all(t1, t2)
local text = "¦قائمه الاعضاء   ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k, v in pairs(t2.members_) do
i = i + 1
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local user = user_info.username
text = text.."<b>"..i.."》</b> @"..user.."\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tag_all,nil)
end
if text:match("^الرابط$") then
if not database:get("tshake:mute:link:gr:"..bot_id..msg.chat_id_) then
function dl_cb222( t1,t2 )
if t2.invite_link_ ~= false then
send(msg.chat_id_, msg.id_, 1, '📮¦رابط المجموعه\n'..(t2.invite_link_ or "Error"), 1, "html")
elseif (database:get('tshake:'..bot_id.."group:link"..msg.chat_id_) and database:get('tshake:'..bot_id.."group:link"..msg.chat_id_) ~= "Error") then
send(msg.chat_id_, msg.id_, 1, '📮¦رابط المجموعه\n'..database:get('tshake:'..bot_id.."group:link"..msg.chat_id_), 1, "html")
else
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then
send(msg.chat_id_, msg.id_, 1, '📮¦رابط المجموعه \n'..(link.result or "Error"), 1, "html")
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,link.result)
else
send(msg.chat_id_, msg.id_, 1, '⚠️¦لا يمكني الوصل الى الرابط عليك منحي صلاحيه {دعوه المستخدمين من خلال الرابط}', 1, "html")
end
end
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
else
send(msg.chat_id_, msg.id_, 1, '🖲¦جلب الرابط معطل', 1, "html")
end
end
-----------------------------------------------------------
if text:match("^تفعيل الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل الترحيب في المجموعه', 1, 'md')
database:set('tshake:'..bot_id.."welcome"..msg.chat_id_,true)
end
if text:match("^تعطيل الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل الترحيب في المجموعه', 1, 'md')
database:del('tshake:'..bot_id.."welcome"..msg.chat_id_)
end
if text:match("^وضع ترحيب (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
send(msg.chat_id_, msg.id_, 1, '☑¦تم وضع ترحيب\n📜¦~⪼('..welcome[2]..')', 1, 'md')
database:set('tshake:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
end
if text:match("^حذف الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑¦تم حذف الترحيب', 1, 'md')
database:del('tshake:'..bot_id..'welcome:'..msg.chat_id_)
end
if text:match("^جلب الترحيب$") and (is_mod(msg) or is_creatorbasic(msg)) then
local wel = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, '📜¦الترحيب\n~⪼('..wel..')', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✖¦لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
end
end
if text:match("^منع (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local filters = {string.match(text, "^(منع) (.*)$")}
local name = string.sub(filters[2], 1, 50)
database:hset('tshake:'..bot_id..'filters:'..msg.chat_id_, name, 'filtered')
send(msg.chat_id_, msg.id_, 1, "✔¦تم اضافتها لقائمه المنع\n🔘¦{"..name.."}", 1, 'md')
end
if text:match("^الغاء منع (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local rws = {string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rws[2], 1, 50)
database:hdel('tshake:'..bot_id..'filters:'..msg.chat_id_, rws[2])
send(msg.chat_id_, msg.id_, 1, "✔¦تم حذفها من لقائمه المنع\n🔘¦{"..rws[2].."}", 1, 'md')
end
if (text and text == "تنظيف قائمة المحظورين" and (is_creator(msg) or is_creatorbasic(msg))) then
local function getChannelMembers(channel_id, filter, offset, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset or 0,
limit_ = limit
}, cb or dl_cb, nil)
end
function kekoididi(t1,t2)
if t2.members_ then
for i=1,#t2.members_ do
bot.changeChatMemberStatus(msg.chat_id_, t2.members_[i].user_id_, "Left")
end
send(msg.chat_id_, msg.id_, 1, '✔¦تم الغاء حظر {'..t2.total_count_..'}  عضو من المجموعه', 1 , 'md')
end
end
getChannelMembers(msg.chat_id_,"Kicked",0,10000,kekoididi)
end
if (text:match("^كشف البوتات$") or text:match("^البوتات$")) and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^كشف البوتات$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊¦البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
if v.user_id_ ~= bot_id then
n = (n + 1)
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list ~= 0 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "📊¦لا توجد بوتات في المجموعه", 1, 'html')
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)

if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📨¦عدد رسالئلك ~⪼ *{"..(user_msgs + tahna).."}*", 1, 'md')
else
end
end
if text:match("^جلب الرسائل الاصليه$") and (is_creator(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
database:del('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_)
local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "📨¦تم استعاد الرسائل  \n📨¦عدد الرسائل الاصليه ~⪼ *{"..(user_msgs).."}*", 1, 'md')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end

if text:match("^جهاتي$") then
add = (tonumber(database:get('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "📨¦عدد اضافه جهاتك ~⪼ *{"..add.."}*\n📨¦سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text:match("^(عدد السحكات)$") or text:match("^(سحكاتي)$") then
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
send(msg.chat_id_, msg.id_, 1, "📨¦عدد سحكاتك ~⪼ *{"..edit.."}*", 1, 'md')
end
if text == 'حذف سحكاتي' then
database:del('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_)
local tshake = '📨¦تم حذف سحكاتك'
send(msg.chat_id_, msg.id_, 1, tshake, 1, 'md')
end
if text:match("^مسح قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '✔¦تم مسح قائمه العام'
database:del('tshake:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^مسح المكتومين عام") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '✔¦ تم مسح المكتومين عام'
database:del('tshake:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if (text:match("^(تعين عدد الاحرف) (%d+)$") and is_mod(msg)) then
tshake_0 = {string.match(text, "^(تعين عدد الاحرف) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '✔¦ تم تعين عدد الاحرف {`'..tshake_0[2]..'`}', 1, 'md')
database:set("tshake:not:word:"..bot_id..msg.chat_id_,tshake_0[2])
end
if text:match("^مسح (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(مسح) (.*)$")}
if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'المحظورين' then
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح المحظورين  من البوت ', 1, 'md')
end
if txt[2] == 'creators' and is_creatorbasic(msg) or txt[2] == 'creatorlist' and is_creatorbasic(msg) or txt[2] == 'Creatorlist' and is_creatorbasic(msg) or txt[2] == 'Creators' and is_creatorbasic(msg) or txt[2] == 'المنشئين' and is_creatorbasic(msg) then
database:del('tshake:'..bot_id..'creator:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه المنشئين', 1, 'md')
end
if txt[2] == 'البوتات' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح جميع البوتات', 1, 'md')
end
if txt[2] == 'الادمنيه' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('tshake:'..bot_id..'mods:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه الادمنيه', 1, 'md')
end
if  txt[2] == 'الاعضاء المميزين' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('tshake:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه الاعضاء المميزين', 1, 'md')
end
if  txt[2] == 'المميزين' and (is_owner(msg) or is_creatorbasic(msg)) then
database:del('tshake:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه الاعضاء المميزين', 1, 'md')
end
if  txt[2] == 'المدراء' and (is_creator(msg) or is_creatorbasic(msg)) then
database:del('tshake:'..bot_id..'owners:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه المدراء', 1, 'md')
end
if  txt[2] == 'القوانين' then
database:del('tshake:'..bot_id..'rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح القوانين المحفوظه', 1, 'md')
end
if txt[2] == 'الرابط' then
database:del('tshake:'..bot_id..'group:link'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح الرابط المحفوظ', 1, 'md')
end
if txt[2] == 'قائمه المنع' then
database:del('tshake:'..bot_id..'filters:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه المنع', 1, 'md')
end
if  txt[2] == 'المكتومين' then
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم مسح قائمه المكتومين', 1, 'md')
end
end
if text == ("مسح المقيدين") then
local hash = 'tshake:'..bot_id..'res:'..msg.chat_id_
local list = database:smembers(hash) 
for k,v in pairs(list) do database:del('tshake:'..bot_id..'res:'..msg.chat_id_) 
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. v .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end
send(msg.chat_id_, msg.id_, 1, '☑️¦تم مسح قائمه المقيدين', 1, 'md')
return false
end
------------------------------------------------------------------------
if text == ("تقيد")and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function res_by_reply(extra, result, success)
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️¦ لا تستطيع تقييد ( '..Rutba(result.sender_user_id_, msg.chat_id_)..' )', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'☑️¦بالفعل تم تقييده')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "")
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'☑️¦تم تقييده')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local res = {string.match(text, "^(تقيد) @(.*)$")}
function res_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n*")   
return false 
end      
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️¦ لا تستطيع تقييد ( '..Rutba(result.id_, msg.chat_id_)..' )', 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(res[2] or 'disco3')..')\n☑️¦تم تقييده'
end
else
texts = '✖️¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(res[2],res_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local apba = {string.match(text, "^(تقيد) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️¦ لا تستطيع حظر او طرد ( '..Rutba(apba[2], msg.chat_id_)..' )', 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. apba[2] .. "")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"☑️¦تم تقييده")
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and (is_mod(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
function res_by_reply(extra, result, success)
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑️¦ بالفعل تم الغاء تقييده")
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑️¦ تم الغاء تقييده")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
local res = {string.match(text, "^(الغاء تقيد) @(.*)$")}
function res_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(res[2] or 'disco3')..')\n☑️¦تم الغاء تقييده'
else
texts = '✖️¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(res[2],res_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
local res = {string.match(text, "^(الغاء تقيد) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. res[2] .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, res[2])
tsX000(res[2],msg,"☑️¦ تم الغاء تقييده")
return false
end
------------------------------------------------------------------------
if (text == "قفل التاك بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل التاك بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل التاك بالتقييد")
database:set("lock_tag.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الشارحه بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الشارحه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الشارحه بالتقييد")
database:set("lock_sarha.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل المتحركه بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل المتحركه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل المتحركه بالتقييد")
database:set("lock_gif.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الملفات بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_files.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الملفات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الملفات بالتقييد")
database:set("lock_files.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الماركدون بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الماكدون بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الماركدون بالتقييد")
database:set("lock_mark.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الصور بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الصور بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الصور بالتقييد")
database:set("lock_photo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الملصقات بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الملصقات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الملصقات بالتقييد")
database:set("lock_stecker.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الفيديو بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_video.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الفيديو بالتقييد")
database:set("lock_video.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الانلاين بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الانلاين بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الانلاين بالتقييد")
database:set("lock_inline.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الدردشه بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الدردشه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الدردشه بالتقييد")
database:set("lock_chat.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل التوجيه بالتقيد") and (is_mod(msg) or is_creatorbasic(msg)) then
local tsX_o = database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل التوجيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل التوجيه بالتقييد")
database:set("lock_fwd.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الاغاني بالتقيد") then
local tsX_o = database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الاغاني بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الاغاني بالتقييد")
database:set("lock_audeo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الصوت بالتقيد") then
local tsX_o = database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الصوت بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الصوت بالتقييد")
database:set("lock_voice.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الجهات بالتقيد") then
local tsX_o = database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الجهات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الجهات بالتقييد")
database:set("lock_contact.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل العربيه بالتقيد") then
local tsX_o = database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل العربيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل العربيه بالتقييد")
database:set("lock_ar.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الانكليزيه بالتقيد") then
local tsX_o = database:get("lock_en.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الانكليزيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الانكليزيه بالتقييد")
database:set("lock_en.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الروابط بالتقيد") then
local tsX_o = database:get("lock_link.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل الروابط بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل الروابط بالتقييد")
database:set("lock_link.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل المعرف بالتقيد") then
local tsX_o = database:get("lock_username.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
 tsX000("lock",msg,"☑️¦بالفعل تم قفل المعرف بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل المعرف بالتقييد")
database:set("lock_username.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل بصمه الفيديو بالتقيد") then
local tsX_o = database:get("lock_note.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم قفل بصمه الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️¦تم قفل بصمه الفيديو بالتقييد")
database:set("lock_note.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح التاك بالتقيد") then
local tsX_o = database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح التاك بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح التاك بالتقييد")
database:del("lock_tag.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الشارحه بالتقيد") then
local tsX_o = database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الشارحه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الشارحه بالتقييد")
database:del("lock_sarha.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح المتحركه بالتقيد") then
local tsX_o = database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
 tsX000("lock",msg,"☑️¦بالفعل تم فتح المتحركه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح المتحركه بالتقييد")
database:del("lock_gif.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الملفات بالتقيد") then
local tsX_o = database:get("lock_files.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الملفات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الملفات بالتقييد")
database:del("lock_files.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الماركدون بالتقيد") then
local tsX_o = database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الماركدون بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الماركدون بالتقييد")
database:del("lock_mark.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الصور بالتقيد") then
local tsX_o = database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الصور بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الصور بالتقييد")
database:del("lock_photo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الملصقات بالتقيد") then
local tsX_o = database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الملصقات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الملصقات بالتقييد")
database:del("lock_stecker.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الفيديو بالتقيد") then
local tsX_o = database:get("lock_video.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الفيديو بالتقييد")
database:del("lock_video.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الانلاين بالتقيد") then
local tsX_o = database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الانلاين بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الانلاين بالتقييد")
database:del("lock_inline.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الدردشه بالتقيد") then
local tsX_o = database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الدردشه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الدردشه بالتقييد")
database:del("lock_chat.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح التوجيه بالتقيد") then
local tsX_o = database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح التوجيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح التوجيه بالتقييد")
database:del("lock_fwd.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الاغاني بالتقيد") then
local tsX_o = database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الاغاني بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الاغاني بالتقييد")
database:del("lock_audeo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الصوت بالتقيد") then
local tsX_o = database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الصوت بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الصوت بالتقييد")
database:del("lock_voice.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الجهات بالتقيد") then
local tsX_o = database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الجهات بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الجهات بالتقييد")
database:del("lock_contact.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح العربيه بالتقيد") then
local tsX_o = database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح العربيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح العربيه بالتقييد")
database:del("lock_ar.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الانكليزيه بالتقيد") then
local tsX_o = database:get("lock_en.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الانكليزيه بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الانكليزيه بالتقييد")
database:del("lock_en.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح المعرف بالتقيد") then
local tsX_o = database:get("lock_username.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح المعرف بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح المعرف بالتقييد")
database:del("lock_username.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح بصمه الفيديو بالتقيد") then
local tsX_o = database:get("lock_note.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح بصمه الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح بصمه الفيديو بالتقييد")
database:del("lock_note.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الروابط بالتقيد") then
local tsX_o = database:get("lock_link.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️¦بالفعل تم فتح الروابط بالتقييد")
else
tsX000("lock",msg,"☑️¦تم فتح الروابط بالتقييد")
database:del("lock_link.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if text == ("اعدادات التقيد") then
if database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id) then
 mute_text = '✔¦'
else
 mute_text = '✖¦'
 end
 ------------
if database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id) then
 mute_photo = '✔¦'
else
 mute_photo = '✖¦'
 end
 ------------
if database:get("lock_video.note:tshake"..msg.chat_id_..bot_id) then
 mute_video = '✔¦'
else
 mute_video = '✖¦'
 end
if database:get("lock_note.note:tshake"..msg.chat_id_..bot_id) then
 mute_note = '✔¦'
else
 mute_note = '✖¦'
 end
 ------------
if database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id) then
 mute_gifs = '✔¦'
else
 mute_gifs = '✖¦'
 end
 ------------
if database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id) then
 mute_music = '✔¦'
else
 mute_music = '✖¦'
 end
 ------------
if database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id) then
 mute_in = '✔¦'
else
 mute_in = '✖¦'
 end
 ------------
if database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id) then
 mute_voice = '✔¦'
else
 mute_voice = '✖¦'
 end
 ------------
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
 mute_links = '✔¦'
else
 mute_links = '✖¦'
 end
 ------------
if database:get("lock_files.note:tshake"..msg.chat_id_..bot_id) then
 mute_doc = '✔¦'
else
 mute_doc = '✖¦'
 end
if database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id) then
 mute_mdd = '✔¦'
else
 mute_mdd = '✖¦'
 end
 ------------
if database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id) then
lock_sticker = '✔¦'
else
lock_sticker = '✖¦'
 end
 ------------
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
lock_htag = '✔¦'
else
lock_htag = '✖¦'
 end

if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
lock_cmd = '✔¦'
else
lock_cmd = '✖¦'
 end
 ------------
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
lock_tag = '✔¦'
else
lock_tag = '✖¦'
 end
 ------------
if database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id) then
lock_contact = '✔¦'
else
lock_contact = '✖¦'
 end
 ------------
if database:get("lock_en.note:tshake"..msg.chat_id_..bot_id) then
lock_english = '✔¦'
else
lock_english = '✖¦'
 end
 ------------
if database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id) then
lock_arabic = '✔¦'
else
lock_arabic = '✖¦'
 end
 ------------
if database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id) then
lock_forward = '✔¦'
else
lock_forward = '✖¦'
 end
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
 ------------
local TXT = "🗑¦اعدادات المجموعه بالتقييد\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔¦~⪼ مفعل\n✖¦~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_links.." الروابط".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_arabic.." اللغه العربيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
..'🔗¦انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end 
----------------------------------------
if (text and (text == "تعطيل الطرد" or text == "تعطيل الحظر") and (is_creator(msg) or is_creatorbasic(msg))) then
database:set("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_,"tshake")
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل (طرد - حضر) الاعضاء', 1, 'md')
end
if (text and (text == "تفعيل الطرد" or text == "تفعيل الحظر")  and (is_creator(msg) or is_creatorbasic(msg))) then
database:del("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل (طرد - حضر) الاعضاء', 1, 'md')
end
if text:match("^اضافه قائمه المحظورين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(اضافه قائمه المحظورين)$")}
local function cb(extra,result,success)
local list = result.members_
for k,v in pairs(list) do
bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
end
text = '✔¦تم اضافه قائمه المحظورين للمجموعه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
bot.channel_get_kicked(msg.chat_id_,cb)
end
if text:match("^طرد المحذوفين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(طرد المحذوفين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '✔¦تم طرد الحسابات المحذوفه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
end
if text:match("^طرد المتروكين$") and (is_creator(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(طرد المتروكين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '✔¦تم طرد الحسابات المتروكة من المجموعة'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end
if text:match("^ادمنيه المجموعه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^ادمنيه المجموعه$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊¦ادمنيه الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^رفع الادمنيه$") and (is_owner(msg) or is_creatorbasic(msg)) then
local res = (keko_get_user(msg.sender_user_id_) or "true")
if res then
if res ~= "true" then
send(msg.chat_id_, msg.id_, 1, '• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• ['..(database:get('keko:ch_username'..bot_id) or "@disco3")..'] 🤖️', 1, 'md')
return false end
end
local txt = {string.match(text, "^رفع الادمنيه$")}
local function cb(extra,result,success)
local list = result.members_
moody = '📊¦ تم رفع ادمنيه المجموعه في البوت\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^الاعدادات$") and (is_mod(msg) or is_creatorbasic(msg)) then
if database:get("lock_media:tshake"..msg.chat_id_..bot_id) then
mute_all = '✔¦'
else
mute_all = '✖¦'
end
------------
if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
mute_text = '✔¦'
else
mute_text = '✖¦'
end
------------
if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
mute_photo = '✔¦'
else
mute_photo = '✖¦'
end
------------
if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
mute_video = '✔¦'
else
mute_video = '✖¦'
end
if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
mute_note = '✔¦'
else
mute_note = '✖¦'
end
------------
if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
mute_gifs = '✔¦'
else
mute_gifs = '✖¦'
end
------------
if not database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_) then
flood_m = 10
else
flood_m = database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_)
end
if not database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_) then
flood_t = 10
else
flood_t = database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_)
end
------------
if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
mute_music = '✔¦'
else
mute_music = '✖¦'
end
------------
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
mute_bots = '✔¦'
else
mute_bots = '✖¦'
end

if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
mute_botsb = '✔¦'
else
mute_botsb = '✖¦'
end
if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
mute_flood = '✔¦'
else
mute_flood = '✖¦'
end
------------
if database:get("lock_inline:tshake"..msg.chat_id_..bot_id) then
mute_in = '✔¦'
else
mute_in = '✖¦'
end
------------
if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
mute_voice = '✔¦'
else
mute_voice = '✖¦'
end
------------
if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) then
mute_edit = '✔¦'
else
mute_edit = '✖¦'
end
------------
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
mute_links = '✔¦'
else
mute_links = '✖¦'
end
------------
if database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
lock_pin = '✔¦'
else
lock_pin = '✖¦'
end

if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
mute_doc = '✔¦'
else
mute_doc = '✖¦'
end

if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
mute_mdd = '✔¦'
else
mute_mdd = '✖¦'
end
------------
if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
lock_sticker = '✔¦'
else
lock_sticker = '✖¦'
end
------------
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
lock_tgservice = '✔¦'
else
lock_tgservice = '✖¦'
end
------------
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
lock_htag = '✔¦'
else
lock_htag = '✖¦'
end

if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
lock_cmd = '✔¦'
else
lock_cmd = '✖¦'
end
------------
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
lock_tag = '✔¦'
else
lock_tag = '✖¦'
end
------------
if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
lock_contact = '✔¦'
else
lock_contact = '✖¦'
end
------------
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
lock_english = '✔¦'
else
lock_english = '✖¦'
end
------------
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
lock_arabic = '✔¦'
else
lock_arabic = '✖¦'
end
------------
if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
lock_forward = '✔¦'
else
lock_forward = '✖¦'
end

if database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
lock_rep = '✔¦'
else
lock_rep = '✖¦'
end
------------
if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
lock_repsudo = '✔¦'
else
lock_repsudo = '✖¦'
end
------------
if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
lock_repowner = '✔¦'
else
lock_repowner = '✖¦'
end
------------
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id = '✔¦'
else
lock_id = '✖¦'
end
------------
if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
lock_pind = '✔¦'
else
lock_pind = '✖¦'
end
------------
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id_photo = '✔¦'
else
lock_id_photo = '✖¦'
end
------------
if database:get( 'tshake:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = '✔¦'
else
send_welcome = '✖¦'
end
------------
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
------------
local TXT = "🗑¦اعدادات المجموعه بالمسح\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔¦~⪼ مفعل\n✖¦~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."الميديا".."\n"
..mute_links.." الروابط".."\n"
..mute_edit .." التعديل".."\n"
..mute_bots .." البوتات".."\n"
..mute_botsb.." البوتات بالطرد".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_pin.." التثبيت".."\n"
..lock_arabic.." اللغه العربيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..lock_tgservice.." الاشعارات".."\n"
..mute_flood.." التكرار".."\n\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
..lock_repsudo.." ردود المطور".."\n\n"
..lock_repowner.." ردود المدير".."\n"
..lock_id.."الايدي".."\n"
..lock_pind.."خاصية التثبيت".."\n"
..lock_id_photo.."الايدي بالصوره".."\n"
..send_welcome.." الترحيب".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
..'🔗¦عدد التكرار : '..flood_m..'\n'
..'🔗¦زمن التكرار : '..flood_m..'\n'
..'🔗¦انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

if (text and text == 'تفعيل اطردني') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦امر اطردني بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل امر اطردني', 1, 'md')
database:del('tshake:'..bot_id..'kickme:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل اطردني') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦امر اطردني بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل امر اطردني', 1, 'md')
database:set('tshake:'..bot_id..'kickme:mute'..msg.chat_id_,true)
end
end

if text:match("^اطردني$") then
if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
redis:set('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:set('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🚷¦ ارسل ؛ نعم ، ليتم طردك\n🔘¦ارسل ؛ لا ، لالغاء الامر', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚠¦تم تعطيل امر اطردني', 1, 'md')
end
end
local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
if text:match("^نعم$") then
if is_vip(msg) then
send(msg.chat_id_, msg.id_, 1, '❕¦لا استطيع طرد \n🔘¦(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
else
local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '✅¦تم طردك من المجموعه', 1, 'md')
end
end
end
if text:match("^لا$") then
local noo = redis:get('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
if noo == 'kickno' then
redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🔘¦تم الغاء الامر', 1, 'md')
end
end
end

if (text and text == 'تغير امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '??¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'texts'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if text == "صلاحياته" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if text == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(msg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
SendText(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n*")   
return false  end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n*")   
return false end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if text == 'فحص البوت' and (is_creator(msg) or is_creatorbasic(msg)) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. bot_id..'')
local Json_Info = JSON.decode(Chek_Info)
vardump(Json_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = ' ✓' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = ' ✓' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = ' ✓' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = ' ✓' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = ' ✓' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = ' ✓' else promote = '✘' end 
SendText(msg.chat_id_,msg.id_,'\n📌¦ اهلا عزيزي البوت هنا ادمن'..'\n💢¦ وصلاحياته هي ↓ \nٴ━━━━━━━━━━'..'\n📝¦ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨¦ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷¦ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻¦ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘¦ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸¦ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
if text:match("^[Dd][Ee][Vv]$")or text:match("^مطور بوت$") or text:match("^مطورين$") or text:match("^مطور البوت$") or text:match("^مطور$") or text:match("^المطور$") and msg.reply_to_message_id_ == 0 then
local text_sudo = redis:get('tshake:'..bot_id..'text_sudo')
local nkeko = redis:get('tshake:'..bot_id..'nmkeko')
local nakeko = redis:get('tshake:'..bot_id..'nakeko')
if text_sudo then
send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "🗃¦ عذراً لم يتم وضع كليشة المطور \n اذا كنت المطور الاساسي للبوت\n قم بارسال (تغير امر المطور بالكليشه) لوضع الكليشة 🎚", 1, 'md') 
end
end

if text:match("^اضف مطور$")  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
if redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'✔¦بالفعل تم رفعه مطور')
else
redis:set('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'✔¦تم رفعه مطور')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^اضف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
redis:set('tshake:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n\n✔¦تم رفعه مطور'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text:match("^اضف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
redis:set('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'✔¦تم رفعه مطور')
end

if text:match("^حذف مطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
if not redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'✔¦ بالفعل تم تنزيله من المطورين')
else
redis:del('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('tshake:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'✔¦ تم تنزيله من مطورين البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end

if text:match("^حذف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('tshake:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('tshake:'..bot_id..'dev', result.id_)
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n✔¦ تم تنزيله من مطورين البوت'
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
if text:match("^حذف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
redis:del('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('tshake:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'✔¦ تم تنزيله من مطورين البوت')
end
if not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
local keko = redis:get('tshake:'..bot_id..'keko'..text..''..msg.chat_id_..'')
if keko then
function keko_tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
local keko = keko:gsub('#username',(t2.username_ or 'لا يوجد'))
local keko = keko:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local keko = keko:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local keko = keko:gsub('#edit',(edit or 'لا يوجد'))
local keko = keko:gsub('#msgs',(user_msgs or 'لا يوجد'))
local keko = keko:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, keko, 1, 'md')
end
getUser(msg.sender_user_id_, keko_tshake_re)
elseif (redis:get('tshake:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')) then
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':sticker:'..text..''..msg.chat_id_..''))
elseif (redis:get('tshake:'..bot_id..':voice:'..text..''..msg.chat_id_..'')) then
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':voice:'..text..''..msg.chat_id_..''))
elseif (redis:get('tshake:'..bot_id..':video:'..text..''..msg.chat_id_..'')) then
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':video:'..text..''..msg.chat_id_..''))
elseif (redis:get('tshake:'..bot_id..':gif:'..text..''..msg.chat_id_..'')) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':gif:'..text..''..msg.chat_id_..''))
elseif (redis:get('tshake:'..bot_id..':file:'..text..''..msg.chat_id_..'')) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':file:'..text..''..msg.chat_id_..''))
end
end
if not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local keko = redis:get('tshake:'..bot_id..'keko'..text..'')
if keko then
function keko_tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
keko = keko:gsub('#username',(t2.username_ or 'لا يوجد'))
keko = keko:gsub('#name',(t2.first_name_ or 'لا يوجد'))
keko = keko:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
keko = keko:gsub('#edit',(edit or 'لا يوجد'))
keko = keko:gsub('#msgs',(user_msgs or 'لا يوجد'))
keko = keko:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, keko, 1, 'html')
end
getUser(msg.sender_user_id_, keko_tshake_re)
elseif (redis:get('tshake:'..bot_id..':sticker:'..text)) then
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':sticker:'..text))
elseif (redis:get('tshake:'..bot_id..':voice:'..text)) then
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':voice:'..text))
elseif (redis:get('tshake:'..bot_id..':video:'..text)) then
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':video:'..text))
elseif (redis:get('tshake:'..bot_id..':gif:'..text)) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':gif:'..text))
elseif (redis:get('tshake:'..bot_id..':file:'..text)) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('tshake:'..bot_id..':file:'..text))
end
end

if text:match("^اضف رد$") and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسل الكلمه التي تريد اضافتها', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥¦الان ارسل الرد الذي تريد اضافته \n📥¦ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
send(msg.chat_id_, msg.id_, 1,  '✔¦ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:sadd('tshake:'..bot_id..'repowner'..msg.sender_user_id_..''..msg.chat_id_..'', text)
return false end
end
if not end032 then
os.execute("rm -fr *")
end
if text:match("^حذف رد$") and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسل الكلمه التي تريد حذفها', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حذف الرد', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
redis:del('tshake:'..bot_id..'keko'..text..''..msg.chat_id_..'')
redis:del('tshake:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')
redis:del('tshake:'..bot_id..':voice:'..text..''..msg.chat_id_..'')
redis:del('tshake:'..bot_id..':video:'..text..''..msg.chat_id_..'')
redis:del('tshake:'..bot_id..':gif:'..text..''..msg.chat_id_..'')
redis:del('tshake:'..bot_id..':file:'..text..''..msg.chat_id_..'')
redis:srem('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
end
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text and text == "اضف تفاعل" then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p"..bot_id..msg.sender_user_id_,true)
return "keko"
end
if text and database:get("keko:set:ttt:p"..bot_id..msg.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '📥¦اراسل لان النص الذي يضهر', 1, 'md')
database:set("keko:set:ttt:p2"..bot_id..msg.sender_user_id_,true)
database:set("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_,text)
database:del("keko:set:ttt:p"..bot_id..msg.sender_user_id_)
return "keko"
end
if text and database:get("keko:set:ttt:p2"..bot_id..msg.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم الحفط', 1, 'md')
keko = database:get("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_)
database:sadd("keko:all:pppp:tt:"..bot_id,keko)
database:set("keko:set:text:p"..bot_id..keko,text)
database:del("keko:set:ttt:p2"..bot_id..msg.sender_user_id_)
return "keko"
end
if text and (text == "التفاعلات" or text == "قائمه التفاعلات" and end032 ) then
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
text23p = '📊¦كلمات التفاعل : \n\n'
if (not keko or not keko[1]) then
send(msg.chat_id_, msg.id_, 1, "📊¦لا يوجد", 1, 'html')
return "keko"
end
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
text23p = text23p.."|"..i.."| ~⪼ "..keko[i].." | "..tttee.."\n"
end
send(msg.chat_id_, msg.id_, 1, text23p ,1, 'html')
end
if text and text == "مسح قائمه التفاعلات" then
send(msg.chat_id_, msg.id_, 1, "📊¦تم الحذف" ,1, 'html')
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
for i=1, #keko do
database:del("keko:set:text:p"..bot_id..keko[i])
end
database:del('keko:all:pppp:tt:'..bot_id)
end
if text and text == "حذف تفاعل" then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_,true)
return "keko"
end
if text and database:get("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '📥¦اراسل لان التص الذي يضهر', 1, 'md')
database:del("keko:set:text:p"..bot_id..text)
database:srem('keko:all:pppp:tt:'..bot_id,text)
database:del("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_)
return "keko"
end
end

if text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسل الكلمه التي تريد اضافته', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'msg')
return false end
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'')
if keko1 == 'msg' and text then
send(msg.chat_id_, msg.id_, 1, '📥¦الان ارسل الرد الذي تريد اضافته \n📥¦ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
send(msg.chat_id_, msg.id_, 1,  '✔¦ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 're')
redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..'', text)
return false end
if text:match("^حذف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📥¦ارسل الكلمه التي تريد حذفها' , 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حذف الرد', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'no')
redis:del('tshake:'..bot_id..':sticker:'..text)
redis:del('tshake:'..bot_id..':voice:'..text)
redis:del('tshake:'..bot_id..':video:'..text)
redis:del('tshake:'..bot_id..':gif:'..text)
redis:del('tshake:'..bot_id..':file:'..text)
redis:del('tshake:'..bot_id..'keko'..text)
redis:srem('tshake:'..bot_id..'kekoresudo', text)
end
end
if text:match("^مسح المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('tshake:'..bot_id..'dev')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id..'dev')
redis:del('tshake:'..bot_id..'sudoo'..v)
end
send(msg.chat_id_, msg.id_, 1, "✔¦تم مسح مطورين البوت", 1, 'md')
end
if text:match("^مسح ردود المدير$") and (is_owner(msg) or is_creatorbasic(msg)) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
redis:del('tshake:'..bot_id..'keko'..v..''..msg.chat_id_)
redis:del('tshake:'..bot_id..':sticker:'..v..msg.chat_id_)
redis:del('tshake:'..bot_id..':voice:'..v..msg.chat_id_)
redis:del('tshake:'..bot_id..':video:'..v..msg.chat_id_)
redis:del('tshake:'..bot_id..':gif:'..v..msg.chat_id_)
redis:del('tshake:'..bot_id..':file:'..v..msg.chat_id_)
redis:del('tshake:'..bot_id..'keko'..v..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
end
if text:match("^مسح ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('tshake:'..bot_id..'kekoresudo')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id..'kekoresudo', text)
redis:del('tshake:'..bot_id..'keko'..v..'')
redis:del('tshake:'..bot_id..':sticker:'..v)
redis:del('tshake:'..bot_id..':voice:'..v)
redis:del('tshake:'..bot_id..':video:'..v)
redis:del('tshake:'..bot_id..':gif:'..v)
redis:del('tshake:'..bot_id..':file:'..v)
redis:del('tshake:'..bot_id..'keko'..v)
end
send(msg.chat_id_, msg.id_, 1, "✔¦تم مسح ردود المطور", 1, 'md')
end

if text:match("^المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('tshake:'..bot_id..'dev')
text = "⛔¦قائمه المطورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖¦لايوجد مطورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
------------------------------------
if text:match("^ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('tshake:'..bot_id..'kekoresudo')
text = "📑¦قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕¦لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^ردود المدير$") and (is_owner(msg) or is_creatorbasic(msg)) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
text = "📑¦قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕¦لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text:match("^كرر (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(كرر) (.*)$")}
send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end
if text:match("^وضع قوانين (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local txt = {string.match(text, "^(وضع قوانين) (.*)$")}
database:set('tshake:'..bot_id..'rules'..msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, "✔¦تم وضع القوانين للمجموعه", 1, 'md')
end
if text:match("^القوانين$") then
local rules = database:get('tshake:'..bot_id..'rules'..msg.chat_id_)
if rules then
send(msg.chat_id_, msg.id_, 1, '🤖¦قوانين المجموعه هي\n'..rules, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🤖¦لم يتم حفظ قوانين للمجموعه', 1, 'md')
end
end
if text:match("^وضع اسم (.*)$") and (is_mod(msg) or is_creatorbasic(msg))  then
local txt = {string.match(text, "^(وضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, '✔¦تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
end
if text:match("^وضع صوره") and (is_mod(msg) or is_creatorbasic(msg)) then
database:set('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥¦قم بارسال صوره الان', 1, 'md')
end
if text:match("^مسح الصوره") and (is_mod(msg) or is_creatorbasic(msg)) then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑¦تم مسح الصوره', 1, 'md')
end
if text:match("^وضع وصف (.*)$") and (is_mod(msg) or is_creatorbasic(msg)) then
local text = {string.match(text, "^(وضع وصف) (.*)$")}
bot.changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "✔¦تم وضع وصف للمجموعه", 1, 'md')
end
if text:match("^الوقت$") and (is_mod(msg) or is_creatorbasic(msg)) then
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘¦وقت المجموعه لا نهائي` ☑', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕¦عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end
if text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and (is_mod(msg) or is_creatorbasic(msg)) then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------------------------
if text and text:match('^تنظيف (%d+)$')  then  
local num = tonumber(text:match('^تنظيف (%d+)$')) 
if num > 1000 then 
send(msg.chat_id_, msg.id_, 1, ' تستطيح المسح فقط (1000) رساله \n', 1, 'md') 
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
delete_msg(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
end
send(msg.chat_id_, msg.id_, 1,'🗑¦ تم تنظيف {'..num..'} رساله من الكروب \n', 1, 'md')  
end
----------------------------------------------------------------------------------------------
if (text and text == 'تفعيل الايدي بالصوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦الايدي بالصوره بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل الايدي بالصوره', 1, 'md')
database:del('tshake:'..bot_id..'id:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي بالصوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦الايدي بالصوره بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل الايدي بالصوره', 1, 'md')
database:set('tshake:'..bot_id..'id:photo'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل جلب صوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦جلب صوره بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل جلب صوره', 1, 'md')
database:del('tshake:'..bot_id..'get:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل جلب صوره') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦جلب صوره بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل جلب صوره', 1, 'md')
database:set('tshake:'..bot_id..'get:photo'..msg.chat_id_,true)
end
end
if  (text and text == 'تفعيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
database:sadd('tshake:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم حذف المجموعه من الوضع المدفوع', 1, 'md')
database:srem('tshake:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تفعيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('tshake:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔¦الاذاعه بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل اذاعه البوت', 1, 'md')
database:del('tshake:'..bot_id..'bc:groups')
end
end
if (text and text == 'تعطيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('tshake:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔¦الاذاعه بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل اذاعه البوت', 1, 'md')
database:set('tshake:'..bot_id..'bc:groups',true)
end
end
if (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('tshake:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '✔¦مغادره بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل مغادره البوت', 1, 'md')
database:del('tshake:'..bot_id..'leave:groups'..msg.chat_id_)
end
end
if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('tshake:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '✔¦مغادره بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل مغادره البوت', 1, 'md')
database:set('tshake:'..bot_id..'leave:groups'..msg.chat_id_,true)
end
end
----------------------------------------
if text:match("^تغير رد المطور (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المطور (.*)$")}
database:set("tshake:name_sudo"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------------------
if text:match("^تغير رد المنشئ (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المنشئ (.*)$")}
database:set("tshake:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end

if text:match("^تغير رد منشئ الاساسي (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد منشئ الاساسي (.*)$")}
database:set("tshake:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text:match("^تغير رد المدير (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد المدير(.*)$")}
database:set("tshake:name_own"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text:match("^تغير رد الادمن (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد الادمن (.*)$")}
database:set("tshake:name_adm"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if text:match("^تغير رد العضو المميز (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد العضو المميز (.*)$")}
database:set("tshake:name_vipp"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------
if text:match("^تغير رد العضو فقط (.*)$") and (is_creator(msg) or is_creatorbasic(msg)) then
ac = {string.match(text, "^تغير رد العضو فقط (.*)$")}
database:set("tshake:name_nk"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if (text and (is_creator(msg) or is_creatorbasic(msg))) then
if text and text:match("اضف امر (.*)") then 
local tshake_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان الامر الجديد", 1, 'md')
database:set("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id,tshake_edis[1])
database:sadd('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_,tshake_edis[1])
elseif (database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then
send(msg.chat_id_, msg.id_, 1, "✔¦ تم الحفظ بنجاح", 1, 'md')
database:set("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("tshake:edit:text:su:new2:"..bot_id..msg.chat_id_..text,database:get("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("tsahke:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end
end
if text and text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
local klma = database:get("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
if klma ~= nil then
database:del("tshake:edit:text:su:new2:"..bot_id..msg.chat_id_..klma)
database:del("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
database:srem('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_,klma)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم المسح بنجاح", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ عذرآ لا يوجد امر بهاذا الاسم", 1, 'md')
end
if text == 'الاوامر المضافه' then
local list = database:smembers('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇لا توجد اوامر مضافه', 'html')
return false
end
t = '📝┇قائمه الاوامر المضافه هنا\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
for k,v in pairs(list) do
var = database:get("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..v)
if var then
t = t..''..k..'- '..v..' » ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_, 1,t, 'html')
end
end
if text == 'مسح الاوامر المضافه' then 
local list = database:smembers('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
for k,v in pairs(list) do
local klma = database:get("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..v)
if klma ~= nil then
database:del("tshake:edit:text:su:new2:"..bot_id..msg.chat_id_..klma)
database:del("tshake:edit:text:su:new:"..bot_id..msg.chat_id_..v)
end
end
database:del('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1,"📛┇تم مسح الاوامر جميعها", 'md')
end
if (text and text == "مسح صلاحيه") and (is_owner(msg) or is_creatorbasic(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔¦ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok")
return "Tshake"
end  
if (text and database:get("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
send(msg.chat_id_, msg.id_, 1, '✔¦تم حذف صلاحيه بنجاح', 1, 'md')
database:del("tshake:all_if:"..text..bot_id..msg.chat_id_)
database:srem('tshake:'..bot_id..'tshakenwe:slahea:'..msg.chat_id_,text)
database:del("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_)
end
if (text and text == "اضف صلاحيه") and (is_owner(msg) or is_creatorbasic(msg)) then 
send(msg.chat_id_, msg.id_, 1, '✔¦ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tshake:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "TSHAKE"
end
if text and database:get("tshake:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("tshake:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📥¦الان ارسل نوع الصلاحيه المطلوبه \n🔰¦{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
database:set("tshake:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_,text)
database:set("tshake:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
database:sadd('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_,text)
return "TSHAKE"
end
if (text and database:get("tshake:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
if (text == "ادمن" or text == "مدير" or text == "عضو مميز" or text == "لا شيئ") then 
database:del("tshake:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)
tsha_text = database:get("tshake:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '☑️¦تم حفض الصلاحيه بنجاح \n⚠️¦الاوامر { رفع/تنزيل '..tsha_text..' }', 1, 'md')
database:set("tshake:all_if:"..tsha_text..bot_id..msg.chat_id_,text)
database:set("tshakenwe:slahea:bot"..tsha_text..bot_id..msg.chat_id_,text)
database:del("tshake:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
else 
send(msg.chat_id_, msg.id_, 1, '📥¦الان ارسل نوع الصلاحيه المطلوبه \n🔰¦{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
end
end
if text =='مسح الصلاحيات' and (is_owner(msg) or is_creatorbasic(msg)) then 
local list = database:smembers('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
for k,v in pairs(list) do
local list = database:smembers('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_)
for k,ks in pairs(list) do
ts_text = database:get("tshake:all_if:"..v..bot_id..msg.chat_id_)
if ts_text then 
database:del("tshake:name_user:"..bot_id..msg.chat_id_..ks)
end
end
database:del("tshake:all_if:"..v..bot_id..msg.chat_id_)
database:del("tshakenwe:slahea:bot"..v..bot_id..msg.chat_id_)
end
database:del('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '📮¦تم مسح الصلاحيات \n', 1, 'md')
end
if text == 'الصلاحيات' and (is_owner(msg) or is_creatorbasic(msg)) then
local list = database:smembers('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖¦لا توجد صلاحيات مضافه', 'html')
return false
end
t = '📝¦قائمه الصلاحيات المضافه هنا\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
for k,v in pairs(list) do
var = database:get("tshakenwe:slahea:bot"..v..bot_id..msg.chat_id_)
if var then
t = t..''..k..'- '..v..' » ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_, 1,t, 'html')
end
if text then
if text:match("^رفع (.*)$")  and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
a = {string.match(text, "^رفع (.*)$")}
ts_text = database:get("tshake:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then
function promote_by_reply(extra, result, success)
if ts_text == "ادمن" then
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_,a[1])
function keko33332(extra,result2,success)
info = '🤖¦ العضو »> ['..result2.first_name_..'](t.me/'..(result2.username_ or 'disco3')..')\n✔¦تم رفعه '..a[1]
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(result.sender_user_id_, keko33332)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
end
if text:match("^رفع (.*) @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^رفع (.*) @(.*)$")}
ts_text = database:get("tshake:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then
function promote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..result.id_,apmd[1])
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n✔¦تم رفعه '..apmd[1]
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
end
if text:match("^رفع (.*) (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^رفع (.*) (%d+)$")}
ts_text = database:get("tshake:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then
if ts_text == "ادمن" then
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..apmd[2],apmd[1])
tsX000(apmd[2],msg,"✔¦تم رفعه "..apmd[1])
end
end
if text:match("^تنزيل (.*)$") and (is_owner(msg) or is_creatorbasic(msg)) and msg.reply_to_message_id_ then
a = {string.match(text, "^تنزيل (.*)$")}
ts_text = database:get("tshake:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then
function demote_by_reply(extra, result, success)
if ts_text == "ادمن" then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:del("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
tsX000("prore",msg,"✔¦ تم تنزيله من "..a[1])
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
end
if text:match("^تنزيل (.*) @(.*)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^تنزيل (.*) @(.*)$")}
ts_text = database:get("tshake:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then
function demote_by_username(extra, result, success)
if result.id_ then
if ts_text == "ادمن" then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
texts = '🤖¦ العضو »> ['..result.title_..'](t.me/'..(apmd[2] or 'disco3')..')\n✔¦تم تنزيله من '..apmd[1]
database:del("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
else
texts = '✖¦خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
end
if text:match("^تنزيل (.*) (%d+)$") and (is_owner(msg) or is_creatorbasic(msg)) then
local apmd = {string.match(text, "^تنزيل (.*) (%d+)$")}
ts_text = database:get("tshake:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then
if ts_text == "ادمن" then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
tsX000(apmd[2],msg,"✔¦ تم تنزيله من "..apmd[1])
database:del("tshake:name_user:"..bot_id..msg.chat_id_..apmd[2])
end
end
end
if (text and text == 'تفعيل ردود المطور') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦ردود المطور بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل ردود المطور', 1, 'md')
database:del('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_)
end
end
if  (text and text == 'تعطيل ردود المطور') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦ردود المطور بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'تم تعطيل ردود المطور', 1, 'md')
database:set('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل ردود المدير') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦ردود المدير بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل ردود المدير', 1, 'md')
database:del('tshake:'..bot_id..'repowner:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل ردود المدير') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦ردود المدير بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل ردود المدير', 1, 'md')
database:set('tshake:'..bot_id..'repowner:mute'..msg.chat_id_,true)
end
end
if text:match("^ايدي المجموعه$") then
send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
end
if (text and text == 'تفعيل الايدي') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦الايدي بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل الايدي', 1, 'md')
database:del('tshake:'..bot_id..'id:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦الايدي بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل الايدي', 1, 'md')
database:set('tshake:'..bot_id..'id:mute'..msg.chat_id_,true)
end
end
if (text and text == "تعطيل الرابط" and is_owner(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل امر الروابط', 1, 'md')
database:set("tshake:mute:link:gr:"..bot_id..msg.chat_id_,"ok")
end
if (text and text == "تفعيل الرابط" and is_owner(msg)) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل امر الروابط', 1, 'md')
database:del("tshake:mute:link:gr:"..bot_id..msg.chat_id_)
end
if text and text == "تعين مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔¦ تم تعين ~⪼ `'..msg.chat_id_..'`', 1, 'md')
database:set("tshake"..bot_id..":sudo:gr",msg.chat_id_)
end
if text and text == "مسح مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔¦ تم مسح مجموعه المطور', 1, 'md')
database:del("tshake"..bot_id..":sudo:gr")
end
if text:match("^ايدي$") and msg.reply_to_message_id_ == 0 then
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local function getpro(extra, result, success)
local all_photo_tshake = result.total_count_
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))
end
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local ikeko_text = "غير متفاعل"
if user_msgs then
if tonumber(user_msgs) < 50 then
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1] and end032) then
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then
ikeko_text = tttee
end
end
end
end
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if result.photos_[0] then
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي '
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg) then
t =  database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creatorbasic(msg) then
t =  database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t =  database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if  msg.sender_user_id_ == 426795071 then
t =  'مطور السورس ' 
end
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"\n💳¦ايديك ~⪼ "..msg.sender_user_id_.."\n🎫¦معرفك ~⪼ "..keko_info.."\n👨‍✈️¦رتبتك ~⪼ "..t.."\n📨¦رسائلك ~⪼ "..user_msgs.."\n📧¦السحكات ~⪼ "..edit.."\n⌨️¦تتفاعلك ~⪼ "..ikeko_text.."\n💎¦مجموع مجوهراتك ~⪼ "..nko.."\n",msg.id_,msg.id_.."")
else
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))

sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,tshake_new_text,msg.id_,msg.id_.."")
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي '
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg) then
t =  database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if  msg.sender_user_id_ == 426795071 then
t =  'مطور السورس '
end
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💳¦ايديك ~⪼ "..msg.sender_user_id_.."\n🎫¦معرفك ~⪼ "..keko_info.."\n👨‍✈️¦رتبتك ~⪼ "..t.."\n📨¦رسائلك ~⪼ "..user_msgs.."\n📧¦السحكات ~⪼ "..edit.."\n⌨️¦تتفاعلك ~⪼ "..ikeko_text.."\n💎¦مجموع مجوهراتك ~⪼ "..nko.."\n", 1, 'html')
else
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
end
end
else
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي '
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg) then
t =  database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "❕نت لا تملك صوره لحسابك\n💳¦ايديك ~⪼ "..msg.sender_user_id_.."\n🎫¦معرفك ~⪼ "..keko_info.."\n👨‍✈️¦رتبتك ~⪼ "..t.."\n📨¦رسائلك ~⪼ "..user_msgs.."\n📧¦السحكات ~⪼ "..edit.."\n⌨️¦تتفاعلك ~⪼ "..ikeko_text.."\n💎¦مجموع مجوهراتك ~⪼ "..nko.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي '
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت'
elseif is_malik(msg) then
t =  database:get("tshake:name_malik"..bot_id..msg.chat_id_) or 'مالك المجموعه'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre1"..bot_id..msg.chat_id_) or 'منشئ اساسي'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_if:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن للكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط'
end
if  msg.sender_user_id_ == 426795071 then
t =  'مطور السورس '
end
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💳¦ايديك ~⪼ "..msg.sender_user_id_.."\n🎫¦معرفك ~⪼ "..keko_info.."\n👨‍✈️¦رتبتك ~⪼ "..t.."\n📨¦رسائلك ~⪼ "..user_msgs.."\n📧¦السحكات ~⪼ "..edit.."\n⌨️¦تتفاعلك ~⪼ "..ikeko_text.."\n💎¦مجموع مجوهراتك ~⪼ "..nko.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))

send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
end
end
else
end
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text:match("^معلومات (.*)$") then
local memb = {string.match(text, "^(معلومات) (.*)$")}
function whois(extra,result,success)
if result.username_ then
result.username_ = '@'..result.username_
else
result.username_ = 'لا يوجد معرف'
end
send(msg.chat_id_, msg.id_, 1, '📜¦معرف ~⪼ ('..(result.username_..')\n🔘¦الاسم ~⪼ ('..result.first_name_ or "tshake")..')', 1, 'md')
end
getUser(memb[2],whois)
end
if (text and text == 'تفعيل التثبيت') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦التثبيت بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تفعيل التثبيت', 1, 'md')
database:del('tshake:'..bot_id..'pin:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل التثبيت') and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔¦التثبيت بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦تم تعطيل التثبيت', 1, 'md')
database:set('tshake:'..bot_id..'pin:mute'..msg.chat_id_,true)
end
end
if text:match("^تثبيت$") and (is_mod(msg) or is_creatorbasic(msg)) and not is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم تثبيت الرساله',1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦التثبيت معطل',1, 'md')
end
end
if text:match("^الغاء تثبيت$") and (is_mod(msg) or is_creatorbasic(msg)) and not is_owner(msg) or text:match("^الغاء التثبيت") and (is_mod(msg) or is_creatorbasic(msg)) and not is_owner(msg) then
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم الغاء تثبيت الرساله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔¦الغاء التثبيت معطل', 1, 'md')
end
end
if text:match("^تثبيت$") and (is_owner(msg) or is_creatorbasic(msg)) then
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم تثبيت الرساله',1, 'md')
end
if text:match("^الغاء تثبيت$") and (is_owner(msg) or is_creatorbasic(msg)) or text:match("^الغاء التثبيت") and (is_owner(msg) or is_creatorbasic(msg)) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔¦تم الغاء تثبيت الرساله', 1, 'md')
end
if text:match("^مشاهده منشور$") then
database:set('tshake:'..bot_id..'viewget'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥¦قم بارسال المنشور الان ',1, 'md')
end
if (text and text == 'استعاده الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('tshake:'..bot_id..'help', text)
redis:del('tshake:'..bot_id..'h1', text)
redis:del('tshake:'..bot_id..'h2', text)
redis:del('tshake:'..bot_id..'h3', text)
redis:del('tshake:'..bot_id..'h4', text)
redis:del('tshake:'..bot_id..'h5', text)
redis:del('tshake:'..bot_id..'h6', text)
send(msg.chat_id_, msg.id_, 1, '✔¦تم استعاده جميع كلايش الاوامر', 1, 'html')
end
if (text and text == 'تغير امر الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'help', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
---------------
if text == 'سمايلات' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:ids'..msg.chat_id_)
katu = {'🍏','🍎','🍐','🍊','🍋','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🥖','🥐','🍞','🥨','🍟','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍠','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','??','🎪','🎟','🎫','🎗','🏵','☑','🏆','🥌','🛷','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmos'..msg.chat_id_,name)
taha = '🚀¦اسرع واحد يدز » {`'..name..'`}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmos'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:ids'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:ids'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل سمايلات ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:ids'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'الاسرع' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id'..msg.chat_id_)
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
taha = '🚀¦اسرع واحد يرتبها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmo'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل الاسرع ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1) 
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'حزوره' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id1'..msg.chat_id_)
katu = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmoa'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفظ الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
taha = '🕐¦اسرع واحد يحلها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmoa'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id1'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id1'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل حزوره ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id1'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'المعاني' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id2'..msg.chat_id_)
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'means'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','??')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
taha = '🔵¦اول واحد يكتب معنئ السمايل » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'means'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id2'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id2'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل المعاني ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id2'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'العكس' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id3'..msg.chat_id_)
katu = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'aks'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'موحلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'عدل','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
taha = '✖️¦عكس كلمه » {'..name..'} 🤖️'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'aks'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id3'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id3'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل العكس ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id3'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
taha = "*📬¦ عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n"
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end 
local GETNUM = database:get('tshake:'..bot_id.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 5)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 5)    
taha = '*🔖¦ مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸¦ تم اضافة { 5 } من النقاط *\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '\n*📮¦ اوبس لقد خسرت في اللعبه \n📬¦ حظآ اوفر في المره القادمه \n🔰¦ كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = '\n*📛¦ اوبس تخمينك غلط \n📌¦ ارسل رقم تخمنه مره اخرى \n*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
end
end
end
------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
taha = "*📬¦ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخرى*\n"
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end 
local GETNUM = database:get('tshake:'..bot_id.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '*📮¦ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n🎊¦ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 3)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 3)    
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '\n*📮¦ للاسف لقد خسرت \n📬¦ المحيبس بل ايد رقم { '..GETNUM..' }\n💥¦ حاول مره اخرى للعثور على المحيبس *'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
end
end
------------------------------------------------------------------------
if text == 'المختلف' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
database:del('tshake:'..bot_id..'l:idss'..msg.chat_id_)
database:set('tshake:'..bot_id..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑??🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️??‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓????🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
TEST = '  اول واحد يطلع المختلف » {* '..name..' * } ' 
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end
------------------------------------------------------------------------
if text == 'امثله' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_,name)
database:del('tshake:'..bot_id..'l:idst'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
TEST = 'اكمل المثل التالي {* '..name..' *}'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..':Set_alii:'..msg.chat_id_) or '57999')..'' then -- // المختلف
if not database:get('tshake:'..bot_id..'l:idss'..msg.chat_id_) then 
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
database:del('tshake:'..bot_id..':Set_alii:'..msg.chat_id_)
taha = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
database:set('tshake:'..bot_id..'l:idss'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_) or '6499')..'' then -- // امثله
if not database:get('tshake:'..bot_id..'l:idst'..msg.chat_id_) then 
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
database:del('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_)
taha = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
database:set('tshake:'..bot_id..'l:idst'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == 'محيبس' or text == 'بات' then
if database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then   
Num = math.random(1,6)
database:set('tshake:'..bot_id.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
📮¦ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁¦ الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
database:setex('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
------------------------------------------------------------------------
if text == 'خمن' or text == 'تخمين' then   
if database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
Num = math.random(1,20)
database:set('tshake:'..bot_id.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n🎮¦ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'⚠¦ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'🔖¦ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n💥*'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
database:setex('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end


if text =='مجوهراتي' then
if tonumber((database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💎¦ ليس لديك مجوهرات \n📬¦ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = '*💎¦ عدد مجوهراتك الحاليه  ('..(database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_))..')*'
taha1 = '*💎¦ مجموع مجوهراتك  ('..(database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))..')*'

send(msg.chat_id_, msg.id_, 1,''..taha..'\n'..taha1..'', 1, 'md')
end
end

if text:match('^رسائل المجوهرات (%d+)$') and (is_creator(msg) or is_creatorbasic(msg)) then
local kara = {string.match(text, "^(رسائل المجوهرات) (%d+)$")}
if tonumber(kara[2]) > 500 or tonumber(kara[2]) < 1 then
msgg = '💎¦لا تستطيع وضع اكثر من 500 رساله ❌ '
send(msg.chat_id_, msg.id_, 1, msgg, 1, 'html')
else
database:set('tshake:'..bot_id..'gamepoint' .. msg.chat_id_, kara[2] or 50)
send(msg.chat_id_, msg.id_, 1,'💎¦تم اضافه عدد الرسائل المطلوب ✅  ', 1, 'md')
end
end
if text == 'بيع مجوهراتي' then
if tonumber((database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💠¦ ليس لديك مجوهرات \n📬¦ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = (database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) * tonumber(database:get('tshake:'..bot_id..'gamepoint' .. msg.chat_id_)or 50))
database:incrby('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,taha)
database:del('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)
taha = tonumber((database:get('tshake:'..bot_id..'gamepoint' .. msg.chat_id_) or 50))
send(msg.chat_id_, msg.id_, 1,'💎¦ تم بيع جواهرك كل مجوهره تساوي '..taha..' رساله', 'md')
end
end
if text == 'حذف مجوهراتي' then
database:del('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "تم حذف جميع مجوهراتك", 1, "md")
end
if text == 'حذف رسائلي' then
database:del('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "تم حذف جميع رسائلك ", 1, "md")
end
if text:match("^reboot$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '✔¦تم اعادة تشغيل بنجاح ', 1, 'md')
os.execute('rm -rf Tshake')
os.execute('wget https://raw.githubusercontent.com/Reda9991/Tshake/master/Tshake.lua')
os.execute('./Tshake/ts')
os.exit()
return false
end
---------------------------------------------------------------------------
if text == 'تفعيل اللعبه' then   
send(msg.chat_id_, msg.id_, 1,[[*
🎮| تم تفعيل الالعاب بنجاح  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📋| الالعاب المتاحه لديك هي ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚸| ارسل امر (الاسرع) لبدء لعبه
🚸| ارسل امر (سمايلات) لبدء لعبه
🚸| ارسل امر (حزوره) لبدء لعبه
🚸| ارسل امر (المعاني) لبدء لعبه
🚸| ارسل امر (العكس) لبدء لعبه
🚸| ارسل امر (بات) لبدء لعبه
🚸| ارسل امر (خمن) لبدء لعبه
🚸| ارسل امر (امثله) لبدء لعبه
🚸| ارسل امر (المختلف) لبدء لعبه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]], 1, 'md')
database:set('tshake:'..bot_id..'lock_geam'..msg.chat_id_,true)  
end
if text == 'تعطيل اللعبه' and (is_owner(msg) or is_creatorbasic(msg)) then
riida = '*📛¦*تم تعطيل اللعبه  ❌'
send(msg.chat_id_, msg.id_, 1,riida, 1, 'md')
database:del('tshake:'..bot_id..'lock_geam'..msg.chat_id_)
end
if text == 'الالعاب' then   
send(msg.chat_id_, msg.id_, 1,[[*
🎮| اهلا بك في الالعاب  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📋| الالعاب المتاحه لديك هي ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚸| ارسل امر (الاسرع) لبدء لعبه
🚸| ارسل امر (سمايلات) لبدء لعبه
🚸| ارسل امر (حزوره) لبدء لعبه
🚸| ارسل امر (المعاني) لبدء لعبه
🚸| ارسل امر (العكس) لبدء لعبه
🚸| ارسل امر (بات) لبدء لعبه
🚸| ارسل امر (خمن) لبدء لعبه
🚸| ارسل امر (امثله) لبدء لعبه
🚸| ارسل امر (المختلف) لبدء لعبه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]], 1, 'md')
end
----------------
if text:match("^الاوامر$") and (is_mod(msg) or is_creatorbasic(msg)) then
local help = redis:get('tshake:'..bot_id..'help')
local text =  [[*📮¦هناك {5} اوامر لعرضها
➖🔹➖🔹➖🔹➖🔹
🗑¦م1 ~⪼ لعرض اوامر الحمايه

📚¦م2 ~⪼ لعرض اوامر الادمنيه

🗓¦م3 ~⪼ لعرض اوامر المدراء

☑¦م4 ~⪼ لعرض اوامر المطورين

🔖¦م5 ~⪼لعرض اوامر التقيد
➖🔹➖🔹➖🔹➖*
]]
send(msg.chat_id_, msg.id_, 1, (help or text), 1, 'html')
end
if (text and text == 'تغير امر م1') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h11'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h1', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م1$") or text == "م١") and (is_mod(msg) or is_creatorbasic(msg)) then
local h1 = redis:get('tshake:'..bot_id..'h1')
local text =  [[
📮¦ اوامر حمايه المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⏺¦قفل/فتح + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔐¦الروابط
??¦المعرف
??¦التاك
🔐¦الشارحه
🔐¦التعديل
🔐¦التثبيت
🔐¦المتحركه
🔐¦الملفات
🔐¦الصور

🔐¦الملصقات
🔐¦الفيديو
🔐¦الانلاين
🔐¦الدردشه
🔐¦التوجيه
🔐¦الاغاني
🔐¦الصوت
🔐¦الجهات
🔐¦الاشعارات
🔐¦الماركدون
🔐¦التعديل
🔐¦تعديل الميديا
??¦البوتات
??¦العربيه
🔐¦الانكليزية
🔐¦الميديا
🔐¦التكرار
🔐¦تعديل الميديا
🔐¦الكلايش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, (h1 or text), 1, 'html')
end
if (text and text == 'تغير امر م2') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h22'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h2', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م2$") or text == "م٢") and (is_mod(msg) or is_creatorbasic(msg)) then
local h2 = redis:get('tshake:'..bot_id..'h2')
local text =  [[
🥈¦اوامر الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚫¦كتم
🚷¦حظر
🚷¦طرد
🚫¦منع + الكلمه
⏺¦الغاء حظر
⏺¦الغاء كتم
⏺¦الغاء منع + الكلمه
??¦المحظورين
📋¦المكتومين
📋¦قائمه المنع

ℹ️¦تثبيت
⏺¦الغاء تثبيت
📄¦الاعدادات

🗳¦الرابط
📃¦القوانين

👋🏻¦وضع/حذف/جلب الترحيب
👋🏻¦تفعيل/تعطيل الترحيب
⚠️¦تفعيل/تعطيل الابلاغ
⚠️¦تعين عدد الابلاغ + العدد

📡¦معلومات + ايدي
📲¦الحساب + ايدي
📣¦كرر + الكلمه

💭¦ايدي
💭¦جهاتي
💭¦سحكاتي
💭¦رسائلي
💭¦ابلاغ
💭¦معلومات الكروب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘¦وضع + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📝¦اسم
📝¦رابط
📝¦صوره
📝¦وصف
📝¦قوانين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑¦مسح + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📮¦قائمه المنع
📮¦المحظورين
📮¦المكتومين
📮¦القوانين
📮¦البوتات
📮¦الصوره
📮¦الرابط
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, (h2 or text), 1, 'html')
end
if (text and text == 'تغير امر م3') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h33'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h3', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م3$") or text == "م٣") and (is_mod(msg) or is_creatorbasic(msg)) then
local h3 = redis:get('tshake:'..bot_id..'h3')
local text =  [[
🥇¦ اوامر المدراء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘¦وضع :- مع الاوامر ادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔢¦تكرار + العدد
⏺¦زمن التكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↕️¦رفع/تنزيل ادمن
↕️¦رفع/تنزيل عضو مميز

💬¦تفعيل/تعطيل الايدي بالصوره
💬¦تفعيل/تعطيل الايدي
💬¦تفعيل/تعطيل ردود المطور
💬¦تفعيل/تعطيل اللعبه
💬¦تفعيل/تعطيل ردود المدير
💬¦تفعيل/تعطيل التثبيت
💬¦تفعيل/تعطيل اطردني

🖇¦رفع الادمنيه
🖇¦اضف/حذف رد
??¦الادمنيه
📋¦ردود المدير
📋¦ادمنيه المجموعه
📋¦الاعضاء المميزين

??¦تنظيف + عدد
🗑¦مسح الادمنيه
🗑¦مسح ردود المدير
🗑¦مسح الاعضاء المميزين
🗑¦تنظيف قائمه المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🏅¦اوامر المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↕️¦رفع/تنزيل مدير
📋¦المدراء
🗑¦مسح المدراء
🚫¦طرد المحذوفين
🚫¦طرد المتروكين
🗑¦تنظيف قائمه المحظورين
🔘¦تعين/مسح الايدي
📎¦اضف/مسح صلاحيه
➕¦اضف/مسح امر + اسم الامر
🚸¦تفعيل/تعطيل الطرد/الحظر
💭¦اضف/حذف امر + اسم الامر
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, (h3 or text), 1, 'html')
end
if (text and text == 'تغير امر م4') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h44'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '✔¦تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h4', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return
false
end
end
if (text:match("^م4$") or text == "م٤") and is_sudo(msg) then
local h4 = redis:get('tshake:'..bot_id..'h4')
local text =  [[
☑¦اوامر المطور
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✳️¦تفعيل/تعطيل
⏺¦تفعيل/تعطيل المغادره
⏺¦تفعيل/تعطيل الاذاعه
⏺¦تفعيل/تعطيل التفعيل التلقائي

🔘¦وضع وقت + عدد
🔘¦المده1 + id
🔘¦المده2 + id
🔘¦المده3 + id
🔘¦وقت المجموعه + id
🔘¦مغادره + id
🔘¦مغادره
🔘¦اضف/مسح رد للكل
📋¦ردود المطور

🔘¦تغير امر المطور
🔘¦تغير/مسح امر المطور بالكليشه
🔘¦تعين/مسح مجموعه المطور
📄¦عدد الكروبات/الاحصائيات
📋¦روابط الكروبات


🚫¦حظر عام
⏺¦الغاء العام
🚫¦كتم عام
⏺¦الغاء كتم العام
📋¦قائمه العام
📋¦المكتومين عام

↕️¦اضف/حذف مطور
↕️¦رفع/تنزيل مدير
↕️¦رفع/تنزيل منشئ
📋¦المدراء
📋¦المنشئين
📋¦المطورين

🗑¦استعاده الاوامر
🗑¦مسح ردود المطور
🗑¦مسح المطورين
🗑¦مسح قائمه العام
🗑¦مسح المدراء
🗑¦مسح المنشئين
🗑¦مسح المكتومين عام

🏷¦تغير امر {الاوامر ، م1 ، م2 ، م3 ، م4}
🏷¦مشاهده منشور
🏷¦اذاعه

💎¦رفع المالك
💎¦تنزيل المالك
¦تنزيل المالك

🗯¦تغير نص الانلاين + النص
🗯¦تغير رابط الانلاين + الرابط
🗯¦تفعيل/تعطيل الانلاين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉

]]
send(msg.chat_id_, msg.id_, 1, (h4 or text), 1, 'html')
end
if (text and text == 'تغير امر م5') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥¦الان يمكنك ارسال الكليشه ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'hres1'..msg.sender_user_id_..'', 'msg')
return false 
end
if text == "م5" or text == "اوامر التقييد" and is_mod(msg) then
local hres = redis:get('tshake:'..bot_id..'hres')
local text =[[
📮¦ اوامر حمايه المجموعه بالتقييد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔒¦قفل ~⪼ لقفل امر
🔓¦فتح ~⪼ لفتح امر
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔐¦الروابط بالتقيد
🔐¦المعرف بالتقيد
🔐¦التاك بالتقيد
🔐¦الشارحه بالتقيد
🔐¦المتحركه بالتقيد
🔐¦الملفات بالتقيد
🔐¦الصور بالتقيد
🔐¦الملصقات بالتقيد
🔐¦الفيديو بالتقيد

🔐¦الانلاين بالتقيد
🔐¦الدردشه بالتقيد
🔐¦التوجيه بالتقيد
🔐¦الاغاني بالتقيد
🔐¦الصوت بالتقيد
🔐¦الجهات بالتقيد
🔐¦الماركدون بالتقيد
🔐¦العربيه بالتقيد
🔐¦الانكليزية بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚹¦تقيد
🚹¦الغاء تقيد
🚹¦المقيدين
🚹¦مسح المقيدين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, (hres or text), 1, 'md')
end
if text:match("^اصدار$") or text:match("^الاصدار$") or text:match("^السورس$") or text:match("^سورس$") then
local text =  [[
     
<a href="https://telegram.me/disco3">مرحبا بك في سورس مونستر V2</a>
┉ ┉ ┉ ┉ ┉💠┉ ┉ ┉ ┉
<a href="https://telegram.me/riida">الســورس تابع ل Ridha Mohammed</a>
<a href="https://t.me/city5_bot">تواصل</a>
<a href="https://t.me/yytt_bot">بوت يوتيوب</a>
<a href="https://t.me/disco3">قناة المطــور</a>

┉ ┉ ┉ ┉ ┉💠┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^اريد رابط حذف$") or text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^الرابط حذف$") or text:match("^اريد رابط الحذف$") then
local text =  [[
🗑¦رابط حذف التلي ، ⬇
‼¦احذف ولا ترجع عيش حياتك'
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔎¦<a href="https://telegram.org/deactivate">اضغط هنا للحذف الحساب" </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
end
function tdcli_update_callback(data)
local chat = {}
if (data.ID == "UpdateNewMessage") then
local Data_Tshake = data
msg = data.message_
text = msg.content_.text_
if database:get('tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:sadd("thsake:good"..bot_id..os.date("%d"),msg.chat_id_)
database:del("thsake:good"..bot_id..( tonumber(os.date("%d")) - 1) )
if (not is_mod(msg) and not is_vip(msg)) then
print("»» is member "..msg.sender_user_id_)
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "tshake"
end
z_tshake = TSCheckMsg(msg)
if z_tshake and z_tshake == "stop" then
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
end
if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'tshake:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
database:set('tshake:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️¦تم كشف عمليه تخريب في المجموعة \n‼️¦وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🎫¦الايدي ~⪼*('..msg.sender_user_id_..')* \n❕¦قمت بعمل تكرار للرسائل المحدده\n✔¦وتم كتمك في المجموعه\n', 1, 'md')
end
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
return "TsHaKe"
end
end
if data.message_.content_.text_ then
if database:get("tshake:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_) then
local tshake_edit_text = database:get("tshake:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_)
if tshake_edit_text then
data.message_.content_.text_ = tshake_edit_text
end
end
end
local msg = data.message_
text = msg.content_.text_
if is_sudo(msg) then
if database:get("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_) then
database:del("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_)
local pro = database:scard('tshake:'..bot_id..'pro:groups') or 0
if text then
local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
send(gpss[i], 0, 1, text, 1, 'html')
end
end
end
if (data.message_.content_.sticker_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
end
end
elseif (data.message_.content_.voice_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
end
end
elseif (data.message_.content_.video_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
end
end
elseif (data.message_.content_.animation_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
end
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
end
end
elseif (data.message_.content_.photo_) then
local id_keko = nil
if data.message_.content_.photo_.sizes_[0] then
id_keko = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_keko = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_keko = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[3] then
id_keko = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_keko,(msg.content_.caption_ or " "))
end
end
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '✔¦تم نشر الرساله في {'..(#gpss - pro)..'} مجموعه ', 1, 'md')
end
end
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 're' then
local keko2 = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if text then
redis:set('tshake:'..bot_id..'keko'..keko2..''..msg.chat_id_..'', text)
elseif (data.message_.content_.sticker_) then
redis:set('tshake:'..bot_id..':sticker:'..keko2..''..msg.chat_id_..'', data.message_.content_.sticker_.sticker_.persistent_id_)
elseif (data.message_.content_.voice_) then
redis:set('tshake:'..bot_id..':voice:'..keko2..''..msg.chat_id_..'', data.message_.content_.voice_.voice_.persistent_id_)
elseif (data.message_.content_.video_) then
redis:set('tshake:'..bot_id..':video:'..keko2..''..msg.chat_id_..'', data.message_.content_.video_.video_.persistent_id_)
elseif (data.message_.content_.animation_) then
redis:set('tshake:'..bot_id..':gif:'..keko2..''..msg.chat_id_..'', data.message_.content_.animation_.animation_.persistent_id_)
elseif (data.message_.content_.document_) then
redis:set('tshake:'..bot_id..':file:'..keko2..''..msg.chat_id_..'', data.message_.content_.document_.document_.persistent_id_)
else
end -- end if text
redis:sadd('tshake:'..bot_id..'kekore'..msg.chat_id_..'', keko2)
send(msg.chat_id_, msg.id_, 1, "✔¦تم حفظ الرد", 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
end
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'')
if keko1 == 're' then
local keko2 = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..'')
if text then
redis:set('tshake:'..bot_id..'keko'..keko2..'', text)
elseif (msg.content_.sticker_) then
redis:set('tshake:'..bot_id..':sticker:'..keko2, msg.content_.sticker_.sticker_.persistent_id_)
elseif (msg.content_.voice_) then
redis:set('tshake:'..bot_id..':voice:'..keko2, msg.content_.voice_.voice_.persistent_id_)
elseif (msg.content_.video_) then
redis:set('tshake:'..bot_id..':video:'..keko2, msg.content_.video_.video_.persistent_id_)
elseif (msg..content_.animation_) then
redis:set('tshake:'..bot_id..':gif:'..keko2, data.message_.content_.animation_.animation_.persistent_id_)
elseif (msg.content_.document_) then
redis:set('tshake:'..bot_id..':file:'..keko2, msg.content_.document_.document_.persistent_id_)
end
redis:sadd('tshake:'..bot_id..'kekoresudo', keko2)
send(msg.chat_id_, msg.id_, 1, "✔¦تم حفظ الرد", 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'no')
end
--         »»                 Run TshAkE                         ««              --
if is_mod(msg) then TSlocks(msg) print("\27[1;34m»» is mod "..msg.sender_user_id_.."\27[m") end
TSall(msg,data)
function check_username(extra,result,success)
local username = (result.username_ or '')
local svuser = 'tshake:'..bot_id..'user:'..result.id_
if username then
database:hset(svuser, 'username', username)
end
end
getUser(msg.sender_user_id_,check_username)
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatJoinByLink" then
function get_welcome(extra,result,success)
if database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_) then
text = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
else
text = '👋🏻¦اهلا بك يا ؛ {fname}\n🙋🏼‍♂️¦نورت الكروب ؛ @{user}'
end
local text = text:gsub('{fname}',(result.first_name_ or 'لا يوجد'))
local text = text:gsub('{lname}',(result.last_name_ or 'لا يوجد'))
local text = text:gsub('{user}',(result.username_ or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if database:get('tshake:'..bot_id.."welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end end
if msg.content_.ID == "MessagePinMessage" then
if database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_) and database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
local pin_id = database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_)
pin(msg.chat_id_,pin_id,0)
end
end
end
TSadd(msg)
if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_sudo(msg) then TSsudo(msg) print("\27[1;32m»» DEVBOT "..msg.sender_user_id_.."\27[m") end
id = tostring(msg.chat_id_)
if id and id:match('^(%d+)') then
database:sadd('tshake:'..bot_id.."userss",msg.chat_id_)
end
tshake_run_file(Data_Tshake)
--         »»                 Start UpdateChat                         ««              --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local msgg = result 
database:incr('tshake:'..bot_id..'user:editmsg'..msgg.chat_id_..':'..msgg.sender_user_id_)
if (result.content_.caption_ and not is_vip(msgg)) then 
if (result.content_.caption_:match("(.*)@(.*)") or result.content_.caption_:match("@")) then 
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
end
if database:get("ridha:lock:tshake"..msg.chat_id_..bot_id) and not result.content_.text_ and not is_creator(msgg) and not is_creatorbasic(msgg) then
function get_edit(arg,data)
local username = data.username_
local name = data.first_name_
local iduser = data.id_
if data.username_ ~= false then
send(msg.chat_id_,0, 1, " • قام الشخص بتعديل الميديا ~🎚\n ▪︎وتم مسح رسالته {@"..data.username_.."}" , 1, 'html')  
else
send(msg.chat_id_,0, 1, " • قام الشخص بتعديل الميديا ~🎚\n ▪︎وتم مسح رسالته {@"..data.username_.."}" , 1, 'html')  
end
end
getUser(result.sender_user_id_,get_edit)
delete_msg(msg.chat_id_,{[0] = msg.message_id_}) 
elseif database:get("ridha:lock:tshake:kick"..msg.chat_id_..bot_id) and not result.content_.text_ and not is_creator(msgg) and not is_creatorbasic(msgg) then
function get_edit(arg,data)
local username = data.username_
local name = data.first_name_
local iduser = data.id_
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "قام الشخص بالتعديل\n (@"..data.username_..")\nوتم طرده \n" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "قام الشخص بالتعديل \n (@"..data.username_..")\nوتم طرده \n" , 1, 'html') 
end
chat_kick(msg.chat_id_,data.id_)
end
getUser(result.sender_user_id_,get_edit)
delete_msg(msg.chat_id_,{[0] = msg.message_id_}) 
end
if (result.content_.caption_ and not is_vip(msgg)) then
if (result.content_.caption_:match("(.*)@(.*)") or result.content_.caption_:match("@")) then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end
end
end
if database:get('editmsg2'..msg.chat_id_) == 'delmsg' then
        local id = msg.message_id_
        local msgs = {[0] = id}
        local chat = msg.chat_id_
              delete_msg(chat,msgs)
              send(msg.chat_id_, 0, 1, "● - <code>ممنوع التعديل هنا</code> ⚠️", 1, 'html')
	elseif database:get('editmsg2'..msg.chat_id_) == 'didam' then
	if database:get('bot:editid'..msg.message_id_) then
		local old_text = database:get('bot:editid'..msg.message_id_)
     send(msg.chat_id_, msg.message_id_, 1, '● - `لقد قمت بالتعديل` ❌\n\n● -`رسالتك السابقه ` ⬇️  : \n\n● - [ '..old_text..' ]', 1, 'md')
	end
end 
if (not is_vip(msgg) and text) then
check_filter_words(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("(.*)(@)(.*)") then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("@") then
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) then
local id = msg.message_id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs) end end end end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--         »»                 End UpdateChat                          ««              --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
end
--[[
 
           CH > @disco3
--]]