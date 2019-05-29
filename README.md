5/20/19 - created repo;setup basic things

5/21/19 - In conjunction: coded PolarVector class; tested accessors and vector manipulation methods

5/22/19 - Jerry: removed PolarVector class, replaced with PVector built-in processing class; started work on car, instance variables and part of vector updating done; 
Ben: coded tile class that stores ground blocks as objects to represent on a 2d screen; started map class as structured array of tiles, intended to be modular/configurable in future

5/23/19 - Jerry: continuing to work on vectors, acceleration and force work properly, velocity needs to be fixed
Ben: Solidified map and worked on getting it to display properly, different outputs for different ground materials, etc

5/24/19 - Jerry: velocity still needs to be fixed, found a temporary solution that isn't optimal

5/26/19 - Jerry: velocity fixed, friction coefficients work, acceleration is now limited by magnitude, rotation of the car angle implemented along with its relation to velocity.

5/27/19 - Ben: Tested driving of map on car, began work on shifting friction values for car for different types of terrain
Jerry: fixed many errors regarding the order in which vectors are updated, completed display method for car, fixed the turning angles when rotating the car and implemented centripetal acceleration.

5/28/19 - Ben: Made final map for testing purposes, nicely laid out with no visible grid; began testing car physics on grass & road with Jerry;
Jerry: removed centripetal acceleration as it technically isn't a real force; further tuned car angles when turning; implemented engineOutput which smoothly adds force to the car; added acceleration limits to car