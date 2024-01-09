/**
 Concrete implementation of the `Game` protocol.
 
 The user can currently only use the commands `help`, `go` and `stop`, whose respective implementations are given in the framework.
 */
class MyGame:Game {
    
    /// A reference to a `Controller` instance
    lazy var controller = Controller(game: self)
    
    /// A reference to a `Parser` instance
    lazy var parser = Parser(controller: self.controller)
    
    /// The flag defined in the `Game` protocol
    var finished = false
    
    /// The current location of the user in the game map
    var currentRoom:Room

    /// The current run of the player
    var currentRun: run = run()

    /// An array for the permanents upgrades of the game
    var ship: [shipUpgrades] = []
    
    /// This initializer sets the room collection, the current room and adds commands to the parser.
    init() {
        self.currentRoom = self.currentRun.currentlevel.rooms.first!
        self.addCommands()
    }

    
    /// Adds commands mapped to their respective keywords to the controller.
    private func addCommands() {
        self.controller.register(keyword: "help", command: HelpCommand())
        self.controller.register(keyword: "stop", command: StopCommand())
        self.controller.register(keyword: "go", command: GoCommand())
        self.controller.register(keyword: "inventory", command: showInventory())
        self.controller.register(keyword: "stats", command: showStats())
        self.controller.register(keyword: "map", command:showMap())

        // self.controller.register(keyword: "damage", command: takeDamageCommand())
        // self.controller.register(keyword: "giveMed", command: giveMedpackCommand())
    }
    /// Function printing explanations for the player. 
    private func tutorial(){
        print("Welcome to this adventure game! A rogue-like text-based space adventure.\n")
        print("Here are a few rules before we get started.\n")
        //Small brief on how to play the game
        print("\nThis game is a Rogue-Lite advendure, you will proceed in 3 sets of rooms,\neach time you win the fight the monsters of your level you can pass to the next one.")
        print("Dont worry, dying is part of the process ;). Take your time to explore and find upgrades to your character and your ship !\nGood Luck !")
    }

    /// Function used to print the setting of the adventure
    private func setting() {
        // Presentation of the ship
        
        print("\nThe small scout ship had been traveling through space for what felt like an eternity. The ship's crew had been on a routine mission to explore a distant star system.")
        print("The Nova Explorer was its name, your standard exploration ship, with a crew of four. \n")

        // Presentation of the crew
        print("There is The Captain in his designated seat, controlling the navigation of the ship.")
        print("In the infirmary, there is The Doc, simply organizing their workplace.")
        print("In the weapons room, polishing a gun, is The Commando.")
        print("Lastly, probably tinkering with something in the ship there is The Engineer. \n")
        // Disaster struck
        print("The voyage was going well when suddenly disaster struck. A reactor core is malfunctioning.")
        print("The Captain quickly shut down the ship avoiding an explosion of the reactor, the rest of the crew hurried to the command room.")
        print("There, The Engineer realizes that they had no way to fix the reactor. They are now stranded and in dire need of repairs. \n")
        // The Plan 
        print("So, the crew is forced to turn to a desperate plan: explore a eabry ship cemetery to find the necessary components to fix their own ship.")
        print("It's a risky mission, but one they have no choice but to undertake if they want any chance of making it back home.")
        // An abandoned ship
        print("Thus, using the backup propulsers the crew approches an abandoned ship.")
        print("This ship had been lost in space for years, and no one knew what had happened to its crew.")
        print("It's a haunting reminder of the dangers that lurk in the vast expanse of space.")
        print("And so they had to move and do it quickly, the Captain ordered that a single crew member left the Nova to explore this abandoned ship.")
        print("But which one of them is the best choice?")
        print("That's up to you, the player. Choose your character! ")
        // Call Function createCharacter letting the player choose.
    }
    
