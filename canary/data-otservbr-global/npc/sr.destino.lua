local internalNpcName = "Sr.Destino"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1202,
	lookHead = 114,
	lookBody = 78,
	lookLegs = 96,
	lookFeet = 114,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Venhas ate a minha pessoa para que possa lhe destinar a grandeza, decidindo sua raça!"},
	{ text = "Você também pode escolher viver aqui neste continente e descobrir os mistérios dessa terra!" },
	{ text = "Venhas até mim para lhe proporcionar cura!" },
	{ text = "Talvez seja sua primeira vez aqui porém nao será a ultima! \z HAHAH" },
	{ text = "Envenenado? Sangrando? Ferido? Eu posso lhe ajudar!" },
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

local vocation = {}
local temporaryVocation
local town = {}
local racePerVocation = {}
local config = {
	towns = {
		venore = {
			name = "venore",
			cityId = TOWNS_LIST.VENORE,},
		thais = {
			name = "thais",
			cityId = TOWNS_LIST.THAIS,},
		carlin = {
			name = "carlin",
			cityId = TOWNS_LIST.CARLIN,},
	},
	vocations = {
		clerigo = {
			name = "Clerigo",
			text = "Clérigos, são notáveis suportes que restauram vidas e livra as pessoas de status precários, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.HUMANO_CLERIGO,
		},
		paladino = {
			name = "Paladino",
			text = "Paladinos, são ilustres quando empunha uma espada pois suas habilidades são incríveis, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.HUMANO_PALADINO,
		},
		mago = {
			name = "Mago",
			text = "Magos, destruidores usando mágica, pois suas habilidades são ningualáveis, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.HUMANO_MAGO,
		},
		veterano = {
			name = "Veterano",
			text = "Veteranos, são mestres em camuflagem e em armas de fogo a longa distância, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.HUMANO_VERETANO,
		},
		barbaro = {
			name = "Barbaro",
			text = "Bárbaros, são distintos quando usando um machado, e furiosos, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ORC_BARBARO,
		},
		lanceiro = {
			name = "Lanceiro",
			text = "Lanceiros, conseguindo acertar uma borboleta com uma lança espartana á 500 metros são incríveis, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ORC_LANCEIRO,
		},
		shaman = {
			name = "Shaman",
			text = "Shamans, poderoso em batalhas amaldiçoando seus inimigos sempre é bom ter um shaman em seus grupos, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ORC_SHAMAN,
		},
		comandante = {
			name = "Comandante",
			text = "Comandantes, como um pato ele faz tudo porém não é excelente em nada, mas compensa em sua diversidade, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ORC_COMANDANTE,
		},
		escuridao = {
			name = "Escuridao",
			text = "Escuridão, optando pelo lado negro da força um manipulador distinto de materia escura, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ELF_ESCURIDAO,
		},
		sumonador = {
			name = "Sumonador",
			text = "Sumonadores, se diferenciam com suas habilidades de transformações e de sumonar criaturas que outros não tem, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ELF_SUMONADOR,
		},
		assassino = {
			name = "Assassino",
			text = "Assassinos, podesoro e furtivo, e um perito quando usando uma adaga, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ELF_ASSASSINO,
		},
		arqueiro = {
			name = "Arqueiro",
			text = "Arqueiros, distância é sua melhor amiga o seu segundo melhor amigo é um arco, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ELF_ARQUEIRO,
		},
		vampiro = {
			name = "Vampiro",
			text = "Vampiros, sedentos por sangue e não sendo adepto á luz do dia vampiros são bastante poderosos em lugares em certa hora da noite, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.MORTOVIVO_VAMPIRO,
		},
		banshee = {
			name = "Banshee",
			text = "Banshees, dedo no cuelho e gritaria? sem dúvidas é ela que você deseja, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.MORTOVIVO_BANSHEE,
		},
		mumia = {
			name = "Mumia",
			text = "Múmias, deseja diminuir suas mortes, então escolha uma múmia ela já está morta, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.MORTOVIVO_MUMIA,
		},
		ceifador = {
			name = "Ceifador",
			text = "Ceifadores, perito em foices e sendo bom e usar as forças obscuras esse é o ceifador, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.MORTOVIVO_CEIFADOR,
		},
		mineiro = {
			name = "Mineiro",
			text = "Mineiros, vivem pensando em ouro, em escavar buracos e queijos uai, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ANAO_MINEIRO,
		},
		besteiro = {
			name = "Besteiro",
			text = "Besteiros, perito em bestas é ele, não se preocupe ele só conhece as armas, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ANAO_BESTEIRO,
		},
		alquimista = {
			name = "Alquimista",
			text = "Alquimistas, esse é o cara do dinheiro, se der bobeira até a sua mãe virará ouro bem típico de uma anão, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ANAO_ALQUIMISTA,
		},
		cronomancer = {
			name = "Cronomancer",
			text = "Cronomancers, basicamente um domador do tempo e perito em velocidade, deseja se tornar um? {sim}, {não}",
			vocationId = VOCATION.ID.ANAO_CRONOMANCER,
		},
	},
}

