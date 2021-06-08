print("Test ok")

require("InitClass")

-- 初始化json
require("ItemData")

-- 玩家信息
-- 单机:本地 PlayerPrefs, Json, 2进制
-- 网络：服务器
require("PlayerData")
PlayerData:Init()

require("BasePanel")
require("MainPanel")
require("BagPanel")
require("ItemGrid")
MainPanel:ShowMe("MainPanel")