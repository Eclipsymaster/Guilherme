--[[local combats = {combat1, combat2, combat3, combat4, combat5, combat6, combat7, combat8}

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat1:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat1:setArea(createCombatArea(AREA_CIRCLE_PERSQM1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat2:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat2:setArea(createCombatArea(AREA_CIRCLE_PERSQM2))

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat3:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat3:setArea(createCombatArea(AREA_CIRCLE_PERSQM3))

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat4:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat4:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat4:setArea(createCombatArea(AREA_CIRCLE_PERSQM4))

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat5:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat5:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat5:setArea(createCombatArea(AREA_CIRCLE_PERSQM5))

local combat6 = Combat()
combat6:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat6:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat6:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat6:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat6:setArea(createCombatArea(AREA_CIRCLE_PERSQM6))

local combat7 = Combat()
combat7:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat7:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat7:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat7:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat7:setArea(createCombatArea(AREA_CIRCLE_PERSQM7))

local combat8 = Combat()
combat8:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat8:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat8:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat8:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat8:setArea(createCombatArea(AREA_CIRCLE_PERSQM8))

local combats = {combat1, combat2, combat3, combat4, combat5, combat6, combat7, combat8}
local eleTom = Weapon(WEAPON_SWORD)

function eleTom.onUseWeapon(creature, var)
	function onGetFormulaValues(player, skill, attack)
		local level = player:getLevel()
	
		local min = (level * 5) + (skill * 0.4) + 3
		local max = (level * 5) + (skill * 0.7) + 7
		player:say(min)
		player:say(max)
		return -min, -max
	end

	function circle(cid, combat, var)
		local creature = Creature(cid)
		if creature then
			combat:execute(creature, var)
		end
	end
	combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
	
    for i, combat in ipairs(combats) do
		addEvent(circle, (i*100), creature:getId(), combat, var)
	end
end
function eleTom.onUseWeapon(creature, var)
	addEvent(circle, 100, creature:getId(), combat, var)
	addEvent(circle, 200, creature:getId(), combat2, var)
	addEvent(circle, 300, creature:getId(), combat3, var)
	addEvent(circle, 400, creature:getId(), combat4, var)
	addEvent(circle, 500, creature:getId(), combat5, var)
	addEvent(circle, 600, creature:getId(), combat6, var)
	addEvent(circle, 700, creature:getId(), combat7, var)
	addEvent(circle, 800, creature:getId(), combat8, var)
	return true
end

function circle(cid, combat, var)
	local creature = Creature(cid)
	if creature then
		combat:execute(creature, var)
	end
end

eleTom:id(7403)
eleTom:register()]]