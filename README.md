# TankGame

A fun little game I am working on. Includes basic AI and an upgradable tank. Levels get harder as you get farther into the game. Included a levelcreator class but must be put into it's own folder to be used. Includes a randomized level feature with modifiable amount of enemies/walls.



• Bullet.pde:   Bullet class, instances are stored in a linkedlist in the BulletController.pde script

• BulletController.pde:  Handles the bullet collisions

• Button.pde:   Button class used in the UI.pde script

• EnemyAI.pde:  Defines enemy AI 

• EnemyTank.pde:  Enemy tank class, used in the TankController.pde script for multiple tanks

• PlayerTank.pde:   Player tank class

• TankController.pde:   Handles enemy placement, rendering, and shot cooldowns

• TankGame.pde:   Main loop to run the game

• TankLevelCreator.pde:   Level creator to aide in level creation (seperate from main game). Also note: very basic, must copy-paste the code printed in the terminal to the World.pde file

• UI.pde:   UI class that controls the entire user interface and can start the actual game.

• World.pde:  Contains definitions for each level, including wall placements, enemy types, and enemy placements. Note: I do not recommend writing level definitions by hand, use the TankLevelCreator.pde script to draw the levels and then copy-paste the code here.

