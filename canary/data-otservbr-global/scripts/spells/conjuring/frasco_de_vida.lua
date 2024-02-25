local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local health = creature:getHealth()
	if health < 221 then 
		creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem vida necessária.")
		return false
	else
		if creature:getItemCount(285) ~= 0 then
			creature:setHealth(health - 220)
			creature:conjureItem(285, 266, 1, CONST_ME_REDTELEPORT)
			return true
		else
			creature:sendTextMessage(MESSAGE_FAILURE, "Você não tem o item necessário.")
			return false
		end
	end
end

spell:name("Frasco de vida")
spell:words("enfrascar vida")
spell:group("support")
spell:vocation("Clerigo;true", 
				"Paladino;true", 
				"Mago;true", 
				"Veterano;true", 
				"Barbaro;true", 
				"Lanceiro;true", 
				"Shaman;true", 
				"Comandante;true", 
				"Escuridao;true", 
				"Sumonador;true", 
				"Assassino;true", 
				"Arqueiro;true", 
				"Vampiro;true", 
				"Banshee;true", 
				"Mumia;true", 
				"Ceifador;true", 
				"Mineiro;true", 
				"Besteiro;true", 
				"Alquimista;true", 
				"Cronomancer;true" )
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(21)
spell:mana(71)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
