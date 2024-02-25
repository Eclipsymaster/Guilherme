local mType = Game.createMonsterType("Canibal")
local monster = {}

monster.description = "a canibal"
monster.experience = 255
monster.outfit = {
	lookType = 18,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 18
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Nùo definido",
}

monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 5976
monster.speed = 72
monster.manaCost = 450

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
	{ text = "N„o, nunca joguei futebol e nunca fiz um gol", yell = false },
}

monster.loot = {
	{ id = 2920, chance = 5000 }, -- tocha
	{ id = 3031, chance = 68000, maxCount = 30 }, -- moeda de ouro
	{ id = 3052, chance = 180 }, -- anel de vida
	{ id = 3114, chance = 240 }, -- cr‚nio
	{ id = 3367, chance = 990 }, -- imitaÁ„o de corno
	{ id = 3377, chance = 1000 }, -- armadura de escama
	{ id = 3492, chance = 9600, maxCount = 2 }, -- minhoca
	{ id = 5913, chance = 1000 }, -- pano marrom
	{ id = 10291, chance = 14470 }, -- pano podre
	{ id = 11467, chance = 5130 }, -- lanche de canibal
	{ id = 11484, chance = 950 }, -- torr„o de terra negra
	--{ id = 23986, chance = 1000 }, -- heavy old tome
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -15, maxDamage = -27, range = 1, radius = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 9, maxDamage = 15, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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
