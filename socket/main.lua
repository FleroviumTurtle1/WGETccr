local ws,err,red = nil
local sentim = 0
local errcheck = false
local st = true
local pas
local sent = 0
local module = {}
local corX
local corY
local corZ
local corFace
local cordin
function rea()
    cords = fs.open("cords.txt","r")
    corX = cords.readLine()
    corY = cords.readLine()
    corZ = cords.readLine()
    corFace = cords.readLine()
    cords.close()
end
function turnL()
    rea()
    if corFace == "n" then
        rea()
        corFace = "w"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "e" then
        rea()
        corFace = "n"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "s" then
        rea()
        corFace = "e"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "w" then
        rea()
        corFace = "s"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    end
end
function turnR()
    rea()
    if corFace == "n" then
        rea()
        corFace = "e"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "e" then
        rea()
        corFace = "s"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "s" then
        rea()
        corFace = "w"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    elseif corFace == "w" then
        rea()
        corFace = "n"
        cords = fs.open("cords.txt","w")
        cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
        cords.close()
        ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
    end
end
function module.exec()
    local oldPull = os.pullEvent;
    os.pullEvent = os.pullEventRaw;
    sleep(0.1)
    repeat
        sleep(0.1)
    until errcheck == false and ws
    while true do
        sleep(0.1)
        rea()
        if ws and not errcheck then
            if not os.getComputerLabel() then
                ws.send("CompLabelRequest"..os.getComputerID());
            end
            sleep(0.1)
            if os.getComputerLabel() and sent == 0 then
                rea()
                cordin = corX..","..corY..","..corZ..","..corFace
                ws.send("Comuts "..os.getComputerID().." "..os.getComputerLabel().." "..cordin)
                sent = 1
            end
            rec = ws.receive()
            srec = string.sub(rec,string.len(tostring(os.getComputerID()))+1)
            if os.getComputerLabel() then
                tempnum = tonumber(string.len(os.getComputerLabel()))
                tempstringi = tostring(string.sub(rec,0,tempnum))
                if tostring(tempstringi) == tostring(os.getComputerLabel()) then
                    pas = 1
                    srec = string.sub(rec,tempnum+1)
                elseif tonumber(string.sub(rec,0,string.len(tostring(os.getComputerID())))) == os.getComputerID() then
                    pas = 2
                else
                    pas = 0
                end
            else
                if tonumber(string.sub(rec,0,string.len(tostring(os.getComputerID())))) == os.getComputerID() then
                    pas = 2
                else
                    pas = 0
                end
            end
            if pas == 1 or pas == 2 then
                if string.sub(srec,0,5) == "label" then
                    os.setComputerLabel(string.sub(srec,6))
                    cordin = corX..","..corY..","..corZ..","..corFace
                    ws.send("Comuts "..os.getComputerID().." "..os.getComputerLabel().." "..cordin)
                    sent = 1
                elseif turtle then
                    if srec == "left" then
                        turnL()
                        turtle.turnLeft()
                    elseif srec == "right" then
                        turnR()
                        turtle.turnRight()
                    elseif srec == "back" then
                        if turtle.getFuelLevel() > 0 then
                            turtle.back()
                            rea()
                            cords = fs.open("cords.txt","w")
                            if corFace == "n" then
                                corZ = tostring(tonumber(corZ)-1)
                            elseif corFace == "e" then
                                corX = tostring(tonumber(corX)+1)
                            elseif corFace == "s" then
                                corZ = tostring(tonumber(corZ)+1)
                            elseif corFace == "w" then
                                corX = tostring(tonumber(corX)-1)
                            end
                            cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
                            cords.close()
                            ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
                        else
                            ws.send("webNo fuel left!")
                        end
                    elseif srec == "for" then
                        if turtle.getFuelLevel() > 0 then
                            turtle.forward()
                            rea()
                            cords = fs.open("cords.txt","w")
                            if corFace == "n" then
                                corZ = tostring(tonumber(corZ)+1)
                            elseif corFace == "e" then
                                corX = tostring(tonumber(corX)-1)
                            elseif corFace == "s" then
                                corZ = tostring(tonumber(corZ)-1)
                            elseif corFace == "w" then
                                corX = tostring(tonumber(corX)+1)
                            end
                            cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
                            cords.close()
                            ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
                        else
                            ws.send("webNo fuel left!")
                        end
                    elseif srec == "insp" then
                        x,i = turtle.inspect()
                        if x then
                            ws.send("web"..i.name)
                        else
                            ws.send("webminecraft:air")
                        end
                    elseif srec == "inspdown" then
                        x,i = turtle.inspectDown()
                        if x then
                            ws.send("web"..i.name)
                        else
                            ws.send("webminecraft:air")
                        end
                    elseif srec == "inspup" then
                        x,i = turtle.inspectUp()
                        if x then
                            ws.send("web"..i.name)
                        else
                            ws.send("webminecraft:air")
                        end
                    elseif srec == "getfuel" then
                        ws.send("web"..turtle.getFuelLevel())
                    elseif srec == "up" then
                        if turtle.getFuelLevel() > 0 then
                            turtle.up()
                            rea()
                            cords = fs.open("cords.txt","w")
                            corY = tostring(tonumber(corY)+1)
                            cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
                            cords.close()
                            ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
                        else
                            ws.send("webNo fuel left!")
                        end
                    elseif srec == "down" then
                        if turtle.getFuelLevel() > 0 then
                            turtle.down()
                            rea()
                            cords = fs.open("cords.txt","w")
                            corY = tostring(tonumber(corY)-1)
                            cords.write(corX.."\n"..corY.."\n"..corZ.."\n"..corFace)
                            cords.close()
                            ws.send("wcor|"..corX.."|"..corY.."|"..corZ.."|"..corFace.."|"..os.getComputerLabel())
                        else
                            ws.send("webNo fuel left!")
                        end
                    end
                elseif not turtle then
                    ws.send("web".."This is not a turtle, cannot reply.");
                end
            end
        end
    end
