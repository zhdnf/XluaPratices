-- 常用类初始化
require("Object")
require("SplitTools")
Json = require("JsonUtility")

-- Unity
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RestTransform = CS.UnityEngine.RectTransform
-- 图集对象
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas
Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2
TextAsset = CS.UnityEngine.TextAsset

--UI
UI = CS.UnityEngine.UI
UIBehaviour = CS.UnityEngine.EventSystems.UIBehaviour

Image = UI.Image
Button = UI.Button
Text = UI.Text
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect

-- UI Canvas
Canvas = GameObject.Find("Canvas").transform

--AB包
ABMgr = CS.ABMgr.GetInstance()

