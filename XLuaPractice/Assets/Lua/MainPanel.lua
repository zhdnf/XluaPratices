
-- 新对象， 就建表
BasePanel:subClass("MainPanel")

function MainPanel:Init(name)
    
    self.base.Init(self, name)

    if self.isEventInit == false then
        self:GetControl("btnRole","Button").onClick:AddListener(function()
            self:BtnRoleClick()
        end)
        self.isEventInit = true
    end
end


function MainPanel:BtnRoleClick()
    -- BagPanel:ShowMe()
    BagPanel:ShowMe("BagPanel")
end