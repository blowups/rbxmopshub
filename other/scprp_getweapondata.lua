--[[
This gets the current Weapon Data of the guns in your inventory
you must have your gun equiped atleast once to get data


Im trying to make an Infinite Ammo but, yeah idk, game very weird xd
]]

local g = getgc(true)
local t = {}

--get weapons
for _, v in pairs(g) do
    if typeof(v) == "table" then
        if rawget(v, "Ammo") and rawget(v, "CurrentAmmo") then
            table.insert(t,v)
        end
    end
end

--print the weapon data in console
for _,v in pairs(t) do
    print(_,v)
end
