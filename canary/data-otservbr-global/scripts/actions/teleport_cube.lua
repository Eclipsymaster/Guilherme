--[[local configStepin = {
	position = Position(32377, 32239, 7)
}

local configTeleport = {
	{ levelmin = 10, levelmax = 100, name="Sala 1", position = Position(1054, 1040, 7) },
	{ levelmin = 101, levelmax = 200, name="Sala 2", position = Position(1116, 1094, 7) },
	{ levelmin = 201, levelmax = 300, name="Sala 3", position = Position(32369, 32241, 7) }
}

local teleportCube = MoveEvent()

function teleportCube.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local window = ModalWindow {
		title = "Salas por level",
		message = "De qual level a qual level"
	}
	if Position(configStepin.position) == player:getPosition() then
		for i, info in pairs(configTeleport) do
			if player:getLevel() > configTeleport[i].levelmin and player:getLevel() < configTeleport[i].levelmax then
				window:addChoice(string.format("%s", info.name), function (player, button, choice)
					if button.name ~= "Select" then
						return true
					end
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
					player:teleportTo(info.position)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return true
				end)
			end
		end
		window:addButton("Select")
		window:addButton("Close")
		window:setDefaultEnterButton(0)
		window:setDefaultEscapeButton(1)
		window:sendToPlayer(player)
		return true
	end
	return true
end
teleportCube:type("stepin")
--teleportCube:id(31633)
teleportCube:register()]]
