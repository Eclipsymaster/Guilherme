local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(285, 268, 1, CONST_ME_PURPLETELEPORT)
end

spell:name("Frasco de mana")
spell:words("enfrascar mana")
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
spell:level(17)
spell:mana(297)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
