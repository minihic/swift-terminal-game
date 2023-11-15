# Description of the game

## Narrative of the game

The game is a roguelike adventure, meaning that when you die, you will have to start over. The map is made of three levels, each level increases the difficulty and you pass to another level by finishing the one before. Every level will have a layout that is randomly generated so that each run will look different. To simplify your progression, you will find different objects that will boost your stats during your run or permanently to ease your game the more runs you do.

- You are a scout ship lost in space with a broken reactor condenser core.
- Your mission is to explore an abandoned shipwreck to find the components to fix your ship.
- There may be threats you are not aware of when starting this salvage mission.

## Your team

You have 3 members of your crew you can pick from to send into action, each with different advantages and drawbacks:

- The Commando is a rugged space marine that has a lot of experience in space combat. They have more Attack Points than their fellow crewmates and starts with a few bombs / a gun. 
- The Engineer is a skilled spaceship mechanic that can fix anything. They have more available Action Points and have a torch to open locked doors.
- The Doc has lots of medical training that helps them endure the dangers of space. Doc has more Health Points and starts with a MedPack that allows them to heal from the start.

## The Environment

The layout of the environment is ever changing but there are a few different types of rooms that build it. You will be going through different ship decks with rooms consisting of:

- Airlock is a room with not much inside. It has one exit, this is where you start.
- Empty rooms don't have anything inside them, you can pass through them.
    - Corridor, an empty room with a special description, and more exits
- Item rooms have items that can help you on your mission.
    - Secret rooms are only accessible with a key or a special tool. They have better items inside.
- Puzzle rooms require you to solve a problem to pass through them.
    - Riddle rooms, to be able to pass through you need to answer a question correctly.
    - Casino rooms, these rooms offer the possibility to play a luck based game for a chance to pass through and an item. 
- Combat rooms may or may not have an enemy? (they do)
    - The Reactor room contains the item you so desperately need but may have a deadly threat guarding it.

Per each level of the ship, there should be one airlock, a combat room, one puzzle room, one secret room, two item rooms, and a few empty rooms. The airlock being the beginnig of the level, while the combat room is the last, which means to access the next level the player needs to beat the enemies in the combat room. In total there are three ship decks, the last one containing the reactor room instead of a normal combat room. 
A room which has been explored to its fullest will become a "cleared" empty room, which allows the player to come back to it to explore another path or when running from enemies. 

## Items

### Starting items

Depending on which character the player chooses, their starting items will be different.

Every character also starts with two detector items : 
- Metal Detector, shows the player where nearby items are located.
- Heat Detector, shows the player where nearby enemies are located.
The detector items output a description of the path the player needs to navigate to reach what they are searching for. 

### Colletible items

There are two types of items as it is a roguelike. Some items are just collectibles you find along your journey that are lost if you die in your adventure. Don't worry though! Other items are permanent and will give you a bonus for your future runs.
Along collectibles you will find:
- One time use items: 
    - Keys, let you open secret rooms' locked doors.
    - Bombs, deal a massive damage on your enemies.
    - MedPack, regen your life.
    - Energy drink, regen your action points.
- Items with an effect for the entirety of a single run: 
    - Guns, give you an attack boost to SLAY your enemies during combat.
    - Armors, give you bonus health points.
    - Brain Chips, increase your action points.

For these types of items there will be a three-tier system. With each tier these items will be better but also harder to find. For example, a tier I gun is likely to appear anywhere in the three levels of the ship, but a tier III gun is reserved for the last level. 

For the permanent upgrades, you will find ship parts in your adventure hidden in the labyrinthic rooms. These parts will be added to your main ship and will give you various permanent buffs to your starting stats for every run you start from then on: 
- Radition shield, augments the player's starting health points
- Hyperdrive, augments the player's starting action points
- Cyclotron Ballista, augments the player's starting attack points 

## Interactions

The main commad of the game is move. The player is able to see the available exits/entries of the romm they are in, and decide where to move through by inputing its direction. If the player encounters a door to a secret room, a key item must be used to open. During the navigation of the ship the player may also use other items to regen their health or actions points. 

## Mini games and Battles

Combat consists of one or more enemies in the last room before entering another level of the ship. Each enemy will deal a fixed amount of damage and have a fixed amount of health points. When defeated enemies will drop collectibles depending on their difficulty. 
During combat the system will present 3 commands, ACTION, ITEM, RUN. ACTION will let you attack, using your standard punch or a special attack given by weapons you found. ITEM lets you use the collectibles you have, bombs will deal damage, energy drinks and medpack will regen your stats. RUN will let you go back to the last room you were in before combat.
Mini-games are simple riddles, the game will ask a question that you will have to answer correctly in order to pass. Also, the puzzle room will sometimes be a casino room, letting you play games of luck to win prizes.
For the puzzle rooms, the player will have the option to input an answer to the riddle / game or to walkout to the last room. 

## Point system

Three main stats :

- Health points, when 0 you die.
- Action points, needed to use your action during combat (items don't need action points).
- Attack points, stat that will determine the damage of the weapon you use.
