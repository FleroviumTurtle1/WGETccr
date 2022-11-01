local h = 0
os.pullEvent = os.pullEventRaw;
if fs.exists("socket/main.lua") then
    tester = fs.open("socket/main.lua","r")
    tex = tester.readAll()
    tester.close()
    if fs.exists("blank.txt") then
        fs.delete("blank.txt")
    end
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua blank.txt")
    teste = fs.open("blank.txt","r")
    te = teste.readAll()
    teste.close()
    if tex ~= te then
        h = 1
        fs.delete("socket/main.lua")
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/socket/main.lua socket/main.lua")
    end
end
if fs.exists('start/re.lua') then
    tester = fs.open("start/re.lua","r")
    tex = tester.readAll()
    tester.close()
    if fs.exists("blank.txt") then
        fs.delete("blank.txt")
    end
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua blank.txt")
    teste = fs.open("blank.txt","r")
    te = teste.readAll()
    teste.close()
    if tex ~= te then
        h = 1
        fs.delete("start/re.lua")
        shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/start/re.lua start/re.lua")
    end
end
tester = fs.open("startup.lua","r")
tex = tester.readAll()
tester.close()
if fs.exists("blank.txt") then
    fs.delete("blank.txt")
end
shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua blank.txt")
teste = fs.open("blank.txt","r")
te = teste.readAll()
teste.close()
if tex ~= te then
    h = 1
    fs.delete("startup.lua")
    shell.run("wget https://raw.githubusercontent.com/JaggedZirconium/WGETccr/main/startup.lua startup.lua")
end
if h == 1 then
    os.reboot()
else
    e,t = pcall(loadfile('start/re.lua'))
end