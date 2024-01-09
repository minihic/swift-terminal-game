class Level{
    //Every run has 3 different levels, for each level the difficulty is increased. 
    var difficulty : Int
    var lvlenemies : [Enemies] = []
    var lvlboss : [Enemies] = []
    var mapString : String = ""
    var attackDamage = 0
    var selectedMonster = 0

    var searchItem = false

    /// References to all rooms
    var rooms: [Room]
    
    
    let row: Int = 10
    let column: Int = 10 
    var map: [[Int]]
    var currentMap: Map = Map()
     
    init(difficulty: Int){
        self.map = Map.createMap(row: row, column: column)
        self.rooms = Map.linkMap(map: map, row: row, column: column)
        self.difficulty = difficulty
        self.lvlenemies = initLvlDiffEnemies(difficulty: self.difficulty)
        self.lvlboss = initBoss()
    }

    ///Enemies of lvl 1
    func initEnemiesLvl1()-> [Enemies] {
        let xeron : Enemies = Enemies(name : "Xeron", enemystats : Stats(maxHealthPoints:50, maxActionPoints:0, attackPoints:10))
        xeron.attackline = "The Xeron uses its sharp claws to attack you."

        let zorid : Enemies = Enemies(name: "Zorid", enemystats: Stats(maxHealthPoints:70, maxActionPoints:0, attackPoints:10))
        zorid.attackline = "The Zorid uses its strong jaw and shar teeth to bite you."

        let gorgon : Enemies = Enemies(name: "Gorgon", enemystats: Stats(maxHealthPoints:40 , maxActionPoints:0 , attackPoints:15))
        gorgon.attackline = "The Gorgon uses its talons and beak to strike you."

        let krall : Enemies = Enemies(name: "Krall", enemystats:Stats(maxHealthPoints: 25, maxActionPoints:0 , attackPoints:25))
        krall.attackline = "The Krall uses its multiple arms to choke you."

        let enemieslvl1: [Enemies] = [xeron, zorid, gorgon, krall] 

        return enemieslvl1 
    }

    ///Enemies of lvl 2
    func initEnemiesLvl2() -> [Enemies]{

        let arachnix : Enemies = Enemies(name : "Arachnix", enemystats : Stats(maxHealthPoints:100, maxActionPoints:0, attackPoints:20))
        arachnix.attackline = "The Arachnix sprays its venom on you."        

        let velnar : Enemies = Enemies(name: "Velnar", enemystats: Stats(maxHealthPoints:90, maxActionPoints:0, attackPoints:25))
        velnar.attackline = "The Velnar shots its poisonous spikes at you."

        let zarn : Enemies = Enemies(name: "Zarn", enemystats:Stats(maxHealthPoints:120, maxActionPoints:0 , attackPoints:15))
        zarn.attackline = "The Zarn creates a high-voltage current and shocks you."

        let grax : Enemies = Enemies(name: "G'rax", enemystats: Stats(maxHealthPoints:50, maxActionPoints:0, attackPoints:20))
        grax.attackline = "The G'rax jumps above you and smashes you."

        let enemieslvl2 : [Enemies] = [arachnix, velnar, zarn, grax]

        return enemieslvl2
    }

    ///Enemies of lvl 3
    func initEnemiesLvl3() -> [Enemies]{

        let valtorian : Enemies = Enemies(name : "Valtorian", enemystats: Stats(maxHealthPoints:120, maxActionPoints:0, attackPoints:50))
        valtorian.attackline = "The Valtorian uses its daggers to slash you."

        let krillian : Enemies = Enemies(name:"Krillian", enemystats : Stats(maxHealthPoints:150, maxActionPoints:0, attackPoints:30))
        krillian.attackline = "The Krillian uses its laser guns to shoot you."

        let xandarian : Enemies = Enemies(name: "Xandarian", enemystats: Stats(maxHealthPoints:160, maxActionPoints:0, attackPoints:25))
        xandarian.attackline = "The Xandarian creates a powerful plasma blast to attack you."

        let xindi : Enemies = Enemies(name: "Xindi", enemystats: Stats(maxHealthPoints:130, maxActionPoints:0, attackPoints:40))
        xindi.attackline = "The Xindi uses its tools to attack you."

        let enemieslvl3 : [Enemies] = [valtorian, krillian, xandarian, xindi]

        return enemieslvl3
    }
    ///Bosses
    func initBoss() -> [Enemies]{
        let hivequeen : Enemies = Enemies(name: "Hive Queen", enemystats:Stats(maxHealthPoints:250, maxActionPoints:0, attackPoints:45))
        hivequeen.attackline = "The Hive Queen calls on its swarm. The swarm charge and use their poisonous stingers."

        let alpha : Enemies = Enemies(name: "Alpha", enemystats:Stats(maxHealthPoints:250, maxActionPoints:0, attackPoints:45))
        alpha.attackline = "The Alpha uses its hypnosis powers. You hit yourself. Why did you do that?"

        let warlord : Enemies = Enemies(name: "Warlord", enemystats:Stats(maxHealthPoints:250, maxActionPoints:0, attackPoints:45))
        warlord.attackline = "The Warlord enters a frenzy state. It becomes huge and its multiple arms swell. It punches you with its super-strength."

        let hihgpriest : Enemies = Enemies(name: "High Priest", enemystats:Stats(maxHealthPoints:250, maxActionPoints:0, attackPoints:45))
        hihgpriest.attackline = "The High Priest creates a ring of fire around you. It shoots fireballs at you, scorching your skin."
        
        let bosses : [Enemies] = [hivequeen, alpha, warlord, hihgpriest]

        return bosses
   } 

    ///Returns the correct monsters for the correct difficulty
    func initLvlDiffEnemies (difficulty:Int) -> [Enemies]{
        
        switch difficulty {
        case 1:
            return initEnemiesLvl1()

        case 2: 
            return initEnemiesLvl2()

        case 3: 
            return initEnemiesLvl3()
        default: 
            return initBoss()
            
        }
        
    }

    func itemInRoom(item: items, game:Game){
        game.controller.register(keyword: "search", command: searchCommand())
    }

    

}