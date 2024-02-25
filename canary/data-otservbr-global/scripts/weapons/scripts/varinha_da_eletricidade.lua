local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 7
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local varinhaDaEletricidade = Weapon(WEAPON_WAND)


varinhaDaEletricidade.onUseWeapon = function(player, variant)
	return combat:execute(player, variant)
end

varinhaDaEletricidade:id(3074)
varinhaDaEletricidade:mana(1)
varinhaDaEletricidade:range(3)
varinhaDaEletricidade:register()