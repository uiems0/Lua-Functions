function GetRotation(PivotPointX,PivotPointY,PointX,PointY,Degrees)

    if not PointX or type(PointX) ~= "number" or not PointY or type(PointY) ~= "number" or not Degrees or type(Degrees) ~= "number" then
        print("One of your variables are not valid!",PointX,PointY,Degrees)
    end

    Degrees = math.rad(Degrees)

    if type(PivotPointX) ~= "number" then
       PivotPointX = 0
    end

    if type(PivotPointY) ~= "number" then
        PivotPointY = 0
    end

    local NewXCord = (PointX - PivotPointX)*math.cos(Degrees)-(PointY-PivotPointY)*math.sin(Degrees)+PivotPointX
    local NewYCord =  (PointX - PivotPointX)*math.sin(Degrees)+(PointY-PivotPointY)*math.cos(Degrees)+PivotPointY

    print("(" .. NewXCord .. "," .. NewYCord .. ")")

    return NewXCord,NewXCord
end


CeaserCipherIndex = { --Will finish this later, I have stuff to do though
    ["A"] = 1,
    ["B"] = 2,
    ["C"] = 3,
    ["D"] = 4,
    ["E"] = 5,
}


function CeaserCipherCracker(Text,BruteForce,Shift)
    if BruteForce == true then
        local StartShift = -26
        Shifts = {}
        while StartShift < 27 do
            
        end
    end
end
