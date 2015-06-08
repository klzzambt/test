
local SecondScene = class("SecondScene", function()
    return display.newScene("SecondScene")
end)

function SecondScene:ctor()
   local backgroundSprite = display.newSprite("water.png")
   :align(display.CENTER, display.cx, display.cy)
   :addTo(self)

   local border={}
 	for i=1, 40 do
 		border[i]={}
 		for j=1, 60 do
 			if((i==1 or i==40)or (j==1 or j== 60)) then
 				border[i][j]=display.newSprite("point1.png")
 				:align(display.CENTER, i*16-8, j*16-8)
 				:addTo(backgroundSprite)
 			end
 		end
 	end
   
   local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")
   local len = 4
   local spriteTable = {}
   for i = 1, len do
   	spriteTable[i] = display.newSprite("point.png")
   	:align(display.CENTER, display.width/2- i* 16, display.height/2 - i* 16)
    :addTo(backgroundSprite)
   end

   function dead( )
    	local check=false
    	local x1, y1=spriteTable[1]:getPosition()
    	
    		if (x1<16 or y1 <16) or (x1>624 or y1>624) then
    			check=true
    		end
    	
    	for i=2, len do
    		local poshead=cc.p(spriteTable[1]:getPosition())
    		local posbody=cc.p(spriteTable[i]:getPosition())
    		local distance=cc.pGetDistance(poshead, posbody)
    		if distance<=0 then
    			check=true
    		end
    	end

    	return check
    end

   local pointWidht = spriteTable[1]:getContentSize().width
   self.key = 26

   -- local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")
   local function onInterval(dt)
   	if dead() then
   		return
   	end
		if self.key == 28 then
			-- print(pointWidht)
		local move_up = cc.MoveBy:create(0.05, cc.p(0, pointWidht))
			spriteTable[1]:runAction(move_up)
			-- print(pointWidht)
		
		
		elseif self.key == 29 then
		local move_down = cc.MoveBy:create(0.05, cc.p(0, -pointWidht))
		    spriteTable[1]:runAction(move_down)
		


		elseif self.key == 26 then
		local move_left = cc.MoveBy:create(0.05, cc.p(-pointWidht, 0))
		    spriteTable[1]:runAction(move_left)
		
    
		elseif self.key == 27 then   
		local move_right = cc.MoveBy:create(0.05, cc.p(pointWidht, 0))
		       spriteTable[1]:runAction(move_right)
		end
		
		
		for i=2, len do
			local X,Y=spriteTable[i-1]:getPosition()
			spriteTable[i]:runAction(cc.MoveTo:create(0.05, cc.p(X, Y)))
		end
	end

	local handle = scheduler.scheduleGlobal(onInterval, 0.1)

 -- 	self:setKeypadEnabled(true)
	-- self:addNodeEventListener(cc.KEYPAD_EVENT, function(event)
	-- 	self.direction=tonumber(event.key)
	-- end)
   
   
   
    math.randomseed(os.time())  
       self.fruit = display.newSprite("point.png")
          :align(display.CENTER, math.random(2,39)*16 , math.random(2,39)*16 )
          :addTo(backgroundSprite)


   -- self.fruit = display.newSprite("1.png")
 		-- :align(display.CENTER, math.random(2,39)*16-8, math.random(2,39)*16-8)
 		-- :addTo(layer1)

   --  self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function()
   --  --     -- AABB
   --      local rectA = spriteTable[1]:getBoundingBox()
   --      local rectB = self.fruit:getBoundingBox()
   --      if (math.abs(rectA.x - rectB.x) * 2 <= (rectA.width + rectB.width))
   --          and (math.abs(rectA.y - rectB.y) * 2 <= (rectA.height + rectB.height)) then
   --          	score=score+1
   --          	num=num+1
   --          	spriteTable[num]=display.newSprite("1.png")
   --          	spriteTable[num]:align(display.CENTER, spriteTable[num-1]:getPosition())
   --          	spriteTable[num]:addTo(layer1)
   --          	print(num)
            

   --  			-- num=num+1
   --     --      	spriterandom:runAction(cc.MoveTo:create(0.05,cc.p(spriteTable[num-1]:getPosition())))
   --     --       	print(num)
   --           	self.fruit:setPosition(math.random(2,39)*16-8, math.random(2,39)*16-8)
   --     end
       
   --  end)
		
   --   self:scheduleUpdate()


   self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function()
       local rectA = spriteTable[1]:getBoundingBox()
       local rectB = self.fruit:getBoundingBox()
       if (math.abs(rectA.x - rectB.x) * 2 < (rectA.width + rectB.width))
            and (math.abs(rectA.y - rectB.y) * 2 < (rectA.height + rectB.height)) then
            len = len + 1
            spriteTable[len] = display.newSprite("point.png")
            spriteTable[len]:align(display.CENTER, spriteTable[len - 1]:getPosition())
            spriteTable[len]:addTo(backgroundSprite)
            print(len)

   --          -- local spriteTable = {}
   --          -- for i = 1,len do
   --          -- 	spriteTable[i+1] = display.newSprite("point.png")
   --          -- 	:addTo(backgroundLayer)
   --          -- end


            self.fruit:setPosition(math.random(2,39)*16, math.random(2,39)*16)
   --          	-- body
            
   --          	-- local overSprite = display.newSprite(fly.png)
   --          	-- :align(display.LEFT_CENTER, display.left - 600, display.top -300)
   --           --    :addTo(layer)
            	
            
        end

   end) 
   self:scheduleUpdate()


   self:setKeypadEnabled(true)
	self:addNodeEventListener(cc.KEYPAD_EVENT, function(event)
		self.key=tonumber(event.key)
	end)

