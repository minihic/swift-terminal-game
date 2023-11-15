// Using key/bomb/energy/medpack
enum collectiblesEnum: String{

    case key, bomb, medpack, energydrink
}


///important command to create the possiblity to use an item during combat
class useItemCommand:Command{

    init(){}

     func run(game: Game, arguments: [String]) {
        print("To use an item enter its name (bomb, medpack, energydrink\n)")
        game.controller.register(keyword: "medpack", command: medpackCommand())
        game.controller.register(keyword: "energydrink", command: energyCommand())
        game.controller.register(keyword: "bomb", command: bombCommand())
        game.controller.deregister(keyword: "item")
        game.controller.deregister(keyword: "action")
        game.controller.deregister(keyword: "flee")
        game.currentRun.playersInventory.showBackpack()
        print("To close inventory enter back\n")
        game.controller.register(keyword: "back", command: backFromItemCommand())
    }
}

class backFromItemCommand: Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        game.controller.deregister(keyword: "medpack")
        game.controller.register(keyword: "item", command: useItemCommand())
        game.controller.deregister(keyword: "energydrink")
        game.controller.deregister(keyword: "bomb")
        game.controller.register(keyword: "action", command: useAction())
        game.controller.register(keyword: "flee", command: fleeCommand())
        game.controller.deregister(keyword: "back")
    }
}

class medpackCommand:Command{

    init(){}

    func run(game: Game, arguments: [String]) {

        if game.currentRun.playersInventory.backpack[2].count == 0{
            print("You dont have any Medpack !")
        }else{
            game.currentRun.playersCharacter.stats.usingMedPack(amount: 40)
            game.currentRun.playersInventory.backpack[2].count -= 1
            game.currentRun.turnFinished = true
        }   
    }
}

class energyCommand:Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        if game.currentRun.playersInventory.backpack[2].count == 0{
            print("You dont have any EnergyDrinks !")
        }else{
            game.currentRun.playersCharacter.stats.usingEnergyDrink(amount: 10)
            game.currentRun.playersInventory.backpack[3].count -= 1
            game.currentRun.turnFinished = true
        }
    }
}

class bombCommand:Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        if game.currentRun.playersInventory.backpack[1].count == 0{
            print("You dont have any Bomb !")
        }else{
            for monsters in game.currentRun.currentEnemies{
                monsters.enemystats.healthPoints -= 20
            }
            print("Pshhhhhhhhhhhhhh.... BOOOOM, you dealt 20dmg to all ennemies in the room !")
            game.currentRun.playersInventory.backpack[1].count -= 1
            game.currentRun.turnFinished = true
        }
    }
}

class takeDamageCommand: Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        game.currentRun.playersCharacter.stats.reduceHealthPoints(damage: 50, enemyName: "Yourself")
    }
}

class giveMedpackCommand: Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        game.currentRun.playersInventory.backpack[2].count += 1
    }
}