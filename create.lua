os.pullEvent = os.pullEventRaw;
if fs.exists('startup/re.lua') then
    fs.delete('startup/re.lua')
end
shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup/re.lua startup/re.lua")
if fs.exists('socket/main.lua') then
    fs.delete('socket/main.lua')
end
shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
os.reboot()