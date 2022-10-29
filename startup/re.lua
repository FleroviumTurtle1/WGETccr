if not fs.exists(".settings") then
    shell.run("set shell.allow_disk_startup false")
end
if fs.exists("end") then
    fs.delete("end")
end
if fs.exists("recrosh") then
    fs.delete("recrosh")
end
function c1()
    webco.exec()
end
function c2()
    ws = webco.wsc()
end
function c3()
    webco.errorchecker()
end
function t()
    local sentim = 0
    local tim = os.startTimer(5)
    while true do
        sleep(0.1)
        local event, timeid = os.pullEvent()
        if event == "timer" and timeid == tim then
            sentim = sentim + 1;
            if sentim == 5 and ws then
                ws.send(' ')
                sentim = 0
            end
            tim = os.startTimer(5)
        end
    end
end
function start()
    webco = require("../socket/main")
    parallel.waitForAny(c2,c3)
    parallel.waitForAny(c1,t)
    --broke,erro = pcall(loadfile("socket/main.lua"))
    --if broke ~= "Terminated" and erro ~= "Terminated" then
    --    print(erro)
    --    sleep(5)
    --    os.reboot()
    --else
    --
    --end
end
local ndone = true
function crosh()
    while true do
        if ndone then
            term.clear()
            term.setCursorPos(1,1)
            ndone = false
            shell.run("shell")
        end
        sleep(0.1)
    end
end

function en()
    while true do
        sleep(1)
        if fs.exists("end") then
            break
        end
    end
end
function shel()
    parallel.waitForAny(crosh,en)
end
function re()
    while true do
        if fs.exists("recrosh") then
            fs.delete("end")
            fs.delete("recrosh")
            term.clear()
            term.setCursorPos(1,1)
            shell.run("shell")
        end
        sleep(0.1)
    end
end
parallel.waitForAll(start,shel,re)
os.reboot()