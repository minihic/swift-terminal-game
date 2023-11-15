extension MyGame{
  ///the complet combatloop, from the begining of the combat to the end. Creating all the necessary command and deleting the obsolete ones.
  func combatStart(){
    print("You enter combat! \n Use your equipement wisely to deafeat your enemies!")
    
    if currentRun.currentDifficulty == 3{
      currentRun.currentEnemies.append(currentRun.currentlevel.initBoss().randomElement()!)
    }else{
    currentRun.currentEnemies = currentRun.currentlevel.lvlenemies
    }
  

    controller.deregister(keyword: "go")
    controller.deregister(keyword: "stop")
    controller.deregister(keyword: "inventory")
    controller.deregister(keyword: "stats")
    controller.register(keyword: "item", command: useItemCommand())
    controller.register(keyword: "action", command: useAction())
    controller.register(keyword: "flee", command: fleeCommand())
    controller.register(keyword: "wait", command: waitCommand())
      
    while !currentRun.combatFinished{

      currentRun.playersCharacter.printStats()
      currentRun.printEnemies()
      
      //players turn, return turnfinished true when an action is completed
      while !currentRun.turnFinished{
        currentRun.currentlevel.attackDamage = 0

        do {
          try parser.readCommand()
        } catch ParserError.noInputGiven {
          print("No input given")
        } catch CommandError.commandNotFound(let keyword) {
          print("No command found for keyword '\(keyword)'")
        } catch {
          print("Unexpected error: \(error)")
        }
        
      }
        //now the turn of the monsters
        var y = 0
        for monsters in currentRun.currentEnemies{
          //first, remove the monsters wich are dead
          if monsters.enemystats.healthPoints <= 0{
            print("Nice! This \(monsters.name) is dead\n")
            currentRun.currentEnemies.remove(at: y)
          }else{
            //or, if they are still alive, they attack the player
          monsters.enemyattack(player: currentRun.playersCharacter)
          print(monsters.attackline)
          }
          y+=1
        }

        //at the end of each turn, the players gets a certain amout of Acp back
        currentRun.playersCharacter.stats.actionPoints += Int.random(in: 3...6)

        //checks if the combat is over
        if currentRun.playersCharacter.stats.healthPoints == 0{
          currentRun.finished = true
          currentRun.combatFinished = true
          currentRun.combatStart = false
          print("\n\nYou have died, the game is going to lauch a new run.\nYou have lost all your equipment but kept the ships")
          print("You can choose your character again and continue, if you stop the game, all your progression will be lost")
        }else{currentRun.turnFinished = false}

        if currentRun.currentEnemies.isEmpty{
          if currentRun.currentDifficulty == 3{
            print("\nThe boss falls, behind him, cast in a reactor frame, a functional Core.\nYou hasten to take it, you rush out of the ship wreck, making your way to your ship, happy to finaly go home...")
            self.finished = true
          }else{
            print("\nYou defeated all the monsters !\nThe room is now an empty corridor, with the corps of your previous ennemies")
            print("\nYou can move on to the next floor ! (Type [advance])\n")
            controller.register(keyword: "advance", command: exitLevel())
          }
          
          
          currentRun.combatFinished = true
          currentRun.combatStart = false
        }else{currentRun.turnFinished = false}


      
    }
    
    
    controller.deregister(keyword: "item")
    controller.deregister(keyword: "action")
    controller.deregister(keyword: "flee")
    controller.deregister(keyword: "wait")
    controller.register(keyword: "go", command: GoCommand())
    controller.register(keyword: "stop", command: StopCommand())
    

  }
}

class waitCommand:Command{

  init(){}

  func run(game: Game, arguments: [String]) {
    print("You choose to wait for the next turn, in order to gain more Acp !")
    game.currentRun.turnFinished = true
  }
}

class combatTest:Command{
  init(){}

  func run(game: Game, arguments: [String]) {
    (game as! MyGame).combatStart()
  }
}