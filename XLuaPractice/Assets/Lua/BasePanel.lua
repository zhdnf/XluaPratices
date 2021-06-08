Object:subClass("BasePanel")

BasePanel.panelObj = nil
BasePanel.controls = {}
BasePanel.isEventInit = false

function BasePanel:Init(name)
    -- 实例化对象
    if self.panelObj == nil then 
        self.panelObj = ABMgr:LoadRes("ui", name, typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)
        -- GetComponentsInchildren
        -- 所有ui控件
        -- 为了避免找各种控件， 拼面板要以一种规则来命名
        -- button->btn  toggle->tog  image->img  ScrollRect->sv
        
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
        for i=0, allControls.Length-1 do
            local controlName = allControls[i].name
            -- 按命名规则找控件
            if string.find(controlName, "btn") ~= nil 
            or string.find(controlName, "tog") ~= nil
            or string.find(controlName, "img") ~= nil
            or string.find(controlName, "sv") ~= nil  
            or string.find(controlName, "txt") ~= nil then
                local typeName = allControls[i]:GetType().Name
                -- 避免一个对象有多个ui控件， 避免覆盖
                if self.controls[controlName] ~= nil then
                    self.controls[controlName][typeName] = allControls[i]
                else
                    -- 一个对象中有多个控件，为了取时，方便获取，要指明对象类型
                    self.controls[controlName] = {[typeName] = allControls[i]}
                end
            end
        end
    end
end

function BasePanel:GetControl(name, typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end


function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(fasle)
end


