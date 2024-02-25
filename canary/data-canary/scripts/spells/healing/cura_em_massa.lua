local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 0.2 + magicLevel * 10) + 3
	local max = (level * 0.2 + magicLevel * 14) + 5
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("Cura em area")
spell:words("cura em massa")
spell:group("healing")
spell:vocation("Clerigo;true")
spell:id(901)
spell:cooldown(2 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(36)
spell:mana(150)
spell:isPremium(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MASS_HEALING)
spell:register()
