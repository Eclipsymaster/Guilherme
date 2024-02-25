local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local targetPlayer = creature:getTarget(var.number)
	local qtdMoedaDeCrystal = targetPlayer:getItemCount(3043)
	local qtdMoedaDePlatina = targetPlayer:getItemCount(3035)
	local qtdMoedaDeOuro = targetPlayer:getItemCount(3031)
	
	local totalValue = (qtdMoedaDeCrystal*10000)+(qtdMoedaDePlatina*100)+qtdMoedaDeOuro
	local percentValue = totalValue*0.10
	creature:say("Você tem: "..totalValue.." de ouro")

	qtdMoedaDeCrystal = qtdMoedaDeCrystal*0.05
	qtdMoedaDePlatina = qtdMoedaDePlatina*0.05
	qtdMoedaDeOuro = qtdMoedaDeOuro*0.05
	targetPlayer:removeItem(3043, qtdMoedaDeCrystal)
	targetPlayer:removeItem(3035, qtdMoedaDePlatina)
	targetPlayer:removeItem(3031, qtdMoedaDeOuro)
	

	--qtdDinheiro = qtdDinheiro*0.10
	--creature:say("roubei: "..qtdDinheiro.."0000")


	--targetPlayer:removeItem(3043, qtdDinheiro)
	--creature:addItem(3043, qtdDinheiro);
	combat:execute(creature, var)
end

spell:name("roubar")
spell:words("###777")
spell:range(1)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(false)
spell:needDirection(false)
spell:register()
--spell:vocation("Paladino", true, true) -- Vocation, showDescription, lastVoc