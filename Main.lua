
--**RotationFinder**--

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

--**CeaserCipherMaker/Cracker**--

UCCCI = {--Upper case
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
    ["Z"] = 25,
}
LCCCI = {--Lower case
    ["a"] = 0,
    ["b"] = 1,
    ["c"] = 2,
    ["d"] = 3,
    ["e"] = 4,
    ["f"] = 5,
    ["g"] = 6,
    ["h"] = 7,
    ["i"] = 8,
    ["j"] = 9,
    ["k"] = 10,
    ["l"] = 11,
    ["m"] = 12,
    ["n"] = 13,
    ["o"] = 14,
    ["p"] = 15,
    ["q"] = 16,
    ["r"] = 17,
    ["s"] = 18,
    ["t"] = 19,
    ["u"] = 20,
    ["v"] = 21,
    ["w"] = 22,
    ["x"] = 23,
    ["y"] = 24,
    ["z"] = 25
}


function GetShift(Text,Shift)
    local Converted = {}
    local BT = ""
    for ArbiVal, letter in pairs(Text) do
       local StartVal = UCCCI[letter] 
       local IsLowerCase = false
       if not StartVal then
        StartVal = LCCCI[letter]
        IsLowerCase = true
       end

        if StartVal then
            local NewVal = (StartVal+Shift)%26
            local SelTab
            if IsLowerCase == false then
                SelTab = UCCCI
            else
                SelTab = LCCCI
            end
          for Key, Val in pairs(SelTab) do
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


function CeaserCipher(Text,BruteForce,Shift)
    local NewText = {}
    for i = 1, #Text do
        NewText[i] =string.sub(Text,i,i)
    end
    Shifts = {}
    if BruteForce == true then
        for i = 1,26 do 
            print(i)
            local BT = GetShift(NewText,i)
            if BT then
                  Shifts[i] = BT
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


local Tab = CeaserCipher("dBo",true)

for Index,ShiftedText in pairs(Tab) do
    print("Index =", Index, "Text =",ShiftedText)
end

--[[Use example, returns cAn. Also you can do something like local Arr = CeaserCipher("CAN",false,1) if you want to make one yourself.

local Tab = CeaserCipher("dBo",true)

for Index,ShiftedText in pairs(Tab) do
    print("Index =", Index, "Text =",ShiftedText)
end]]

--**StopWatch**--

local StartTime

function StopWatch()
    if StartTime == nil then
        StartTime = os.clock()
    else
        local ST = StartTime
        StartTime = nil
        return (os.clock() - ST) * 1000
    end
end


local Nouns = {
    "bananas ",
    "rocks ",
    "words ",
    "tapes ",
    "pillows " 
}

local Verbs = {
    "running ",
    "jumping ",
    "typing ",
    "watching ",
    "learning "
}

local Adjectives = {
    "bad ",
    "great ",
    "decent "
}


function WriteRandomSentance()
    local Run = math.random(1,3)
    if Run == 1 then
        return "There is " .. math.random(0,100) .. " " .. Nouns[math.random(1,#Nouns)]
    elseif Run == 2 then
        return "While " .. Verbs[math.random(1,#Verbs)] .. ", they " .. Verbs[math.random(1,#Verbs)]
    elseif Run == 3 then
        return "You are " .. Adjectives[math.random(1,#Adjectives)]
    end
end


function MeetsCriteria(Text)--Could add more stuff to this.
    local NewText = {}
    for i = 1, #Text do
        NewText[i] =string.sub(Text,i,i)
    end
    if NewText[1] ~= "F"  then
        return false
    end

    if NewText[2] == "U" or NewText[2] == "K" then
        if NewText[3] == "4" or NewText[3] == "D" then
            return true
            else return false
        end
    else return false
    end
end
