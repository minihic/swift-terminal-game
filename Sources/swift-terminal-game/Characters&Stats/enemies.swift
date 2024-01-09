class Enemies {
    // Enemies need a name, stats and an attackline describing the way they attack.
    var name : String 
    var enemystats : Stats
    var attackline : String = ""

    init(name : String, enemystats : Stats) {
        self.name = name 
        self.enemystats = enemystats
    }

   
    /// Function calculating the damage of an enemy attack and taking it from the player's HP
   func enemyattack(player : Character){
    let damage = Int.random(in:((enemystats.attackPoints)-5)...(enemystats.attackPoints)+5)
    player.stats.reduceHealthPoints(damage: damage, enemyName: self.name)
    }
}

