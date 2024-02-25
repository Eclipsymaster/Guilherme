local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 701 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(284) ~= 0 then
			creature:setHealth(health - 700)
			creature:conjureItem(284, 23374, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco gigante espiritual")
spell:words("enfrascar espiritual gigante")
spell:group("support")
spell:vocation("Veterano;true", 
				"Lanceiro;true",
				"Assassino;true",
				"Arqueiro;true", 
				"Besteiro;true")
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(157)
spell:mana(1024)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()