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

CeaserCipherIndex = {
    ["A"] = 0,
    ["B"] = 1,
    ["C"] = 2,
    ["D"] = 3,
    ["E"] = 4,
    ["F"] = 5,
    ["G"] = 6,
    ["H"] = 7,
    ["I"] = 8,
    ["J"] = 9,
    ["K"] = 10,
    ["L"] = 11,
    ["M"] = 12,
    ["N"] = 13,
    ["O"] = 14,
    ["P"] = 15,
    ["Q"] = 16,
    ["R"] = 17,
    ["S"] = 18,
    ["T"] = 19,
    ["U"] = 20,
    ["V"] = 21,
    ["W"] = 22,
    ["X"] = 23,
    ["Y"] = 24,
    ["Z"] = 25
}

function GetShift(Text,Shift)
    local Negative = 1
    if Shift < 24 then 
        Negative = -1
    end 
    local Converted = {}
    local BT = ""
    for ArbiVal, letter in pairs(Text) do
       local StartVal = CeaserCipherIndex[letter] 
        if StartVal then
            local NewVal = (math.abs(StartVal+Shift*Negative))%26

          for Key, Val in pairs(CeaserCipherIndex) do
               if NewVal == Val then
                    NewVal = Key
                 end
             end
          Converted[ArbiVal] = NewVal
          else
            Converted[ArbiVal] = letter
        end
    end
    for d,letter in pairs(Converted) do
        BT = BT .. letter
     end 

     return BT
end


function CeaserCipherCracker(Text,BruteForce,Shift)
    local NewText = {}
    for i = 1, #Text do
        NewText[i] =string.sub(Text,i,i)
    end
    Shifts = {}
    if BruteForce == true then
        local StartShift = -25
        for i = 1,48 do --48 instead of 50 cause -25 and 25 would give same result and 0 does nothing
            if i ~= -25 or i ~= 0 then 
                print(i)
                local BT = GetShift(NewText,i)
                if BT then
                    Shifts[i] = BT
                end
            end
        end
        return Shifts
    else
        local BT = GetShift(NewText,Shift)
        if BT then 
            Shifts[0] = BT
            return Shifts
        end
    end
    return "Failed"
end
