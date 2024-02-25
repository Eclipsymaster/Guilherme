local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(284, 23373, 1, CONST_ME_PURPLETELEPORT)
end

spell:name("Frasco gigante de mana")
spell:words("enfrascar mana gigante")
spell:group("support")
spell:vocation("Clerigo;true", 
				"Mago;true",  
				"Shaman;true", 
				"Escuridao;true", 
				"Banshee;true", 
				"Alquimista;true", 
				"Cronomancer;true" )
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(143)
spell:mana(1143)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
