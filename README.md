Render3dDisplayOnUnity
====
This project presents the asset of rendering 3d display(Parallax Barrier Display) on unity.  

## Description
A parallax barrier display can show a stereoscopic image without the 3D glasses. When we show the stereoscopic image on the display, we need to control the pixel color like below.  
Odd pixel : Red, Blue - Left eye,  Green - Right eye  
Even pixel: Red, Blue - Right eye, Green - Left eye  
Therefore, it is little difficult to control them.  

This unity project is an example asset of cameras to control the 3d display.  
We only check the operation of this asset on SHARP LL-151D.  

## Screenshot
This asset show the below image on running.  
<img src="https://raw.githubusercontent.com/hmhm903/Unity-Render3dDisplay/master/screenshot.png" alt="screenshot" width = 75%>  
(2D image. We can see this image as 3d on 3d display.)  
## Usage
1. Clone this repository.
1. Run Render3dDisplay\Assets\main.unity on unity.
1. Build this project on your environment.
1. Execute program, then the above image show on your display. You may need to change the output display configuration.

## Link
Parallax barrier: https://en.wikipedia.org/wiki/Parallax_barrier  
LL-151D: http://www.sharp.co.jp/lcd-display/crisia/lineup/ll-151d/ (in Japanese)
