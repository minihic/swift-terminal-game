# LOOPWRECK - A text-based rogue-like space adventure!

![cover art](https://cdn.discordapp.com/attachments/285830379561287690/1107405543976468531/LoopWreck_Box_Art.png)

Login : AdmiralFlock \
Password : iloveAlien4ever

Initializing...

The game is a roguelike adventure, meaning that when you die, you will have to start over. The map is made of three levels, each level increases the difficulty and you pass to another level by finishing the one before. Every level will have a layout that is randomly generated so that each run will look different. To simplify your progression, you will find different objects that will boost your stats during your run or permanently to ease your game the more runs you do.

- You are a scout ship lost in space with a broken reactor condenser core.
- Your mission is to explore an abandoned shipwreck to find the components to fix your ship.
- There may be threats you are not aware of when starting this salvage mission.

## Playing the Game

All the instructions for playing the game are explained at the beginning. You will be prompted to choose a character, but choose wisely, this choice will affect your playthrough!

## Build Instructions

Just run 'swift build' and 'swift run' to play the game!

## Features

We have implemented a few interesting features:

- Rogue-Lite functinality, the ship upgrade will let you have bonus throughout your different runs. So when you die, you start the run over, but with a few bonuses.
- Procedurally generated map! evertime you play the game you will have a different layout that you will need to navigate, the items you will find are based on 30 differnt possibilties shared on two Item pools.
- Tier system for different enemies so the difficulty depends on which level you are.
- Level system means you can play the game all while a different map is generated.

## Changes from original vision

Despite our best efforts there are some features that didn't make it into the game:

- automatic mode not implemented
- compass feature simplified to just be a map command
- due to the procedural and random nature of the map generation, the illustration is done thanks the map command which shows you the map

## Easter Eggs

There are many references in the game related to other media! Many of the names of items are borrowed from other franchises.

## Swift Language Features

We used a lot of class creation and subtyping to create a multi level gameloop, the game initializes a run. A run initialize a new level each time the players finishes one.

The casting of the room to their subclass was also very usefull to tell the game to excute proper actions when the player enter a specific room, without having to rethink the whole room architecture.

Swift is overall a very interesting language althouth it is absolutly not practical for non Mac users and we really struggle to just set up our different computers for the project.

## Bugs and Issues

The map generation can be a little temperamental, and it has been very difficult to create correctly. We still dont print it correctly with the map command.

## Game Walkthrough


### Make sure to pick a good character for your playstyle!
![character selection](https://cdn.discordapp.com/attachments/424582738914574359/1107409562522374276/image.png)


### Navigate by typing go and the direction you wish to go to: 'go South'
![navigation](https://cdn.discordapp.com/attachments/424582738914574359/1107409620512821309/image.png)

### Show your inventory by typing 'inventory'
![inventory](https://cdn.discordapp.com/attachments/424582738914574359/1107409727559831562/image.png)

### You can also see your stats by typing in 'stats', these change depending on what items you pick up
![stats](https://cdn.discordapp.com/attachments/424582738914574359/1107409855528050708/image.png)

### See where you are going with 'map' command
![map](https://cdn.discordapp.com/attachments/424582738914574359/1107410509952721007/image.png)

### You can search a room by typing 'search'... What will you find?
![search](https://cdn.discordapp.com/attachments/424582738914574359/1107412048826093589/image.png)

### The combat system has a different set of commands so make sure you use 'help' to see your options
![combat](https://cdn.discordapp.com/attachments/424582738914574359/1107414229818032188/image.png)

## Good Luck out there!