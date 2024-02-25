local internalNpcName = "Oressa"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 148,
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
	{ text = "Venhas ate a minha pessoa para que possa lhe destinar a grandeza, decidindo sua raca!"},
	{ text = "Voce tambem pode escolher viver aqui neste continente e descobrir os misterios dessa terra!" },
	{ text = "Venhas ate mim para lhe proporcionar cura!" },
	{ text = "Talvez seja sua primeira vez aqui porém nao sera a ultima! \z HAHAH" },
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

-- Basic keywords
--[[keywordHandler:addKeyword({ "nome" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Eu sou Oressa quatro ventos, a {curadora}. ",
})
keywordHandler:addKeyword({ "curadora" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Se machucou brigando com alguns ratinhos, eu vou {curar} seus esfolados.",
})
keywordHandler:addKeyword({ "trabalho" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Eu posso {curar} seus ferimentos. E tambem posso ajudar voce com a escolha de sua {raca}. ",
})
keywordHandler:addKeyword({ "doors" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Behind each of those doors, the equipment and skills of one vocation lies - \z
		sorcerer, paladin, knight or druid. ...",
	"When you have reached level 8, you can choose your definite vocation. You have to talk to me to receive it, \z
		and then you may open one of the doors, take up your vocation's gear, and leave the island. But be aware: ...",
	"Once you have chosen your vocation and stepped through a door, you cannot go back or choose a different vocation. \z
		So choose well!",
})
keywordHandler:addKeyword({ "inigo" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Já viu muita coisa e gosta de ajudar os mais novos. Se você tiver dúvidas sobre o que fazer, \z
			ou a quem pedir alguma coisa, vá até Inigo.",
})
--[[keywordHandler:addKeyword({ "richard" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Found a new way of living and took to it like a fish to water.",
})
keywordHandler:addKeyword({ "coltrayne" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "Ah. Some wounds never heal. <sighs> Shipwrecked in body and mind. Nowhere to go, so he doesn't leave.",
})
keywordHandler:addKeyword({ "morris" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "He broods over problems he won't share. But maybe you can help him with a little quest or two.",
})
keywordHandler:addKeyword({ "hamish" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "He lives only for his experiments and potions",
})
keywordHandler:addKeyword({ "dawnport" }, StdModule.say, {
	npcHandler = npcHandler,
	text = {
		"This is a strange place. Many beings are called to it. I dreamed of it long before I came here. ...",
		"Something spoke to me, telling me I had to be its voice; a voice of the Oracle here for the sake of \z
			the adventurers that would come to defend {World} against evil and need to {choose} their destiny.",
	},
})
keywordHandler:addKeyword({ "rookgaard" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "I have heard of it, yes.",
})]]

--From topic of vocation to topic of the "yes" message (choosing vocation)
local topicTable = {
	[5] = VOCATION.ID.HUMANO,
	[6] = VOCATION.ID.ORC,
	[7] = VOCATION.ID.ELF,
	[8] = VOCATION.ID.MORTOVIVO,
	[9] = VOCATION.ID.ANAO,
}

local vocationRoomPositions = {
	[5] = { x = 32043, y = 31878, z = 7 },
	[6] = { x = 32043, y = 31878, z = 7 },
	[7] = { x = 32043, y = 31878, z = 7 },
	[8] = { x = 32043, y = 31878, z = 7 },
	[9] = { x = 32043, y = 31878, z = 7 },
}

local function creatureSayCallback(npc, creature, type, message)

	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local health = player:getHealth()

	local vocationDefaultMessages = {
		"São 5 racas que podem ser escolhidas pelas pessoas que passam por aqui. \z
			As racas sao: {humano}, {orc}, {elf}, {mortos vivos} ou {anao}. \z
			Cada raca tem suas vantagens e desvantagens, a escolha e sua!",
		"Apos escolher sua raca voce tambem escolhera sua especializacao dentro da sua raca.",
		"Essa que nunca mais mudara a nao ser que voce conhaca alguem que possa dar um jeitinho, se e que voce me entende...",
		"Porem eu nao posso falar muito sobre isso...",
		"Voce havera ate o {level 15} para escolher, apos esse level nao me e permitido dar passagem para novatos",
	}

	-- Heal and help dialog
	if MsgContains(message, "curar") and npcHandler:getTopic(playerId) == 0 then
		if player:getLevel() < 8 then
			if health < 40 or player:getCondition(CONDITION_POISON) then
				if health < 40 then
					player:addHealth(40 - health)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				end
				if player:getCondition(CONDITION_POISON) then
					player:removeCondition(CONDITION_POISON)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				end
				npcHandler:say("Esta machucadinho, vou te curar.", npc, creature)
				npcHandler:setTopic(playerId, 0)
			else
				local race = player:getVocation():getName()
				local race = creature:getVocation():getName()
				npcHandler:say(race, npc, creature)
				--npcHandler:say("oi", npc, creature)
			end
		end
	elseif MsgContains(message, "ajuda") and npcHandler:getTopic(playerId) == 0 then
		if player:getCondition(CONDITION_POISON) == nil or health > 40 then
			return npcHandler:say("Voce nao precisa de cura e tambem nao esta envenenado", npc, creature)
		end
		if health < 40 or player:getCondition(CONDITION_POISON) then
			if health < 40 then
				player:addHealth(40 - health)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			if player:getCondition(CONDITION_POISON) then
				player:removeCondition(CONDITION_POISON)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			npcHandler:say("Esta machucadinho, vou te curar.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		-- Vocation dialog
	elseif npcHandler:getTopic(playerId) == 0 and MsgContains(message, "raca") then
		npcHandler:say(vocationDefaultMessages, npc, creature, 10)
		npcHandler:setTopic(playerId, 0)
		player:setStorageValue(Storage.Dawnport.DoorVocation, -1)-- Retirar essa linha quando acabar de fazer testes
		-- Choosing dialog start
	elseif MsgContains(message, "escolhendo") or MsgContains(message, "escolha") and npcHandler:getTopic(playerId) == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say(
				"Deixa eu te ajudar a escolher. \z
				Temos os {humanos} que tem 4 especializacoes sendo elas {Clerigo}, {Paladino}, {Mago} e {Ninja}. \z
				Temos tambem os {Orcs} que as especializacoes são {Barbaro}, {Shaman}, {Lanceiro} e {Commander}. \z
				Tambem temos os {Elfs} que tem as especializacoes {Escuridao}, {Branco}, {Assassino} e {Arqueiro}. \z
				E os proximos sao os {Mortos vivos} com especializacoes {Beholden}, {Banshee}, {Djin} e {Gigante}. \z
				E nao menos importantes {Anoes} com especializacoes {Mineiro}, {Besteiro}, {Clubnder} e {Cronomancer}. \z
				Deseja mais informacoes sobre cada tipo voce pode ir falar com o {inigo}",
				npc,
				creature
			)
			npcHandler:setTopic(playerId, 2)
		else
			npcHandler:say(vocationDefaultMessages, npc, creature, 10)
			npcHandler:setTopic(playerId, 0)
		end
	--[[elseif MsgContains(message, "distance") and npcHandler:getTopic(playerId) == 2 then
		npcHandler:say("Tell me: Do you prefer to fight with {bow} and {spear}, or do you want to cast {magic}?", npc, creature)
		npcHandler:setTopic(playerId, 3)
		-- knight
	elseif MsgContains(message, "close") and npcHandler:getTopic(playerId) == 2 then
		npcHandler:say({
			"Then you should choose the {vocation} of a knight and become a valiant fighter with sword and shield. ...",
			"Knights are the toughest of all vocations. They can take more damage and carry more items than the other \z
					vocations, but they will deal less damage than paladins, druids or sorcerers. ...",
			"Knights can wield one- or two-handed swords, axes and clubs, and they can cast a few spells to draw a \z
					monster's attention to them. ...",
			"So tell me: DO YOU WISH TO BECOME A VALIANT KNIGHT? Answer with a proud {YES} if that is your choice!",
		}, npc, creature, 10)
		npcHandler:setTopic(playerId, 5)
		-- Paladin
	elseif MsgContains(message, "bow") or MsgContains(message, "spear") and npcHandler:getTopic(playerId) == 3 then
		npcHandler:say({
			"Then you should join the ranks of the paladins, noble hunters and rangers of the wild, who rely on the \z
					swiftness of movement and ranged attacks. ...",
			"Paladins are jacks of all trades. They are tougher than the magically gifted and can carry more items \z
					than druids or sorcerers, but they can take not as much damage as a knight can. ...",
			"Paladins deal more damage than knights but less than druids or sorcerers, and have the longest range \z
					in their distance attacks. ...",
			"They can also use holy magic to slay the unholy and undead in particular. ...",
			"DO YOU WISH TO BECOME A DARING PALADIN? Answer with a proud {YES} if that is your choice!",
		}, npc, creature, 10)
		npcHandler:setTopic(playerId, 6)
		-- Mage
	elseif MsgContains(message, "magic") and npcHandler:getTopic(playerId) == 3 then
		npcHandler:say(
			"Tell me: Do you prefer to {heal} and cast the power of nature and ice, or do you want to rain \z
			fire and {death} on your foes?",
			npc,
			creature
		)
		npcHandler:setTopic(playerId, 4)
		-- Druid
	elseif MsgContains(message, "heal") and npcHandler:getTopic(playerId) == 4 then
		npcHandler:say({
			"Then you should learn the ways of the druids, healers and powerful masters of natural magic. ...",
			"Druids can heal their friends and allies, but they can also cast powerful ice and earth magic \z
					to kill their enemies. They can do a little energy, fire or death damage as well. ...",
			"Druids cannot take much damage or carry many items, but they deal \z
					much more damage than paladins or knights. ...",
			"So tell me: DO YOU WISH TO BECOME A SAGACIOUS DRUID? Answer with a proud {YES} if that is your choice!",
		}, npc, creature, 10)
		npcHandler:setTopic(playerId, 7)
		-- Sorcerer
	elseif MsgContains(message, "death") and npcHandler:getTopic(playerId) == 4 then
		npcHandler:say({
			"Then you should become a sorcerer, a mighty wielder of deathly energies and arcane fire. ...",
			"Sorcerers are powerful casters of magic. They use fire, energy and death magic to lay low their enemies. \z
					They can do a little ice or earth damage as well. ...",
			"Sorcerers cannot take much damage or carry many items, \z
					but they deal much more damage than paladins or knights. ...",
			"So tell me: DO YOU WISH TO BECOME A POWERFUL SORCERER? Answer with a proud {YES} if that is your choice!",
		}, npc, creature, 10)
		npcHandler:setTopic(playerId, 8)]]
		-- Choosing dialog start
	elseif MsgContains(message, "decidido") and npcHandler:getTopic(playerId) == 0 then
		npcHandler:say("Entao me diga, qual fora sua escolha: {humano}, {orc}, {elf}, {morto vivo} ou {anao}?", npc, creature)
		-- Say vocations name
	elseif MsgContains(message, "humano") and npcHandler:getTopic(playerId) == 0 then
		local message = {
			"Humanos sao bem versateis \z
				temos na raca dos humanos clerigo, paladino, mago e ninja ...",
		}

		if player:getLevel() >= 8 then
			table.insert(message, "Me diga, voce vai se tornar um humano?" .. " Responda com orgulho {SIM} se essa for sua escolha!")
			npcHandler:setTopic(playerId, 5)
		else
			npcHandler:setTopic(playerId, 0)
		end

		npcHandler:say(message, npc, creature, 10)
	elseif MsgContains(message, "orc") and npcHandler:getTopic(playerId) == 0 then
		local message = {
			"Orcs sao bem poderosos e mal cheirosos, mas uma coisa compensa a outra nao e mesmo? \z
			temos na raca dos orcs barbaro, shaman, lanceiro e commander ...",
		}

		if player:getLevel() >= 8 then
			table.insert(message, "Me diga, voce vai se tornar um orc fedorento?" .. " Responda com orgulho {SIM} se essa for sua escolha!")
			npcHandler:setTopic(playerId, 6)
		else
			npcHandler:setTopic(playerId, 0)
		end

		npcHandler:say(message, npc, creature, 10)
	elseif MsgContains(message, "elf") and npcHandler:getTopic(playerId) == 0 then
		local message = {
			"Elfs... os opostos na mesma raca \z
			e nela temo os elfs escuridao, branco, assassino e arqueiro ...",
		}

		if player:getLevel() >= 8 then
			table.insert(message, "Me diga, voce vai se tornar um elf?" .. " Responda com orgulho {SIM} se essa for sua escolha!")
			npcHandler:setTopic(playerId, 7)
		else
			npcHandler:setTopic(playerId, 0)
		end

		npcHandler:say(message, npc, creature, 10)
	elseif MsgContains(message, "mitico") and npcHandler:getTopic(playerId) == 0 then
		local message = {
			"Os miticos, ja colocaram de tudo aqui pensei que teria o chupa cabra tambem \z
			e aqui temos os beholdee, banshee, djin e gigante",
		}

		if player:getLevel() >= 8 then
			table.insert(message, "Me diga, voce vai se tornar um mito?" .. " Responda com orgulho {SIM} se essa for sua escolha!")
			npcHandler:setTopic(playerId, 8)
		else
			npcHandler:setTopic(playerId, 0)
		end

		npcHandler:say(message, npc, creature, 10)
	elseif MsgContains(message, "anao") and npcHandler:getTopic(playerId) == 0 then
		local message = {
			"Anao, serio, voce deseja crescer na vida ou nao? \z
			na raca dos anoes temos os mineiros, besteiros, clubnder e cronomancer.",
		}

		if player:getLevel() >= 8 then
			table.insert(message, "Me diga, voce vai se tornar um anao?" .. " Responda com orgulho {SIM} se essa for sua escolha!")
			npcHandler:setTopic(playerId, 9)
		else
			npcHandler:setTopic(playerId, 0)
		end

		npcHandler:say(message, npc, creature, 10)
	elseif (npcHandler:getTopic(playerId) >= 5) and (npcHandler:getTopic(playerId) <= 9) then
		if MsgContains(message, "sim") and player:getLevel() > 15 then
			npcHandler:say({
				"Lembra que lhe avisei sobre o level, voce nao podera sair daqui assim",
			}, npc, creature, 10)
			npcHandler:setTopic(playerId, 0)
			return true
		
		elseif MsgContains(message, "sim") then
			for index, value in pairs(topicTable) do
				if npcHandler:getTopic(playerId) == index then
					if player:getStorageValue(Storage.Dawnport.DoorVocation) == -1 then
						-- Change to new vocation, convert magic level and skills and set proper stats
						player:changeVocation(value)
						player:setStorageValue(Storage.Dawnport.DoorVocation, value)
						if configManager.getBoolean(configKeys.TELEPORT_PLAYER_TO_VOCATION_ROOM) then
							local position = vocationRoomPositions[index]
							player:teleportTo(Position(position.x, position.y, position.z))
							player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						end
					else
						npcHandler:setTopic(playerId, 0)
						return true
					end
				end
			end
			-- Remove Mainland smuggling items
			removeMainlandSmugglingItems(player)
			npcHandler:say({
				"E em fim voce resolveu tomar uma direcao na sua vida " .. player:getVocation():getName():upper() .. "! ...",
				"Fale com o barqueiro para ele te levar ao seu destino!",
			}, npc, creature, 10)
			npcHandler:setTopic(playerId, 0)
		elseif MsgContains(message, "nao") then
			local vocationMessage = {
				[5] = "{orc}, {elf}, {mitico} ou {anao}",
				[6] = "{humano}, {elf}, {mitico} ou {anao}",
				[7] = "{humano}, {orc}, {mitico} ou {anao}",
				[8] = "{humano}, {orc}, {elf} ou {anao}",
				[9] = "{humano}, {orc}, {elf} ou {mitico}",
			}
			npcHandler:say({
				"Como quiser. Se voce deseja aprender algo sobre o " .. vocationMessage[npcHandler:getTopic(playerId)] .. " raca, fale comigo.",
			}, npc, creature, 10)
			npcHandler:setTopic(playerId, 0)
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
			"Bem vindo jovem aventureiro. Fale comigo se voce precisar de ajuda \z
												{escolhendo} sua {raca}, ou se voce ja esta {decidido} qual sua {raca} escolhida."
		)
	else
		npcHandler:setMessage(
			MESSAGE_GREET,
			"Bem vindo minha crianca. \z
				Se voce precisa se {curar}, Eu posso ajuda. Ou me pergunte sobre {raca} se voc� precisar de conselho."
		)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:setMessage(MESSAGE_FAREWELL, "Ate mais, crianca.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
