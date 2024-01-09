class Stats {
    // A Stats system is a set of integers values representing Health Points, Action Points and Attack Points. 
    var healthPoints: Int
    var maxHealthPoints: Int //The maxHealthPoints are necessary so the player can't heal past it, it can only increase with a buff (armor)
    var actionPoints: Int
    var maxActionPoints : Int //The maxActionPoints are necessary so the player can't gain more than it, it can only increase with a buff (brainchip)
    var attackPoints: Int
    
    init(maxHealthPoints: Int, maxActionPoints: Int, attackPoints: Int) {
        self.healthPoints = maxHealthPoints
        self.maxHealthPoints =  maxHealthPoints
        self.actionPoints = maxActionPoints
        self.maxActionPoints = maxActionPoints
        self.attackPoints = attackPoints
    }
    
    /// Function to reduce the health points because of an enemy attack
    func reduceHealthPoints (damage: Int, enemyName: String){
        healthPoints = max(0, healthPoints - damage)
        print("\(enemyName) has attacked you! You have lost \(damage) HP. You currently have \(healthPoints) HP.")
        
        if healthPoints == 0 {
            print("You have died...")
        }
    }

    /// Function to augment the health with a MedPack 
    func usingMedPack(amount : Int) {
        //check inventory for medPack (?)
        healthPoints = min(maxHealthPoints, healthPoints + amount)
        print("You've used a MedPack. You have gained 40 HP.")
    }

    /// Function to increase the maximum health points with armor
    func increaseMaxHealthPoints(buff: Int) {
        maxHealthPoints += buff
    }
    
    /// Function to reduce action points by an action in combat
    func reduceActionPoints(cost: Int) {
        actionPoints = max(0, actionPoints - cost)
    }

    /// Function to increase the action points with energy drinks
    func usingEnergyDrink (amount : Int) {
        //check inventory for EnergyDrink (?)
        actionPoints = min(maxActionPoints, actionPoints + amount)
        print("You've used your Energy drink. You have gained 10 AcP.")
    }
    
    /// Function to increase the maximum action points with brain chips
    func increaseMaxActionPoints(buff: Int) {
        maxActionPoints += buff
    }

    /// Function to increase attack points with gun 
    func increaseAttackPoints(value: Int) {
        attackPoints += value
    }

    /// Function to reset all stats for a new run 
    func resetStats() {
        healthPoints = maxHealthPoints
        actionPoints = maxActionPoints
    }

}
