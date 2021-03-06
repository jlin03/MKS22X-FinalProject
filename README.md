# BIG $KRRT RACING

## Welcome to Big Skrrt Racing!
This is a physics based racing game that is based around time trials. There are a couple of pre-made tracks for you to play, and the game also includes a fully complete track editor which you can use to create and save tracks of your own! There are many different types of terrain, so watch out! We really didn't call this game BIG SKRRT for nothing. 

## Instructions:
1. Run BigSkrrtRacing.pde in processing to start the game.
2. From the title screen you can play or create a track
3. At any time, you can pause the game by pressing tilde ---> **~**
4. In the pause menu you can retry the current track or go back to the title screen.

## Play Instructions:
1. Starting from the yellow and travelling around to the black checkered pattern, you must complete **three** laps around the track. How fast can you win the race?
2. Use the arrow keys to steer and drive the car around the track. Don't hit the grass or you'll be **cast back to the start!**

## Editor Instructions:
1. All tracks **must** have at least one checkered yellow tile(starting spawn) and one black(goal). Each checkered tiletype should only be placed in one contiguous strip or block, and the two blocks should be touching each other as well as touching the grass on 2 sides(to prevent blatant cheating).
2. Use your mouse to place tiles on the map
3. The menu in the botton left hand corner shows what tile material you currently have selected
4. Press 'm' to open the material selection menu
5. Click save on the bottom right to place a savefile of your track in the game directory for play



## Devlog:
5/20/19 
  *
  - created repo
  - setup basic things

* 5/21/19
  *
  - In conjunction: coded PolarVector class
  - tested accessors and vector manipulation methods

5/22/19
  * Jerry: 
     - removed PolarVector class
     - replaced with PVector built-in processing class
     - started work on car, instance variables and part of vector updating done
  * Ben:
     - coded tile class that stores ground blocks as objects to represent on a 2d screen
     - started map class as structured array of tiles
     - intended to be modular/configurable in future

5/23/19
  * Jerry:
     - continuing to work on vectors
     - acceleration and force work properly
     - velocity needs to be fixed
  * Ben:
     - Solidified map and worked on getting it to display properly
     - different outputs for different ground materials, etc

5/24/19
  * Jerry:
     - velocity still needs to be fixed
     - found a temporary solution that isn't optimal

5/26/19
  * Jerry:
     - velocity fixed
     - friction coefficients work
     - acceleration is now limited by magnitude
     - rotation of the car angle implemented along with its relation to velocity

5/27/19
  * Ben:
     - Tested driving of map on car
     - began work on shifting friction values for car for different types of terrain
  * Jerry:
     - fixed many errors regarding the order in which vectors are updated
     - completed display method for car
     - fixed the turning angles when rotating the car and implemented centripetal acceleration

5/28/19
  * Ben:
    - Made final map for testing purposes
    - nicely laid out with no visible grid; began testing car physics on grass & road with Jerry
  * Jerry:
    - removed centripetal acceleration as it technically isn't a real force
    - further tuned car angles when turning
    - implemented engineOutput which smoothly adds force to the car
    - added acceleration limits to car

5/29/19
  * Ben:
    - started work on interfacing information between car and map, made preparations for further testing and improved the flow/structure of the map class
    - worked with Jerry to design general structure of level editor
  * Jerry:
    - did some more momentum and angle tuning for the car
    - drew all the tile pixel art pieces and imported them into the sketch
    - added code for all the tile images and material/friction values
    - made updating the map more efficient by only updating tiles that need to be updated
    - fixed map and tile classes' coordinate systems to work for more generalized functions
    - started working on menu and editor classes that will allow the user to create a level

5/30/19  
  * Jerry:
    - completed most parts of editor including a block selection menu and a map to be edited.
  * Ben:
    - Tested initial structure of editor
    - made changes to better integrate Tile and Map with the new modular editor class instead of hard coded map information

5/31/19
  * Ben:
    - Used filewriter to create initial saveMap method in the editor, debugging said method

6/1/19
  * Jerry:
    - added a current block tab on editor as an extra touch
    - added a new goal block and allowed it to be selected
    - the block selection menu is now generalized to any screen size
    - ported over controls from the main class into a separate controls class
    - started making the level class.

6/2/19
  * Jerry:
    - made it so that tiles can have as many stacks of textures placed on them as the map maker desires
    - added more tile types to be used to build the map
    - 90% completed the level class which is where the actual game takes place(need to work on the winning menu)
    - created the title menu for intuitive transition between different parts of the game
    - tried to implement collision(failed),will try again if i have time. 

6/3/19
  * Jerry:
    - made the title screen and game level somewhat more presentable
    - changed save from FileWriter to CreateWriter
  * Ben:
    - Made new menu in editor with Save button to quickly store maps
    - debugged save considerably
    - created new Map constructor in order to import stored savefiles
    - created new levelSelect mode for loading maps ingame using GUI

6/4/19 
  * Jerry:
    - created the pause and win menus
    - adjusted the car and level to be more playable
    - cleaned up some code and fixed some display bugs
  * Ben:
    - Fixed map loading bug
    - new image resources for levelMenu and levelButton to distinguish from Editor
    - created levelSelect screen with variable buttons for each of the extant map files in game folder
    - edited levelSelect to properly choose between editor and level (and removed ability to play in lawn)
    - created a default map for the game
