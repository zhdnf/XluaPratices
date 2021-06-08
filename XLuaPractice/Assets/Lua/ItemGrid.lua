-- 生成一个table  生成Object
Object:subClass("ItemGrid")

ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.txtNum = nil

function ItemGrid:Init(father, posX, posY)
    self.obj = ABMgr:LoadRes("ui", "ItemGrid", typeof(GameObject))
    self.obj.transform:SetParent(father, false)
    self.obj.transform.localPosition = Vector3(posX, posY, 0)

    self.imgIcon = self.obj.transform:Find("imgIcon"):GetComponent(typeof(Image))
    self.txtNum =  self.obj.transform:Find("txtNum"):GetComponent(typeof(Text))  
end

function ItemGrid:InitData(data)
    local itemData = ItemData[data.id]
    -- data icon
    -- 加载图集， 再加载其图片
    local strs = string.split(itemData.icon, "_")
    local spriteAtlas = ABMgr:LoadRes("ui", strs[1], typeof(SpriteAtlas))
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    self.txtNum.text = data.num
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end