local spheres = {
	[8300] = VOCATION.BASE_ID.HUMANO_MAGO,
	[8304] = VOCATION.BASE_ID.HUMANO_CLERIGO,
	[8305] = VOCATION.BASE_ID.HUMANO_PALADINO,
	[8306] = VOCATION.BASE_ID.HUMANO_VERETANO,
}

local globalTable = {
	[VOCATION.BASE_ID.HUMANO_CLERIGO] = 10005,
	[VOCATION.BASE_ID.HUMANO_PALADINO] = 10006,
	[VOCATION.BASE_ID.HUMANO_MAGO] = 10007,
	[VOCATION.BASE_ID.HUMANO_VERETANO] = 10008,
}

local elementalSpheresSoils2 = Action()
function elementalSpheresSoils2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not table.contains({ 7917, 7918, 7913, 7914 }, target.itemid) then
		return false
	end

	if not toPosition:isInRange({ x = 33238, y = 31806, z = 12 }, { x = 33297, y = 31865, z = 12 }) then
		return false
	end

	if not table.contains(spheres[item.itemid], player:getVocation():getBaseId()) then
		return false
	end

	if table.contains({ 7917, 7918 }, target.itemid) then
		player:say("Turn off the machine first.", TALKTYPE_MONSTER_SAY)
		return true
	end

	toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	Game.setStorageValue(globalTable[player:getVocation():getBase():getId()], 1)
	item:remove(1)
	return true
end

elementalSpheresSoils2:id(8300, 8304, 8305, 8306)
elementalSpheresSoils2:register()
