local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 1001 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(285) ~= 0 then
			creature:setHealth(health - 1000)
			creature:conjureItem(284, 7643, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco gigante de vida")
spell:words("enfrascar vida gigante")
spell:group("support")
spell:vocation("Paladino;true", 
				"Barbaro;true", 
				"Comandante;true", 
				"Sumonador;true", 
				"Vampiro;true", 
				"Mumia;true", 
				"Ceifador;true", 
				"Mineiro;true" )
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(157)
spell:mana(312)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
