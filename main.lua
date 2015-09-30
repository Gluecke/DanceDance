
-- 
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created By: Garrett Luecke
--
-- Created On: 9/29/2015
--
-- Notes: to deploy to a device, build project with emulator, drag apk file to device, install
--
-- Purpose: this app has people dancing when you press a button
--
--
--
--
-----------------------------------------------------------------------------------------

--get libraries
local widgets = require "widget";

------------------------
--variables
--get screen dimentions
local screenX = display.contentWidth;
local screenY = display.contentHeight;

 
------------------------
--option tables
--widget options
local doDanceOptions = {
                    x = screenX/2,
                    y = screenY/1.2,
                    width = screenX/4,
                    label = "Dance!"
                        };
                        
--sprite sheet options
local danceSheetOptions = {
	-- Required params
	frames = {
	},

	-- content scaling
	sheetContentWidth = 1024,
	sheetContentHeight = 1024
        };

--Generate the frames for the other images. adjusting the y value as necessary.
--set up all the frames in the image
local frames = danceSheetOptions.frames;
local frameCount = 0;
for frow = 1,15 do
	for fcol = 1,16 do
		local element = {
			x = 64 * (fcol - 1),
			y = 64 * (frow - 1),
			width = 64,
			height = 64
		}
		table.insert( frames, element )
                frameCount = frameCount + 1;
	end
end

--create dance sprite sequence data
local danceSpriteSeq = {
                name = "dancing",
                start = 1,
                count = frameCount,
                time = 10000,
                loopCount = 0, --indefinite loop
                loopDirection = "forward"
                }

------------------------
--display elements 

--spritesheet
local danceSpriteSheet = graphics.newImageSheet("Images/dancers.png", danceSheetOptions);

local danceSpriteAnim = display.newSprite(danceSpriteSheet, danceSpriteSeq);

--location of the sprite animation
danceSpriteAnim.x = screenX / 2;
danceSpriteAnim.y = screenY / 4;



------------------------
--forward function declarations
local startDance;


------------------------
--GUI elements
local doDance = widgets.newButton(doDanceOptions);


------------------------
--function bodies
startDance = function ( event )
    
    --only play if they hold their finger down
    if(event.phase == "began")
        then
        danceSpriteAnim:play();
    end
    
    if(event.phase == "ended")
        then
        danceSpriteAnim:pause();
    end
    
    
end


------------------------
--event listeners
doDance:addEventListener("touch", startDance);
