local mType = Game.createMonsterType("Orc Barbaro")
local monster = {}

monster.description = "um orc barbaro"
monster.experience = 585
monster.outfit = {
	lookType = 8,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 8
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Não definido",
}

monster.health = 210
monster.maxHealth = 210
monster.race = "blood"
monster.corpse = 5980
monster.speed = 125
monster.manaCost = 590

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 40,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "KRAK ORRRRRRK!", yell = true },
}

monster.loot = {
	{ id = 2914, chance = 830 }, -- vela
	{ id = 3031, chance = 54000, maxCount = 12 }, -- moeda de ouro
	{ id = 3266, chance = 6110 }, -- machado de batalha
	{ id = 3269, chance = 7280 }, -- alabarda
	{ id = 3358, chance = 890 }, -- malha de aco
	{ id = 3582, chance = 10400 }, -- carne
	{ id = 3347, chance = 5000 }, -- lanca de cacador
	{ id = 10196, chance = 3000 }, -- dente de orc
	{ id = 11477, chance = 9400 }, -- tunica da ira
	{ id = 11479, chance = 4000 }, -- couro de orc
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200 },
}

monster.defenses = {
	defense = 15,
	armor = 12,
	mitigation = 0.30,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 290, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
