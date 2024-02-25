local internalNpcName = "Tom"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 144,
	lookHead = 113,
	lookBody = 115,
	lookLegs = 58,
	lookFeet = 115,
	lookAddons = 1,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Compro cadaveres frescos de ratos, coelhos e lobos." },
	{ text = "Ah, sim, tambem estou interessado em patas de lobo e patas de urso." },
	{ text = "E também compro couro de minotauro" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function farewellCallback(creature)
	local player = Player(creature)
	local playerId = player:getId()
	if player:getPlayerRace() == HUMAN then
		npcHandler:setMessage(MESSAGE_FAREWELL, "Boa aventuras minha querida!!!")
	else
		npcHandler:setMessage(MESSAGE_FAREWELL, "Vai trablhar e me traga mais corpos!")
	end
	return true
end


--[[keywordHandler:addAliasKeyword({ "mercadorias" })
keywordHandler:addAliasKeyword({ "animais" })
keywordHandler:addAliasKeyword({ "vender" })
keywordHandler:addAliasKeyword({ "comprar" })
keywordHandler:addAliasKeyword({ "oferta" })]]


--npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, farewellCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oii volta aqui!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "certo, veja o que voce deseja")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "antlers", clientId = 10297, sell = 5 },
	{ itemName = "bear paw", clientId = 5896, sell = 10 },
	{ itemName = "bunch of troll hair", clientId = 9689, sell = 5 },
	{ itemName = "dead rabbit", clientId = 4173, sell = 2 },
	{ itemName = "dead rat", clientId = 3994, sell = 2 },
	{ itemName = "dead wolf", clientId = 4007, sell = 5 },
	{ itemName = "lump of dirt", clientId = 9692, sell = 2 },
	{ itemName = "minotaur horn", clientId = 11472, sell = 15 },
	{ itemName = "minotaur leather", clientId = 5878, sell = 12 },
	{ itemName = "orc leather", clientId = 11479, sell = 8 },
	{ itemName = "orc tooth", clientId = 10196, sell = 40 },
	{ itemName = "pelvis bone", clientId = 11481, sell = 5 },
	{ itemName = "pig foot", clientId = 9693, sell = 2 },
	{ itemName = "poison spider shell", clientId = 11485, sell = 3 },
	{ itemName = "spider fangs", clientId = 8031, sell = 4 },
	{ itemName = "wolf paw", clientId = 5897, sell = 7 },
	{ itemName = "wool", clientId = 10319, sell = 10 },
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Vendido %ix %s por %i de ouro.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
