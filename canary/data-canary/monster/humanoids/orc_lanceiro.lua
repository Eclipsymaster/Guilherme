local mType = Game.createMonsterType("Orc Lanceiro")
local monster = {}

monster.description = "um orc lanceiro"
monster.experience = 76
monster.outfit = {
	lookType = 50,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 50
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Orc Fortress, Folda Dungeon, Edron Orc Cave and around it, Ancient Temple, \z
		Venore Orc Cave, below the Point of No Return in Outlaw Camp, Plains of Havoc, \z
		North of Thais in the Orc Peninsula, Elvenbane and Orc Camp in Foreigner Quarter. \z
		Also found in Rookgaard West plains, Zao Orc Land.",
}

monster.health = 105
monster.maxHealth = 105
monster.race = "blood"
monster.corpse = 5996
monster.speed = 88
monster.manaCost = 310

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	targetDistance = 4,
	runHealth = 10,
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
	{ text = "Ugaar!", yell = false },
}

monster.loot = {
	{ id = 3031, chance = 71760, maxCount = 11 }, -- moeda de ouro
	{ id = 3277, chance = 17440 }, -- lanca
	{ id = 3308, chance = 3000 }, -- facao
	{ id = 3362, chance = 10000 }, -- calça de couro reforcado
	{ id = 3376, chance = 9000 }, -- capacete de couro reforcado
	{ id = 3577, chance = 30200 }, -- coxa
	{ id = 10196, chance = 150 }, -- dente de orc
	{ id = 11479, chance = 2300 }, -- couro de orc
	--{ id = 23986, chance = 1000 }, -- heavy old tome
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -30, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
