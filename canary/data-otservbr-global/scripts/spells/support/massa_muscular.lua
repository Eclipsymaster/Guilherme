local config = {
	addSkill = 2,
	stackMaxSkill = 50,
	cooldownCondition = 4, -- 4 = 4 seconds
	cooldownStorage = 310000,
	skillStorage = 310001
}

local spell = Spell("instant")

spell.onCastSpell = function(player, variant)
	local item = player:getSlotItem(CONST_SLOT_LEFT)

	if item == nil then
		return false
	end

	local typeWeapon = item:getType():getWeaponType()
	local paramWeapon = 0
	local paramSound = 0

	if typeWeapon == 1 then
		paramWeapon = CONDITION_PARAM_SKILL_FIST
		paramSound = SOUND_EFFECT_TYPE_HUMAN_CLOSE_ATK_FIST
	elseif typeWeapon == 2 then
		paramWeapon = CONDITION_PARAM_SKILL_SWORD
		paramSound = SOUND_EFFECT_TYPE_MELEE_ATK_SWORD
	elseif typeWeapon == 3 then 
		paramWeapon = CONDITION_PARAM_SKILL_CLUB
		paramSound = SOUND_EFFECT_TYPE_MELEE_ATK_CLUB
	elseif typeWeapon == 4 then 
		paramWeapon = CONDITION_PARAM_SKILL_AXE
		paramSound = SOUND_EFFECT_TYPE_MELEE_ATK_AXE
	else
		return false
	end

	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(COMBAT_PARAM_IMPACTSOUND, paramSound)
	condition:setParameter(CONDITION_PARAM_TICKS, 1000 * config.cooldownCondition)
	condition:setParameter(paramWeapon, player:getStorageValue(config.skillStorage))

	if player:getStorageValue(config.cooldownStorage) - os.time() > 0 then
		player:addCondition(condition)
		if player:getStorageValue(config.skillStorage) >= config.stackMaxSkill then
			player:setStorageValue(config.skillStorage, (player:getStorageValue(config.skillStorage)))
		else 
			player:setStorageValue(config.skillStorage, (player:getStorageValue(config.skillStorage) + 2))
		end
		player:setStorageValue(config.cooldownStorage, os.time() + config.cooldownCondition)
		return true
	else
		player:setStorageValue(config.skillStorage, 2)
		player:setStorageValue(config.cooldownStorage, os.time() + config.cooldownCondition)
	end
end

spell:group("focus")
spell:id(906)
spell:name("Massa muscular")
spell:words("massa muscular")
spell:range(1)
spell:level(37)
spell:mana(61)
spell:isPremium(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needTarget(true)
spell:needLearn(false)
spell:vocation("Paladino;true", "Barbaro;true", "Ceifador;true", "Mineiro;true")
spell:register()