end
function module.wsc()
    os.pullEvent = os.pullEventRaw;
    if fs.exists("socket/url.txt") then
        errcheck = true
        sleep(0.1)
        term.clear()
        term.write("Connecting")
        fil = fs.open("socket/url.txt","r")
        local redl = fil.readLine()
        if redl then ws,err = http.websocket("ws://"..redl) end
        errcheck = false
        sleep(0.1)
        fil.close()
        if not ws then
            term.clear()
            term.setCursorPos(1,1)
            print("Input new url:")
            fs.makeDir("end")
            red = read()
            if red == "admin" then
                print(intentional.error)
            elseif red ~= "" and red ~= "r" and red ~= "y" and red ~= "reboot" then
                fil = fs.open("socket/url.txt","w")
                fil.write(red)
                fil.close()
            end
            os.reboot()
        end
    else
        term.clear()
        term.setCursorPos(1,1)
        print("Url not saved, input:")
        red = read()
        if red == "admin" then
            print(intentional.error)
        elseif red ~= "" and red ~= "r" and red ~= "y" and red ~= "reboot" then
            fil = fs.open("socket/url.txt","w")
            fil.write(red)
            fil.close()
        end
        os.reboot()
    end
    while true do
        if not ws or err then
            print(err)
            break
        end
        if ws and st then
            fs.makeDir("end")
            sleep(1)
            fs.makeDir("recrosh")
            term.clear()
            term.setCursorPos(1,1)
            print("Connected.")
            st = false
            return ws
        end
        sleep(0.1)
    end
end
function module.errorchecker()
    local tim = os.startTimer(5)
    os.pullEvent = os.pullEventRaw;
    while true do
        local event, timeid = os.pullEvent()
        if event == "timer" and timeid == tim then
            if errcheck then
                term.clear()
                term.setCursorPos(1,1)
                print("Minimum of 4 seconds without response reached.")
                print("r to change url, y to reboot and n to end program.")
                fs.makeDir("end")
                local h = read()
                if h == "y" then
                    os.reboot()
                elseif h == "r" then
                    term.clear()
                    term.setCursorPos(1,1)
                    print("Url:")
                    fi = fs.open("socket/url.txt","w")
                    local l = read()
                    fi.write(l)
                    fi.close()
                    os.reboot()
                elseif h == "n" then
                    print(intentional.error)
                else
                    os.reboot()
                end
            end
        end
    end
end
return module