local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.2 + magicLevel * 1.4) + 8
	local max = (level * 0.2 + magicLevel * 1.795) + 11
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Cura Básica")
spell:words("cura leve")
spell:group("healing")
spell:vocation("Humano;true", "Orc;true", "Elf;true", "Morto-vivo;true", "Anao;true", "Clerigo;true", "Paladino;true", "Mago;true", "Veterano;true", "Barbaro;true", "Lanceiro;true", "Shaman;true", "Comandante;true", "Escuridao;true", "Sumonador;true", "Assassino;true", "Arqueiro;true", "Vampiro;true", "Banshee;true", "Mumia;true", "Ceifador;true", "Mineiro;true", "Besteiro;true", "Alquimista;true", "Cronomancer;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_LIGHT_HEALING)
spell:id(900)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(2)
spell:mana(19)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
