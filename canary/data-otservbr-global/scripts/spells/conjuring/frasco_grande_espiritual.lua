local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 501 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(284) ~= 0 then
			creature:setHealth(health - 500)
			creature:conjureItem(284, 7642, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco grande espiritual")
spell:words("enfrascar espiritual grande")
spell:group("support")
spell:vocation("Veterano;true", 
				"Lanceiro;true",
				"Sumonador;true",
				"Assassino;true",
				"Arqueiro;true", 
				"Besteiro;true")
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(87)
spell:mana(612)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()