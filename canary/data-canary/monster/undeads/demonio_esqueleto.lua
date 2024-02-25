local mType = Game.createMonsterType("Dem�nio Esqueleto")
local monster = {}

monster.description = "um dem�nio esqueleto"
monster.experience = 720
monster.outfit = {
	lookType = 37,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"UpperSpikeDeath",
}

monster.raceId = 37
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "N�o definido",
}

monster.health = 400
monster.maxHealth = 400
monster.race = "undead"
monster.corpse = 5963
monster.speed = 90
monster.manaCost = 620

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = 2920, chance = 5270 }, -- tocha
	{ id = 3027, chance = 2900 }, -- p�rola negra
	{ id = 3030, chance = 1400 }, -- rubi
	{ id = 3031, chance = 97000, maxCount = 75 }, -- moeda de ouro
	{ id = 3062, chance = 520 }, -- pedra da mente
	{ id = 3078, chance = 690 }, -- boneco misterioso
	{ id = 3287, chance = 10000, maxCount = 3 }, -- estrela ninja
	{ id = 3305, chance = 4000 }, -- mallet
	{ id = 3353, chance = 3450 }, -- elmo de ferro
	{ id = 3413, chance = 5000 }, -- escudo de batalha
	{ id = 3415, chance = 100 }, -- escudo do guardi�o
	{ id = 266, chance = 10120, maxCount = 2 }, -- po��o de vida
	{ id = 266, chance = 10000, maxCount = 2 }, -- po��o de vida
	{ id = 268, chance = 5300 }, -- po��o de mana
	{ id = 9647, chance = 12600 }, -- m�o demon�eca
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -185 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -50, range = 1, radius = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	mitigation = 0.91,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
