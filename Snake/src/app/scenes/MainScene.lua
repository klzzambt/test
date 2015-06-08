
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    
    local sprite = display.newSprite("night.png")
    :align(display.CENTER, display.cx, display.cy)
    :addTo(self)

    -- local flySprite = display.newSprite("fly.png")
    -- :align(display.LEFT_CENTER, display.left - 600, display.top -300)
    -- :addTo(sprite)
    -- local flySprite2 = display.newSprite("fly.png")
    -- :align(display.LEFT_CENTER, display.left - 800, display.top -800)
    -- :addTo(sprite)
    self:createUIPushButton()
    cc.ui.UILabel.new({
            UILabelType = 2, text = "Snake", size = 64})
        :align(display.CENTER, display.cx, display.top - 80)
        :addTo(self)

        -- self:run(3)
end

-- function MainScene:run(actionNum)
-- 	self["action" .. actionNum](self)

-- end

-- function MainScene:action3()
-- display.addSpriteFrames("fly.plist", "fly.pvr.ccz")
    
--     local sprite = display.newSprite("#fly01.png")
--         :center()
--         :addTo(self.backgroundLayer)
        
--     local frames = display.newFrames("fly%02d.png", 1, 14)
--     local animation = display.newAnimation(frames, 0.2)

--     -- 添加到cache
--     display.setAnimationCache("fly", animation)
--     -- 从cache中取出
--     animation = display.getAnimationCache("fly")
--     -- 清除动画缓存
--     display.removeAnimationCache("fly")

--     sprite:playAnimationOnce(animation, false, function () print("complete...") end, 2)
-- end

function MainScene:createUIPushButton()
	local images = {
	normal = "button/Button01.png",
	pressed = "button/Button01Pressed.png",
    disabled = "button/Button01Disabled.png",
}


cc.ui.UIPushButton.new(images,{scale9 = true})
        :setButtonSize(240, 60)--设置大小
        --设置各个状态的按钮显示文字
        :setButtonLabel("normal",cc.ui.UILabel.new({
        	UILabelType = 2,
        	text = "Start",
        	size = 18,
        	})) 
        :setButtonLabel("pressed",cc.ui.UILabel.new({
        	UILabelType = 2,
        	Text = "Button Pressed",
        	size = 18,
        	color = cc.c3b(255, 50, 80)
        	}))
        :setButtonLabel("disabled",cc.ui.UILabel.new({
        	UILabelType = 2,
        	text = "Button Disabled",
        	size = 18,
        	color = cc.c3b(0,0,0)
        	}))



:onButtonClicked(function(event) -- 按钮的clicked事件处理
	local SecondScene = require("app/scenes/SecondScene")
       display.replaceScene(SecondScene.new(), "fade", 0.5, cc.c3b(255, 100, 100))
            print("pushButton click")
    end)
        :align(display.LEFT_CENTER, display.left + 210, display.top - 500) --设置坐标
        :addTo(self)


end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
