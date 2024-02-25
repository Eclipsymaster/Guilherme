local mType = Game.createMonsterType("Múmia")
local monster = {}

monster.description = "uma múmia"
monster.experience = 450  
monster.outfit = {
	lookType = 65,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 65
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Não definido",
}

monster.health = 240
monster.maxHealth = 240
monster.race = "undead"
monster.corpse = 6004
monster.speed = 75
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	pet = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Carai, estou enrolado", yell = false },
	{ text = "Onde fica o hospital para tirarem minhas faixas", yell = false },
}

monster.loot = {
	{ id = 3007, chance = 1500 }, -- anel de cristal
	{ id = 3017, chance = 4000 }, -- broche de prata
	{ id = 3027, chance = 1000 }, -- pérola negra
	{ id = 3031, chance = 38000, maxCount = 80 }, -- moeda de ouro
	{ id = 3045, chance = 5000 }, -- amuleto anti-raio
	{ id = 3046, chance = 5800 }, -- varinha mágica de luz 
	{ id = 3054, chance = 100 }, -- amuleto anti-veneno
	{ id = 3299, chance = 450 }, -- adaga venenosa
	{ id = 3429, chance = 170 }, -- escudo estrela negra
	{ id = 3492, chance = 19000, maxCount = 3 }, -- minhoca
	{ id = 5914, chance = 900 }, -- pano amarelo
	{ id = 9649, chance = 10000 }, -- bandagem
	{ id = 10290, chance = 10 }, -- mini múmia
	{ id = 11466, chance = 11690 }, -- fluido de embalsamamento
	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -85, condition = { type = CONDITION_POISON, totalDamage = 4, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -40, range = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -226, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 10000 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
