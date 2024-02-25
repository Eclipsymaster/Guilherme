local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SUBID, AttrSubId_JeanPierreMelee)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_SUBID, AttrSubId_JeanPierreMagic)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SUBID, AttrSubId_JeanPierreDistance)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local setting = {
	[236] = {
		health = { 250, 350 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_PALADINO,
			VOCATION.BASE_ID.HUMANO_VERETANO,
			VOCATION.BASE_ID.ORC_BARBARO,
			VOCATION.BASE_ID.ORC_LANCEIRO,
			VOCATION.BASE_ID.ORC_COMANDANTE,
			VOCATION.BASE_ID.ELF_SUMONADOR,
			VOCATION.BASE_ID.ELF_ASSASSINO,
			VOCATION.BASE_ID.ELF_ARQUEIRO,
			VOCATION.BASE_ID.MORTOVIVO_VAMPIRO,
			VOCATION.BASE_ID.MORTOVIVO_MUMIA,
			VOCATION.BASE_ID.MORTOVIVO_CEIFADOR,
			VOCATION.BASE_ID.ANAO_MINEIRO,
			VOCATION.BASE_ID.ANAO_BESTEIRO,
		},
		level = 50,
		flask = 283,
		description = "Somente melees e rangeds com level maior que 50 podem usar.",
	},
	[237] = {
		mana = { 115, 185 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_CLERIGO,
			VOCATION.BASE_ID.HUMANO_MAGO,
			VOCATION.BASE_ID.ORC_SHAMAN,
			VOCATION.BASE_ID.ELF_ESCURIDAO,
			VOCATION.BASE_ID.ELF_SUMONADOR,
			VOCATION.BASE_ID.MORTOVIVO_BANSHEE,
			VOCATION.BASE_ID.ANAO_ALQUIMISTA,
			VOCATION.BASE_ID.ANAO_CRONOMANCER,
		},
		level = 50,
		flask = 283,
		description = "Somente magicos com level maior que 50 podem usar.",
	},
	[238] = {
		mana = { 150, 250, },
		vocations = {
				VOCATION.BASE_ID.HUMANO_CLERIGO,
				VOCATION.BASE_ID.HUMANO_MAGO,
				VOCATION.BASE_ID.ORC_SHAMAN,
				VOCATION.BASE_ID.ELF_ESCURIDAO,
				VOCATION.BASE_ID.ELF_SUMONADOR,
				VOCATION.BASE_ID.MORTOVIVO_BANSHEE,
				VOCATION.BASE_ID.ANAO_ALQUIMISTA,
				VOCATION.BASE_ID.ANAO_CRONOMANCER,
		},
		level = 80,
		flask = 284,
		description = "Somente magicos com level maior que 50 podem usar.",
	},
	[239] = {
		health = { 425, 575 },
		vocations = {
				VOCATION.BASE_ID.HUMANO_PALADINO,
				VOCATION.BASE_ID.ORC_BARBARO,
				VOCATION.BASE_ID.ORC_COMANDANTE,
				VOCATION.BASE_ID.MORTOVIVO_VAMPIRO,
				VOCATION.BASE_ID.MORTOVIVO_MUMIA,
				VOCATION.BASE_ID.MORTOVIVO_CEIFADOR,
				VOCATION.BASE_ID.ANAO_MINEIRO,
		},
		level = 80,
		flask = 284,
		description = "Somente melees com level maior que 80 podem usar.",
	},
	[266] = {
		health = { 125, 175 },
		flask = 285,
	},
	[268] = {
		mana = { 75, 125 },
		flask = 285,
	},
	[6558] = {
		transform = {
			id = { 236, 237 },
		},
		effect = CONST_ME_DRAWBLOOD,
	},
	[7439] = {
		condition = berserk,
		vocations = {
			VOCATION.BASE_ID.HUMANO_VERETANO,
		},
		effect = CONST_ME_MAGIC_RED,
		description = "Only knights may drink this potion.",
		text = "You feel stronger.",
	},
	[7440] = {
		condition = mastermind,
		vocations = {
			VOCATION.BASE_ID.HUMANO_CLERIGO,
			VOCATION.BASE_ID.HUMANO_PALADINO,
		},
		effect = CONST_ME_MAGIC_BLUE,
		description = "Only sorcerers and druids may drink this potion.",
		text = "You feel smarter.",
	},
	[7443] = {
		condition = bullseye,
		vocations = {
			VOCATION.BASE_ID.HUMANO_MAGO,
		},
		effect = CONST_ME_MAGIC_GREEN,
		description = "Only paladins may drink this potion.",
		text = "You feel more accurate.",
	},
	[7642] = {
		health = { 250, 350 },
		mana = { 100, 200 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_MAGO,
		},
		level = 80,
		flask = 284,
		description = "Only paladins of level 80 or above may drink this fluid.",
	},
	[7643] = {
		health = { 650, 850 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_PALADINO,
			VOCATION.BASE_ID.ORC_BARBARO,
			VOCATION.BASE_ID.ORC_COMANDANTE,
			VOCATION.BASE_ID.ELF_SUMONADOR,
			VOCATION.BASE_ID.MORTOVIVO_VAMPIRO,
			VOCATION.BASE_ID.MORTOVIVO_MUMIA,
			VOCATION.BASE_ID.MORTOVIVO_CEIFADOR,
			VOCATION.BASE_ID.ANAO_MINEIRO,
		},
		level = 130,
		flask = 284,
		description = "Somente melees com level maior que 130 podem usar.",
	},
	[7644] = {
		antidote = true,
		flask = 285,
	},
	[7876] = {
		health = { 60, 90 },
		flask = 285,
	},
	[23373] = {
		mana = { 425, 575 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_CLERIGO,
			VOCATION.BASE_ID.HUMANO_MAGO,
			VOCATION.BASE_ID.ORC_SHAMAN,
			VOCATION.BASE_ID.ELF_ESCURIDAO,
			VOCATION.BASE_ID.MORTOVIVO_BANSHEE,
			VOCATION.BASE_ID.ANAO_ALQUIMISTA,
			VOCATION.BASE_ID.ANAO_CRONOMANCER,
		},
		level = 130,
		flask = 284,
		description = "Somente magicos com level maior que 130 podem usar.",
	},
	[23374] = {
		health = { 420, 580 },
		mana = { 250, 350 },
		vocations = {
			VOCATION.BASE_ID.HUMANO_VERETANO,
			VOCATION.BASE_ID.ORC_LANCEIRO,
			VOCATION.BASE_ID.ELF_ASSASSINO,
			VOCATION.BASE_ID.ELF_ARQUEIRO,
			VOCATION.BASE_ID.ANAO_BESTEIRO,
		},
		level = 130,
		flask = 284,
		description = "Somente rangeds com level maior que 130 podem usar.",
	},
	[23375] = {
		health = { 875, 1125 },
		vocations = { 
			VOCATION.BASE_ID.HUMANO_PALADINO,
			VOCATION.BASE_ID.ORC_BARBARO,
			VOCATION.BASE_ID.ORC_COMANDANTE,
			VOCATION.BASE_ID.MORTOVIVO_VAMPIRO,
			VOCATION.BASE_ID.MORTOVIVO_MUMIA,
			VOCATION.BASE_ID.MORTOVIVO_CEIFADOR,
			VOCATION.BASE_ID.ANAO_MINEIRO,
		},
		level = 200,
		flask = 284,
		description = "Somente melees com level maior que 200 podem usar.",
	},
}

local potions = Action()

function potions.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = setting[item:getId()]
	if potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getBaseId()) then
		player:say(potion.description, TALKTYPE_MONSTER_SAY)
		return true
	end

	if potion.condition then
		player:addCondition(potion.condition)
		player:say(potion.text, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(potion.effect)
	elseif potion.transform then
		item:transform(potion.transform[math.random(#potion.transform)])
		item:getPosition():sendMagicEffect(potion.effect)
		return true
	else
		if potion.health then
			doTargetCombatHealth(player, target, COMBAT_HEALING, potion.health[1], potion.health[2])
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2])
		end

		if potion.antidote then
			target:removeCondition(CONDITION_POISON)
		end

		player:addItem(potion.flask)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end

	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ITEM_USE_POTION, player:isInGhostMode() and nil or player)

	if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
		return true
	end

	player:updateSupplyTracker(item)
	item:remove(1)
	return true
end

for index, value in pairs(setting) do
	potions:id(index)
end

potions:register()
