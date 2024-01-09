///the character class, with its stat and everything needed to 
class Character {
    // The Character needs a name to define its type, and a set of stats to interact with enemies and items.
    var name: String 
    var stats: Stats

    init(name: String,stats: Stats){
        self.name = name
        self.stats = stats
    }

    func printStats() {
        print("\nName:", name)
        print("Health Points: \(stats.healthPoints)/\(stats.maxHealthPoints)")
        print("Action Points: \(stats.actionPoints)")
        print("Attack Points: \(stats.attackPoints)\n")
    }

    /// Function to choose the player's character type.
    func createCharacter() -> Character {
        print("\nChoose a character type:\n")
        print("[1] The Commando: A rugged space marine with years of experience in space combat.\nThe Commando is tough and fearless, and their expertise in combat makes them an invaluable asset to the crew.")
        print("The Commando has more Attack Points than their fellow crewmates and starts with a few bombs / a gun.")
        print("\n[2] The Engineer: A skilled spaceship mechanic who is able to fix anything.\nThe Engineer is resourceful and knowledgeable, and their expertise in repairing and maintaining the ship is essential to the success of the mission.")
        print("They have more available Action Points and have a torch to open locked doors.")
        print("\n[3] The Doc: A medical professional with extensive training and experience in dealing with the dangers of space.\nThe Doc is knowledgeable about the various physical and mental challenges that can arise from long-term space travel.")
        print("Doc has more Health Points and starts with a MedPack that allows them to heal at any moment.\n")

        
      
        var goodchoice = false
        while goodchoice == false{

            print("Your choice >", terminator: " ")
        
            switch readLine() {
            case "2":
                goodchoice = true
                return Character(name: "The Engineer",  stats: Stats(maxHealthPoints: 100, maxActionPoints: 60, attackPoints: 35))
            case "1":
                goodchoice = true
                return Character(name: "The Commando", stats: Stats(maxHealthPoints: 100, maxActionPoints: 45, attackPoints: 45))
            case "3":
                goodchoice = true
                return Character(name: "The Doc", stats: Stats(maxHealthPoints: 120, maxActionPoints: 45, attackPoints: 45))
            default:
                print("Please enter a valid choice")
                
            }
        }    
    }   

    static func baseCharacter() -> Character{
        return Character(name: "base", stats: Stats(maxHealthPoints: 1, maxActionPoints: 1, attackPoints: 1))
    }
}
