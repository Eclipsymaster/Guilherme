local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(283, 237, 1, CONST_ME_PURPLETELEPORT)
end

spell:name("Frasco médio de mana")
spell:words("enfrascar mana media")
spell:group("support")
spell:vocation("Clerigo;true", 
				"Mago;true",  
				"Shaman;true", 
				"Escuridao;true", 
				"Sumonador;true", 
				"Banshee;true", 
				"Alquimista;true", 
				"Cronomancer;true" )
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(67)
spell:mana(578)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
