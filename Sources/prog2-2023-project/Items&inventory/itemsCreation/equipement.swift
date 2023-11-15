    //for the equipment, we create subclass of equipment, overriding the get fuinction each time, to have a different effect for each equipment 
    class pocket: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersInventory.holsterMaximum = 3
            print("You found a pocket, you can now hold one more weapon! ")
        }
    }

    class quanticpocket: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersInventory.holsterMaximum = 4
            print("you found a strange pocket that seems larger inside than outside, you can now hold up to four weapons!")
            
        }
    }

    class metalPlate: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: 10)
            currentRun.playersCharacter.stats.healthPoints += 10
            print("You pick up a suitable metal plate for your armor, you gain +10 HP")
        }
    }

    class beskarArmor: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: 20)
            currentRun.playersCharacter.stats.healthPoints += 20
            print("You pick up a shiny piece of armor making you feel very resistant. +20 HP") 
        }
    }

    class superKevlar: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: 30)
            currentRun.playersCharacter.stats.healthPoints += 30
            print("Wow ! You pick up a extremely rare piece of superKevlar. You gain a significant +30 HP")
        }
    }
    
    class adrenalineShot: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 5)
            currentRun.playersCharacter.stats.actionPoints += 5
            print("You pick up an unused adrenaline shot. +5 AcP")
        }
    }

    class fastDrower: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 10)
            currentRun.playersCharacter.stats.actionPoints += 10
            print("Shoot faster ! +10 AcP")
        }
    }

    class brainChip: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 15)
            currentRun.playersCharacter.stats.actionPoints += 15
            print("Big brain time! +15 AcP")
        }
    }

    class marshmallow: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 5)
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: 5)
            currentRun.playersCharacter.stats.actionPoints += 5
            currentRun.playersCharacter.stats.healthPoints += 5
            print("Strangely, feeling the weight of the whole universe makes you feel good. +5 HP & AcP")
        }
    }

    class Tshirt: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: -10)
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 30)
            
            print("This might not be the best thing to wear in space, but its leighter than an armor. -10 HP & +30 A P")
        }
    }

    class infraredHelmet: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 10)
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: 5)
            print("A high tech helmet letting you engage combat with more strategy. +10 AcP & +5 HP")
        }
    }

    class quanticPlate: equipment{
        override func equipementGet(name: String, currentRun: run) {
            let x = Int.random(in: -10..<10)
            let y = Int.random(in: -10..<10)
            currentRun.playersCharacter.stats.increaseMaxHealthPoints(buff: x)
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: y)
            print("It seems very unstable and you are not sure wether it is worth it or not. +??HP & +??AP")
        }
    }

    class wolfAmulet: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseAttackPoints(value: 5)
            currentRun.playersCharacter.stats.increaseMaxActionPoints(buff: 5)
            print("This mysterious amulet fills you with determination. +5Dmg & +5AcP")
        }
    }

    class j0j: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.healthPoints *= 2
            print("The J-0J Module is an extremely powerfull device, creating a shield arround you. 2xHP")
        }
    }

    class minihic: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.maxActionPoints += 50
            print("This H1C device seems smaller than usual, making it perfect to plug onto any gun. +50AcP")            
        }
    }

    class hboost: equipment{
        override func equipementGet(name: String, currentRun: run) {
            currentRun.playersCharacter.stats.increaseAttackPoints(value: 30)
            print("You found a brand new H-Boost gauntlet, an vey limited edition of the well know GunBooster. +30Dmg")
            
        }
    }