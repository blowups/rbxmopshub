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
--[[
Returns a table with this dadaaaaa:

Sound: string
Setup: function
Shotgun: boolean
Pistol: boolean
AimFOV: number
Ammo: number
AimDistance: number
Weight: number
Damage: number
Last: number
Heat: number
TBB: number
CurrentAmmo: number
ReloadAnimTime: number
Count: number
ReloadAnim: number
Reload: number
Clip: number
MuzzleVelocity: number
TBS: number                (if u set this to 0 u have rapidfire -o-)

]]
