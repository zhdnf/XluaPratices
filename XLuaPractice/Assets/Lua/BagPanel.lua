BasePanel:subClass("BagPanel")

BagPanel.Content = nil
-- curBag
BagPanel.Items = {}
BagPanel.nowType = -1

function BagPanel:Init(name)
    -- 找没有挂在ui控件的对象还是手动找
    self.base.Init(self, name)
    local parent = self:GetControl("svBag", "ScrollRect").transform
    print(parent)

    if self.isEventInit == false then
        self.Content = self:GetControl("svBag", "ScrollRect").transform:Find("Viewport"):Find("Content")

        self:GetControl("btnClose", "Button").onClick:AddListener(function()
            self:HideMe()
        end)

        self:GetControl("togItem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)

        self:GetControl("togGem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)
        -- 泛型委托
        self:GetControl("togEquipment", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)



        self.isEventInit = true
    end
end

function BagPanel:ShowMe(name)
    self.base.ShowMe(self, name)
    self:ChangeType(1)
    if self.nowType == -1 then
        self.nowType = 1
    end
end


-- 切页签
-- 1-equip 2-item 3-gem
function BagPanel:ChangeType(type)
    print("type is: ".. type)
    if self.nowType == type then
        return
    end
    self.nowType = type

    -- 删除旧格子， 创建新格子
    for i=1, #self.Items do
        self.Items[i]:Destroy()
    end
    self.Items = {}

    -- 创建格子
    local nowItems = {}
    if type == 1 then
        nowItems = PlayerData.equips
    elseif  type == 2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end

    for i=1, #nowItems do
        --根据数据创建对象
        local grid = ItemGrid:new()
        --实例化
        grid:Init(self.Content, (i-1)%4*175, math.floor((i-1)/4)*175)
        --初始化
        grid:InitData(nowItems[i])

        table.insert(self.Items, grid)
    end

end