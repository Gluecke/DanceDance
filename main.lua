require "CiderDebugger";
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


--get screen dimentions
local screenx = display.contentWidth;
local screeny = display.contentHeight;

--options
local doDanceOptions = {
                    x = screenx/2,
                    y = screeny/4,
                    width = screenx/5,
                    label = "Dance!"
                        };

--functions
local startDance;

--GUI elements
local doDance = widgets.newButton(doDanceOptions);


startDance = function ( event )
    
    if(event.phase == "began")
        then
        print("button was pushed, do dance");
    end
    
    
end


--event listeners
doDance:addEventListener("touch", startDance);
