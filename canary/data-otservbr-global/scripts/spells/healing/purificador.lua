local combat = {}
local condition = {CONDITION_BLEEDING, CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_PARALYZE}

for i = 1, 5 do 
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
	combat[i]:setParameter(COMBAT_PARAM_DISPEL, condition[i])
	combat[i]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
end

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)

	for key, value in pairs(combat) do
		combat[key]:execute(creature, variant)
	end
	return true
end

spell:name("Purificar")
spell:words("purificar o")
spell:group("healing")
spell:vocation("Clerigo;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_INTENSE_WOUND_CLEANSING)
spell:id(903)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(39)
spell:mana(70)
spell:needTarget(true)
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:allowOnSelf(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()