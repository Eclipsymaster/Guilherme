local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 1501 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(284) ~= 0 then
			creature:setHealth(health - 1500)
			creature:conjureItem(284, 23375, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco bitela de vida")
spell:words("enfrascar vida bitela")
spell:group("support")
spell:vocation("Paladino;true", 
				"Barbaro;true", 
				"Comandante;true", 
				"Vampiro;true", 
				"Mumia;true", 
				"Ceifador;true", 
				"Mineiro;true" )
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(239)
spell:mana(417)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
