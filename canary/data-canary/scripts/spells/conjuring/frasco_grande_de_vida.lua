local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 701 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(285) ~= 0 then
			creature:setHealth(health - 700)
			creature:conjureItem(284, 239, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco grande de vida")
spell:words("enfrascar vida grande")
spell:group("support")
spell:vocation("Paladino;true", 
				"Veterano;true", 
				"Barbaro;true", 
				"Lanceiro;true", 
				"Comandante;true",
				"Sumonador;true",
				"Assassino;true",
				"Arqueiro;true", 
				"Vampiro;true", 
				"Mumia;true", 
				"Ceifador;true", 
				"Mineiro;true", 
				"Besteiro;true")
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(110)
spell:mana(239)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
