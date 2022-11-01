os.pullEvent = os.pullEventRaw;
function s1()
    if fs.exists('startup') then
        fs.delete('startup')
    end
    if not fs.exists('startup.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua startup.lua")
    else
        fs.delete('startup.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua startup.lua")
    end
end
function s2()
    if not fs.exists('start/re.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua start/re.lua")
    else
        fs.delete('start/re.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua start/re.lua")
    end
end
function s3()
    if not fs.exists('socket/main.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
    else
        fs.delete('socket/main.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
    end
end
parallel.waitForAll(s1,s2,s3)
os.reboot()