    /// Function used to relay the mission to the player
    private func intro(){
        // Dialogue with the Captain
        print("\nBefore you leave the ship, \(currentRun.playersCharacter.name), the Captain has a few words for you concerning your mission and your objective.\n")
        print("Cap: Alright, I need you to head over to the abandoned ship and assess the situation.")
        print("The reactor core on our scout ship is broken and we need to find the components to fix it.")
        print("We're counting on you to find it, and bring them back to us as soon as possible. \n")
        print("You: Understood, Captain.\n")
        print("Cap: Good. But I need to emphasize that we're dealing with unknown dangers out there.")
        print("We don't know what we might come across, so stay sharp. Do not take any unnecessary risks.\n")
        print("You: I understand, Captain.\n")
        print("Cap: Great. So don't take any shortcuts.")
        print("Make sure you thoroughly explore and access each situation.")
        print("We have no idea where the reactor of this ship might be and we can't afford any mistakes.\n")
        print("You: Aye Captain.\n")
        print("Cap: Good luck. We're all counting on you.\n")
        // Description of the player's preparation
        print("You prepare yourself for the journey to the abandoned ship, taking the necessary tools and equipment.")
        print("As you step into the airlock to leave, you can feel the weight of the mission on your shoulders. You know that the success of the crew's survival depends on you.")
        print("Your suit hisses as the air is pumped out of the airlock, and the door slides open to reveal the vast emptiness of space.")
        print("You use your thrusters to propel yourself towards the abandoned ship.\n")
        //Description of the player's arrival on the abandoned ship
        print("As you navigate through the debris field, you keep scanning the surroundings for any potential threats. Nothing.")
        print("As you approach the airlock of the abandoned ship, you can't help but feel a sense of unease. Its door is partially open, creaking ominously in the cold, still air.")
        print("Getting closer, you notice the warning signs on the door, faded and barely legible.")
        print("You can't read this language, but the symbols and faded reds are a clear indication that this airlock is not to be taken lightly.")
        print("Looking through the open door, you can see that the interior of the airlock is shrouded in darkness.")
        print("The only light comes from the faint glow of emergency lights, casting eerie shadows on the walls.\n")
        print("You prepare to land on the damaged hull. The landing's rough but you manage.")
        print("The musty scent of old metal and stagnant air fills your nose as you step inside.\n")

        //available commands:
        print("Use [go] to move in the direction you want, [inventory] to show your gear, [stats] for your stats, and [map] for the map.\nThe game has more commands depending on the room you are in, use [help] to see all available commands")
        
        
        
        
    }
    /// Concluding the current run and passing onto another
    private func runOutro(){
        print("\nYou WON! The ship can now be repared and your journey will continue ! ")
    }

    /// Concluding the story.
    private func outro() {
        print("\nThanks for playing! Bye!")
    }

    ///creates a new instance of a run
    private func newRun(){
        self.currentRun = run()
    }
    ///to puick up a Ship Upgrade
    func getShipUpgrade(upgrade: shipUpgrades){
        ship.append(upgrade)
        currentRun.playersCharacter.stats.attackPoints += upgrade.attack
        currentRun.playersCharacter.stats.maxActionPoints += upgrade.energyBonus
        currentRun.playersCharacter.stats.maxHealthPoints += upgrade.healthBonus
    }
    ///will increase the stats of the plays depending of the upgrade found in the runs
    func applyShipUpgrades(){
        for upgrades in ship{
            currentRun.playersCharacter.stats.attackPoints += upgrades.attack
            currentRun.playersCharacter.stats.maxActionPoints += upgrades.energyBonus
            currentRun.playersCharacter.stats.maxHealthPoints += upgrades.healthBonus
        }
    }
    
    /// Main game loop.
    func play() {
        
        print("\u{001B}[2J")
        tutorial()
        setting()
        
        while !self.finished {
            
            //run starts
            newRun()
            self.currentRun.playersCharacter = self.currentRun.playersCharacter.createCharacter()
            intro()
            applyShipUpgrades()
            self.currentRun.startObject()
             
            
            while !self.currentRun.finished{

                print(currentRoom)
                       
                do {
                    try parser.readCommand()
                } catch ParserError.noInputGiven {
                    print("No input given")
                } catch CommandError.commandNotFound(let keyword) {
                    print("No command found for keyword '\(keyword)'")
                } catch {
                    print("Unexpected error: \(error)")
                }
                
                if currentRun.levelFinished == true{
                    currentRun.nextLevel(game: self)
                }
                
                if currentRun.combatStart == true{
                    combatStart()
                }

                

            }

            //run finished and restart

        }
        
        outro()
    }
    
}

// create and run the game
let g = MyGame()
g.play()