-- self:createUIPushButton1()
-- self:createUIPushButton2()
-- self:createUIPushButton3()
-- self:createUIPushButton4()
   
end

-- function SecondScene:createUIPushButton1()
--      local images = {
--                  normal = "button/Button01.png",
--                  pressed = "button/Button01Pressed.png",
--                  disabled = "button/Button01Disabled.png",
    
--         }

--     cc.ui.UIPushButton.new(images,{scale9 = true})
--         :setButtonSize(80, 80)--设置大小
--         --设置各个状态的按钮显示文字
--         :setButtonLabel("normal",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "top",
--         	size = 18,
--         	})) 
--         :setButtonLabel("pressed",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	Text = "Button Pressed",
--         	size = 18,
--         	color = cc.c3b(255, 64, 64)
--         	}))
--         :setButtonLabel("disabled",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "Button Disabled",
--         	size = 18,
--         	color = cc.c3b(0,0,0)
--         	}))
--         :onButtonClicked(function(event) -- 按钮的clicked事件处理
--             print("pushButton click")
--         end)
-- 		--设置位置 锚点位置和坐标x,y
--         :align(display.CENTER, display.cx, display.top - 750)
-- 		:addTo(self)  

-- 	-- body
-- end

-- function SecondScene:createUIPushButton2()
--      local images = {
--                  normal = "button/Button01.png",
--                  pressed = "button/Button01Pressed.png",
--                  disabled = "button/Button01Disabled.png",
    
--         }

--     cc.ui.UIPushButton.new(images,{scale9 = true})
--         :setButtonSize(80, 80)--设置大小
--         --设置各个状态的按钮显示文字
--         :setButtonLabel("normal",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "left",
--         	size = 18,
--         	})) 
--         :setButtonLabel("pressed",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	Text = "Button Pressed",
--         	size = 18,
--         	color = cc.c3b(255, 64, 64)
--         	}))
--         :setButtonLabel("disabled",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "Button Disabled",
--         	size = 18,
--         	color = cc.c3b(0,0,0)
--         	}))
--         :onButtonClicked(function(event) -- 按钮的clicked事件处理
--             print("pushButton click")
--         end)
-- 		--设置位置 锚点位置和坐标x,y
--         :align(display.LEFT_CENTER, display.left + 170, display.top - 830)
-- 		:addTo(self)  

-- 	-- body
-- end


-- function SecondScene:createUIPushButton3()
--      local images = {
--                  normal = "button/Button01.png",
--                  pressed = "button/Button01Pressed.png",
--                  disabled = "button/Button01Disabled.png",
    
--         }

--     cc.ui.UIPushButton.new(images,{scale9 = true})
--         :setButtonSize(80, 80)--设置大小
--         --设置各个状态的按钮显示文字
--         :setButtonLabel("normal",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "right",
--         	size = 18,
--         	})) 
--         :setButtonLabel("pressed",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	Text = "Button Pressed",
--         	size = 18,
--         	color = cc.c3b(255, 64, 64)
--         	}))
--         :setButtonLabel("disabled",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "Button Disabled",
--         	size = 18,
--         	color = cc.c3b(0,0,0)
--         	}))
--         :onButtonClicked(function(event) -- 按钮的clicked事件处理
--             print("pushButton click")
--         end)
-- 		--设置位置 锚点位置和坐标x,y
--         :align(display.RIGHT_CENTER, display.right - 170, display.top - 830)
-- 		:addTo(self)  

-- 	-- body
-- end

-- function SecondScene:createUIPushButton4()
--      local images = {
--                  normal = "button/Button01.png",
--                  pressed = "button/Button01Pressed.png",
--                  disabled = "button/Button01Disabled.png",
    
--         }

--     cc.ui.UIPushButton.new(images,{scale9 = true})
--         :setButtonSize(80, 80)--设置大小
--         --设置各个状态的按钮显示文字
--         :setButtonLabel("normal",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "bottom",
--         	size = 18,
--         	})) 
--         :setButtonLabel("pressed",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	Text = "Button Pressed",
--         	size = 18,
--         	color = cc.c3b(255, 64, 64)
--         	}))
--         :setButtonLabel("disabled",cc.ui.UILabel.new({
--         	UILabelType = 2,
--         	text = "Button Disabled",
--         	size = 18,
--         	color = cc.c3b(0,0,0)
--         	}))
--         :onButtonClicked(function(event) -- 按钮的clicked事件处理
--             print("pushButton click")
--         end)
-- 		--设置位置 锚点位置和坐标x,y
--         :align(display.CENTER, display.cx, display.top - 910)
-- 		:addTo(self)  

-- 	-- body
-- end


function SecondScene:onEnter()
end

function SecondScene:onExit()
end

return SecondScene
