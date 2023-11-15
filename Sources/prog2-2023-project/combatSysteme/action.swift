///use gun1 and use gun2 or 3 or 4 to make damage to the enemies
class useAction: Command{

    init(){}
        
    func run(game: Game, arguments: [String]) {

        print("Choose your weapon wisely")
        game.currentRun.playersInventory.showHolster()
        print("Your Choice >")
        var gun: Int = 0
        var goodchoice1 = false
        while !goodchoice1{
            switch readLine() {
            case "1":
                gun = 0
                goodchoice1 = true

            case "2":
                gun = 1
                goodchoice1 = true

            case "3":
                if game.currentRun.playersInventory.holsterMaximum == 3{
                    gun = 2
                    goodchoice1 = true
                }else{print("Please enter a valid choice")
                }
            
            case "4":
                if game.currentRun.playersInventory.holsterMaximum == 4{
                    gun = 3
                    goodchoice1 = true
                }else{print("Please enter a valid choice")
                }
                
            default: print("Please enter a valid choice")
            
                
            }
        }
        
        game.currentRun.currentlevel.attackDamage = game.currentRun.playersCharacter.stats.attackPoints + game.currentRun.playersInventory.holster[gun].attack
        
        var goodchoice2 = false
        var enemyChoice = 0
        print("\nNow, choose an ennemie to attack >", terminator: "")
        while !goodchoice2{
            switch readLine() {
            case "1":
                enemyChoice = 0
                goodchoice2 = true

            case "2":
                enemyChoice = 1
                goodchoice2 = true
                

            case "3":
                enemyChoice = 2
                goodchoice2 = true
                
            case "4":
                enemyChoice = 3
                goodchoice2 = true

            case "5":
                if (game as! MyGame).currentRun.currentEnemies.count == 5{
                    enemyChoice = 4
                    goodchoice2 = true
                }else{
                    print("Please enter a valid choice")
                }
                
            default: print("Please enter a valid choice")    
            }
        }
        game.currentRun.currentlevel.selectedMonster = enemyChoice

        if game.currentRun.playersCharacter.stats.actionPoints < game.currentRun.playersInventory.holster[gun].needenergy{
            game.currentRun.currentlevel.attackDamage = game.currentRun.playersCharacter.stats.attackPoints
            print("\nYou try to attack your enemy but, without enough action point, you deal only your base damage\n")
        }else{
            print("\nYou deal a solid \(game.currentRun.currentlevel.attackDamage)Dmg\n")
            game.currentRun.playersCharacter.stats.actionPoints -= game.currentRun.playersInventory.holster[gun].needenergy
        }

        if (goodchoice1 == true && goodchoice2 == true){
            game.currentRun.currentEnemies[game.currentRun.currentlevel.selectedMonster].enemystats.healthPoints -= game.currentRun.currentlevel.attackDamage
            print("You attack \(game.currentRun.currentEnemies[game.currentRun.currentlevel.selectedMonster].name), touching him with \(game.currentRun.currentlevel.attackDamage)Dmg\n")
        }

        game.currentRun.turnFinished = true
    }
}