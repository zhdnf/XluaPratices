-- AB加载ab包
-- 加载text文本对象
local txt = ABMgr:LoadRes("json", "ItemData", typeof(TextAsset))
print(txt.text)
local itemList = Json.decode(txt.text)
print(itemList)

-- 加载的是数据结构不易查询
-- key->ID  value->itemData
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end
