os.pullEvent = os.pullEventRaw;
function s2()
    if not fs.exists('startup/re.lua') then
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup/re.lua startup/re.lua")
    else
        fs.delete('startup/re.lua')
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup/re.lua startup/re.lua")
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
parallel.waitForAll(s2,s3)
os.reboot()