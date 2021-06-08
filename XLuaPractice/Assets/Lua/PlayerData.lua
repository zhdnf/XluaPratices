PlayerData = {}

-- 背包功能
PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}

function PlayerData:Init()
    -- 存道具id和道具数量
    table.insert(self.equips, {id = 1, num = 1})
    table.insert(self.equips, {id = 4, num = 1})
    table.insert(self.items, {id = 2, num = 50})
    table.insert(self.items, {id = 6, num = 20})
    table.insert(self.gems, {id = 3, num = 99})
    table.insert(self.gems, {id = 5, num = 88})
end