local vocationRoomPositions = {
	[5] = { x = 32369, y = 32241, z = 7 },
	[6] = { x = 32369, y = 32241, z = 7 },
	[7] = { x = 32369, y = 32241, z = 7 },
	[8] = { x = 32369, y = 32241, z = 7 },
}

local function creatureSayCallback(npc, creature, type, message)

	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local race = creature:getVocation():getId()
	--local race = player:getVocation():getName()
	local topicTable = {}
	local choosingVocation
	local health = player:getHealth()

	local function vocationDefaultMessages(voc1, voc2, voc3, voc4) 
		npcHandler:say("São 4 especializações em cada raça que pode ser escolhidas por você. As especializações são {"..voc1.."}, {"..voc2.."}, {"..voc3.."} e {"..voc4.."} \n Cada raça tem suas vantagens e desvantagens, a escolha é sua!", npc, creature)
	end

	local function finishChoose(voc) 
		npcHandler:say("Me diga, voce vai se tornar um "..voc.."? \z 
		Responda com orgulho {SIM} se essa for sua escolha! \z
		ou responda {não} para ver as outras opções", npc, creature)
	end

	-- Heal and help dialog
	if MsgContains(message, "curar") and npcHandler:getTopic(playerId) == 0 then
		if player:getLevel() < 8 then
			if health < 47 or player:getCondition(CONDITION_POISON) then
				if health < 47 then
					player:addHealth(47 - health)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				end
				if player:getCondition(CONDITION_POISON) then
					player:removeCondition(CONDITION_POISON)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				end
				npcHandler:say("Receba sua cura!", npc, creature)
				npcHandler:setTopic(playerId, 0)
			else
				npcHandler:say("Não irem te recuperar vá e perca mais vida! Haha", npc, creature)
			end
		end
		-- Choosing dialog start
	elseif npcHandler:getTopic(playerId) == 0 and MsgContains(message, "especialização") then
		if race == 1 then
			vocationDefaultMessages(config.vocations.clerigo.name, 
									config.vocations.paladino.name,
									config.vocations.mago.name,
									config.vocations.veterano.name)
			racePerVocation[1] = config.vocations.clerigo.name
			racePerVocation[2] = config.vocations.paladino.name
			racePerVocation[3] = config.vocations.mago.name
			racePerVocation[4] = config.vocations.veterano.name
			npcHandler:setTopic(playerId, 1)
		elseif race == 2 then
			vocationDefaultMessages(config.vocations.barbaro.name, 
									config.vocations.lanceiro.name,
									config.vocations.shaman.name,
									config.vocations.comandante.name)
			racePerVocation[1] = config.vocations.barbaro.name
			racePerVocation[2] = config.vocations.lanceiro.name
			racePerVocation[3] = config.vocations.shaman.name
			racePerVocation[4] = config.vocations.comandante.name
			npcHandler:setTopic(playerId, 1)
		elseif race == 3 then
			vocationDefaultMessages(config.vocations.escuridao.name, 
									config.vocations.sumonador.name,
									config.vocations.assassino.name,
									config.vocations.arqueiro.name)
			racePerVocation[1] = config.vocations.escuridao.name
			racePerVocation[2] = config.vocations.sumonador.name
			racePerVocation[3] = config.vocations.assassino.name
			racePerVocation[4] = config.vocations.arqueiro.name
			npcHandler:setTopic(playerId, 1)
		elseif race == 4 then
			vocationDefaultMessages(config.vocations.vampiro.name, 
									config.vocations.banshee.name,
									config.vocations.mumia.name,
									config.vocations.ceifador.name)
			racePerVocation[1] = config.vocations.vampiro.name
			racePerVocation[2] = config.vocations.banshee.name
			racePerVocation[3] = config.vocations.mumia.name
			racePerVocation[4] = config.vocations.ceifador.name
			npcHandler:setTopic(playerId, 1)
		elseif race == 5 then
			vocationDefaultMessages(config.vocations.mineiro.name, 
									config.vocations.besteiro.name,
									config.vocations.alquimista.name,
									config.vocations.cronomancer.name)
			racePerVocation[1] = config.vocations.mineiro.name
			racePerVocation[2] = config.vocations.besteiro.name
			racePerVocation[3] = config.vocations.alquimista.name
			racePerVocation[4] = config.vocations.cronomancer.name
			npcHandler:setTopic(playerId, 1)
		else
			npcHandler:say("Essa vocação não é coorespondente", npc, creature, 10)
		end
		-- Say vocations name
	elseif npcHandler:getTopic(playerId) == 1 then
		if player:getLevel() < 8 or player:getLevel() > 10 then
			npcHandler:say("Você só poderá escolher uma especialização entre os leveis 8 a 10.", npc, creature, 10)
			npcHandler:setTopic(playerId, 0)
		else
			for i, v in pairs(config.vocations) do
				for a, b in pairs(racePerVocation) do
					if MsgContains(message, b) then
							temporaryVocation = message:lower()
							npcHandler:say(config.vocations[message:lower()].text, npc, creature, 10)
							npcHandler:setTopic(playerId, 2)
						return
					end
				end
			npcHandler:say("Você só pode escolher entre {"..racePerVocation[1].."}, {"..racePerVocation[2].."}, {"..racePerVocation[3].."} ou {"..racePerVocation[4].."}.", npc, creature, 10)
			npcHandler:setTopic(playerId, 1)
			end
		end
	elseif npcHandler:getTopic(playerId) == 2 then
		local lowcase = message:lower()
		if lowcase == "sim" then
			local vocationTable = config.vocations[temporaryVocation]
			if vocationTable then
				vocation[playerId] = vocationTable.vocationId
				npcHandler:setTopic(playerId, 3)
				npcHandler:say("Qual cidade você deseja morar: {"..config.towns.venore.name.."}, {"..config.towns.thais.name.."} ou {"..config.towns.carlin.name.."}?", npc, creature)
			end
		elseif lowcase == "não" or lowcase == "nao" then
			npcHandler:say("Você pode optar por essas especializações {"..racePerVocation[1].."}, {"..racePerVocation[2].."}, {"..racePerVocation[3].."} ou {"..racePerVocation[4].."}.", npc, creature, 10)
			npcHandler:setTopic(playerId, 1)
		end
	elseif npcHandler:getTopic(playerId) == 3 then
		local cityTable = config.towns[message:lower()]
		if cityTable then
			town[playerId] = cityTable.cityId
			npcHandler:say("A cidade escolhida é "..cityTable.name.." você tem certeza disso, {sim} ou {não}", npc, creature)
			npcHandler:setTopic(playerId, 4)
		end


	elseif npcHandler:getTopic(playerId) == 4 then
		if MsgContains(message, "sim") then
			player:setVocation(Vocation(vocation[playerId]))
			player:setTown(Town(town[playerId]))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Town(town[playerId]):getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say("Vá para seu destino!", npc, creature)
		else
			npcHandler:say("Qual cidade você deseja morar: {"..config.towns.venore.name.."}, {"..config.towns.thais.name.."} ou {"..config.towns.carlin.name.."}?", npc, creature)
			npcHandler:setTopic(playerId, 3)
		end
	end
	return true
end

local function greetCallback(npc, creature)
	local player = Player(creature)
	local playerId = player:getId()

	if player:getLevel() >= 8 then
		npcHandler:setMessage(
			MESSAGE_GREET,
			"Bem vindo jovem aventureiro. Fale comigo se você precisa escolher sua {especialização} dentro da sua raça."
		)
	else
		npcHandler:setMessage(
			MESSAGE_GREET,
			"Bem vindo. \z
			Se você precisa se {curar}, \z
			Ou me pergunte sobre {especialização} para definir seu futuro."
		)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:setMessage(MESSAGE_FAREWELL, "Ate mais.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
--338