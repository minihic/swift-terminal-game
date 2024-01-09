class run{

    //Each runs needs to have different characters and different inventory
    var playersInventory: inventory
    var playersCharacter: Character = Character.baseCharacter()

    var finished = false
    var combatFinished = false
    var turnFinished = false
    var combatStart = false
    var back = false
    var currentlevel: Level
    var currentEnemies: [Enemies] = []
    var currentDifficulty = 1
    var levelFinished = false


    init(){

        let pistol1 = weapon(name:"HandGun")
        pistol1.attack = 15
        pistol1.needenergy = 5

        self.currentlevel = Level(difficulty: 1)

        self.playersInventory = inventory()
        self.playersInventory.backpack = collectiblesInit()
        self.playersInventory.holster.append(pistol1)

    }

    ///gives the starting item based on the character selected
    func startObject(){
        switch playersCharacter.name {
        case "The Engineer":
            playersInventory.backpack[3].count += 1
        
        case "The Commando":
            playersInventory.backpack[1].count += 3
        
        case "The Doc":
            playersInventory.backpack[2].count += 1
            
        default: break
        }
    }
    ///will show the ennemies correctly formated
    func printEnemies(){
        var y = 0
        for monsters in currentEnemies{
            y+=1
            print("[\(y)] ",monsters.name," : ", monsters.enemystats.healthPoints, "/", monsters.enemystats.maxHealthPoints)
        }
    }
    ///Will initialize a new map, new ennemies and new difficulty for the next level
    func nextLevel(game: Game){
        print("\n\nYou have successfully cleared the deck \(currentDifficulty). \nYou now move on to the next floor, it might be harder to progress, but you are filled with courage.")
        self.currentDifficulty += 1
        self.currentlevel = Level.init(difficulty: self.currentDifficulty)
        game.currentRun.levelFinished = false        
    }

   
}