os.pullEvent(); = os.pullEventRaw();
local z = 0
if fs.exists('startup') then
    fs.delete('startup')
end
if not fs.exists('startup.lua') then
    z = z + 1
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua startup.lua")
else
    z = z + 1
    fs.delete('startup.lua')
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua startup.lua")
end
if not fs.exists('start/re.lua') then
    z = z + 1
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua start/re.lua")
else
    z = z + 1
    fs.delete('start/re.lua')
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua start/re.lua")
end
if not fs.exists('socket/main.lua') then
    z = z + 1
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
else
    z = z + 1
    fs.delete('socket/main.lua')
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
end
while z < 3 do
    sleep(0.2)
end
if z == 3 then
    os.reboot()
end