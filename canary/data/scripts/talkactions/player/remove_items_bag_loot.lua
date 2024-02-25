local removeFromContainer = TalkAction("!removeitems")

local container_id = ITEM_GOLD_POUCH -- ID do contêiner que você deseja usar
local exaust_storage_key = 545484
local exaust_time = 5 -- segundos

function removeFromContainer.onSay(player, words, param)
    if player:getStorageValue(exaust_storage_key) > os.time() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa esperar para usar este comando novamente.")
        return false
    end

    local container = player:getContainerById(container_id)
    if container then
        local removed_count = 0
        for slot = 0, container:getSize() - 1 do
            local item = container:getItem(slot)
            if item then
                container:removeItem(slot, item:getCount())
                removed_count = removed_count + 1
            end
        end

        if removed_count > 0 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("%d itens removidos do contêiner.", removed_count))
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O contêiner está vazio.")
        end

        player:setStorageValue(exaust_storage_key, os.time() + exaust_time)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Contêiner não encontrado ou vazio.")
    end

    return false
end

removeFromContainer:separator(" ")
removeFromContainer:groupType("normal")
removeFromContainer:register()