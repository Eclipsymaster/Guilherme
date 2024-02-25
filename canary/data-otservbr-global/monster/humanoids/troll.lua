local mType = Game.createMonsterType("Troll")
local monster = {}

monster.description = "um troll"
monster.experience = 60
monster.outfit = {
	lookType = 15,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 15
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 250,
	FirstUnlock = 10,
	SecondUnlock = 100,
	CharmsPoints = 5,
	Stars = 1,
	Occurrence = 0,
	Locations = "In many dungeons around Tibia like the troll cave in Thais, south of Carlin (out the east \z
		exit and down the hole), Island of Destiny, Edron Troll Cave, and in Ab'Dendriel. Also found in Rookgaard.",
}

monster.health = 50
monster.maxHealth = 50
monster.race = "blood"
monster.corpse = 5960
monster.speed = 63
monster.manaCost = 290

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Grrr", yell = false },
	{ text = "Haaaaaa", yell = false },
	{ text = "Grunidos", yell = false },
	{ text = "Hmmm, besouros", yell = false },
	{ text = "Hmmm, cachorros", yell = false },
}

monster.loot = {
	{ id = 3003, chance = 7950 }, -- corda
	{ id = 3031, chance = 65300, maxCount = 12 }, -- moeda de ouro
	{ id = 3054, chance = 80 }, -- amuleto anti-veneno
	{ id = 3277, chance = 13000 }, -- lanca
	{ id = 3336, chance = 5000 }, -- porrete reforcado
	{ id = 3355, chance = 12000 }, -- chapeu de couro
	{ id = 3412, chance = 4730 }, -- escudo de madeira
	{ id = 3552, chance = 10000 }, -- botas de couro
	{ id = 3577, chance = 15000 }, -- coxa
	{ id = 9689, chance = 1000 }, -- cabelos sedosos de troll
	--{ id = 23986, chance = 1000 }, -- heavy old tome
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
}

monster.defenses = {
	defense = 10,
	armor = 10,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
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
