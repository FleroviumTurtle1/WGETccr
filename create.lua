os.pullEvent = os.pullEventRaw;
re = 0
if fs.exists('startup.lua') then
    fs.delete('startup.lua')
end
function s2()
    if not fs.exists('startup/re.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup/re.lua startup/re.lua")
    else
        fs.delete('startup/re.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup/re.lua startup/re.lua")
    end
    re = re + 1
end
function s3()
    if not fs.exists('socket/main.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
    else
        fs.delete('socket/main.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
    end
    re = re + 1
end
function s4()
    while not re == 2 do
        coroutine.yield()
    end
    os.reboot()
end
parallel.waitForAll(s2,s3)