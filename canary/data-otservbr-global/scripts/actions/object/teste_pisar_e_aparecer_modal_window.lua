-- Here is tile on player need to step on action script
local tileOnStep = {
	position = { x = 32377, y = 32239, z = 7 }
}

local tileToClean = {
	iPos = { x = 32157, y = 32301, z = 7 },
	fPos = { x = 32172, y = 32311, z = 7 }
}

-- You can addiction many options
local configTeleport = {
	{ levelmin = 10, levelmax = 1000, name="Teleport 1", position = Position(32157, 32301, 7) }
	--{ levelmin = 101, levelmax = 200, name="Teleport 2", position = Position(31717, 32400, 3) },
	--{ levelmin = 201, levelmax = 300, name="Teleport 3", position = Position(31761, 32401, 3) }
}

local function cleanMap(iPos, fPos)
	for _x = iPos.x, fPos.x, 1 do
		for _y = iPos.y, fPos.y, 1 do
			for _z = iPos.z, fPos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile and tile:getItemCount() > 0 then
					for _, it in pairs(tile:getItems()) do
						if it then
							local itemType = ItemType(it:getId())
							if itemType and not itemType:isCorpse() and not itemType:isContainer() and itemType:getWeaponType() <= WEAPON_NONE and itemType:isMovable() then
								it:remove()
							end
						end
					end
				end
			end
		end
	end
end

local function fireOnTile(iPos, fPos)
	local intervalX = fPos.x - iPos.x
	local intervalY = fPos.y - iPos.y
	local percentX = intervalX * 0.2
	local percentY = intervalY * 0.2
	intervalX = intervalX - percentX
	intervalY = intervalY - percentY

	print(iPos.x + intervalX, iPos.y + intervalY)
	print(fPos.x, fPos.y)
	print(intervalX, intervalY)

	for _x = iPos.x + intervalX, fPos.x, 1 do
		for _y = iPos.y + intervalY, fPos.y, 1 do
			for _z = iPos.z, fPos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				for _, it in pairs(tile:getItems()) do
					if it then
						local itemType = ItemType(it:getId())
						if itemType and itemType:isGroundTile() then
							tile:addItem(2118)
						end
					end
				end
			end
		end
	end
end

local moveEvent = MoveEvent()
function moveEvent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local window = ModalWindow {
		title = "Salas por level",
		message = "De qual level a qual level"
	}

	if Position(tileOnStep.position) == player:getPosition() then
		for i, info in pairs(configTeleport) do
			if player:getLevel() > configTeleport[i].levelmin and player:getLevel() < configTeleport[i].levelmax then
				window:addChoice(string.format("%s", info.name), function (player, button, choice)
					if button.name ~= "Select" then
						return true
					end
					cleanMap(tileToClean.iPos, tileToClean.fPos)
					addEvent(fireOnTile, 10 * 1000, tileToClean.iPos, tileToClean.fPos)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você foi teleportado para " .. info.name)
					player:teleportTo(info.position)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return true
				end)
				window:addButton("Select")
				window:addButton("Close")
				window:setDefaultEnterButton(0)
				window:setDefaultEscapeButton(1)
				window:sendToPlayer(player)
				return true
			end
		end
	end
end

moveEvent:type("stepin")
for value in pairs(tileOnStep) do
	moveEvent:position(tileOnStep.position)
end
moveEvent:register()
