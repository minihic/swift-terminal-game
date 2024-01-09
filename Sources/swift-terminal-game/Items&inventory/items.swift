///Items class, an item is a pickable class that will give the player a bonus when picked up
class items {    
    var name: String
    var count = 0
    var healthBonus = 0
    var energyBonus = 0
    var attack = 0
    init(name: String){
        self.name = name
    }
    func itemget(name: String){
        print("You got a \(name)")
    }
    func itemuse(){
        print("You used \(name)")
    }
    var keepable:Bool {get { return false}}
}

///collectibles are small items that fits in the backpack, they are singular use and have various use 
class collectibles: items {
    func useCollectibles(currentRun: run){
        if self.count == 0 {
            print("You are out of \(name)")    
        }else{
            print("You used 1 \(name)")
        switch self.name {
            case "energydrink":
                currentRun.playersCharacter.stats.usingEnergyDrink(amount: self.energyBonus)
                self.count -= 1
            case "medPack":
                currentRun.playersCharacter.stats.usingMedPack(amount: self.healthBonus)
            default: print("This item doesn't do much here")
            }
        }
    }
    override func itemget(name: String) {
        self.count += 1
        print("You found a \(name)")
        
    }
}

///ship Upgrades are the permanent upgrades of the game, findable only in secret box in corridors
class shipUpgrades: items {
   override var keepable:Bool {get {return true}}
}

///equipements are bonus that will stay one during the run but when the player dies, they
class equipment: items{
    //wait for base character stat to upgrade them
    func equipementGet(name: String, currentRun: run){}

}

///weapons are action used in combat, they require a certain amout of energy
class weapon: items{
    var needenergy = 0
}