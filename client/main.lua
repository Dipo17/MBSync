local keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["U"] = 303, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["LCONTROL"] = 36
}

local markers = {}

---@param msg string
function TextUI(msg)
    SetTextComponentFormat('STRING') 
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("mbsync.addMarker", function(data)

    local textureDict 

    if(data.useTexture) then
        textureDict = lib.requestStreamedTextureDict(shared.textureDict)
    end

    local marker = lib.points.new({
        name             = data.name or "marker#"..#markers, -- Table index to have it identified in the table when you execute the event "mbsync.removeMarker"
        coords           = data.coords, -- Marker position
        rotation         = data.rotation or vec3(0.0,0.0,0.0), -- Rotation of the marker
        rotate           = data.rotate or false, -- Rotate marker animation
        scale            = data.scale or vec3(0.8,0.8,0.8), -- Scale of the marker
        rgba             = data.rgba or { r = 255, g = 255, b = 255, a = 255 }, -- R: Red, G = Green, B = Blue, A = Alpha
        rebound          = data.rebound or false, -- Rebound marker animation
        facecamera       = data.facecamera or false, -- Rotate marker by the player cam
        textureDict      = textureDict, -- Texture dict
        textureName      = data.textureName, -- Texture name (in the texture dictionary)
        distance         = data.drawDistance or 4.0, -- Draw Marker Distance
        interactDistance = data.interactDistance or 2, -- Marker interact distance
        type             = data.type, -- Type of the marker https://docs.fivem.net/docs/game-references/markers/
        key              = data.key or "E", -- Key to interact with the marker
        message          = data.message, -- Message on the TextUI
        onPress          = data.onPress, -- This function will be executed when the user press the key
        onEnter          = data.onEnter, -- This function will be executed when the user enters the radius of the marker range (drawDistance)
        onExit           = data.onExit -- This function will be executed when the user goes out of the marker range
    })

    function marker:nearby()
        DrawMarker(self.type, self.coords.x,self.coords.y,self.coords.z,0.0,0.0,0.0,self.rotation.x,self.rotation.y,self.rotation.z,self.scale.x,self.scale.y,self.scale.z,self.rgba.r,self.rgba.g,self.rgba.b,self.rgba.a,self.rebound,self.facecamera,2,self.rotate,self.textureDict,self.textureName,false)
        
        local distance = #(GetEntityCoords(cache.ped) - self.coords)

        if(distance <= self.interactDistance) then
            TextUI(self.message)
            if(IsControlJustPressed(0, keys[self.key])) then
                marker:onPress()
            end
        end
    end

    markers[marker.name] = marker
end)

RegisterNetEvent("mbsync.removeMarker", function(index)
    if(markers[index]) then
        markers[index]:remove()
        markers[index] = nil
    end
end)