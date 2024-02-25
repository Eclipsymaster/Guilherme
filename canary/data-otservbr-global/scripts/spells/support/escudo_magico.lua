local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local conditionTrue = Condition(CONDITION_MANASHIELD)
conditionTrue:setParameter(CONDITION_PARAM_TICKS, -1)
combat:addCondition(conditionTrue)

local conditionFalse = Combat()
conditionFalse:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
conditionFalse:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
conditionFalse:setParameter(COMBAT_PARAM_DISPEL, CONDITION_MANASHIELD)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    local magicShield = creature:getCondition(CONDITION_MANASHIELD)
    if magicShield then
        creature:say("Escudo retirado")
        conditionFalse:execute(creature, var)
        return true
    else
        creature:say("Escudo acionado!")
        combat:execute(creature, var)
        return true
    end
end

spell:name("Escudo magico")
spell:words("escudo magico")
spell:group("support")
spell:vocation("Clerigo;true", "Mago;true", "Shaman;true", "Escuridao;true", "Banshee;true", "Alquimista;true", "Cronomancer;true")
spell:id(905)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(14)
spell:mana(50)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
