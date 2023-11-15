/// DO NOT MODIFY!
/**
 The `Command` protocol is the basis for the interpretation of textual commands entered by the user.  The user can enter a command using the `Parser`, in the format `keyword arguments` where `keyword` is associated to a specific type of `Command` (see the `Controller` class), and arguments are optional strings that allow a command to execute a parametrized job.
 */
protocol Command {
    
    /**
     Defines the job to be executed by a command.
     
     - Parameters:
        - game: Reference to the game instance in which the command is run
        - arguments: Array of (`String`) arguments
     */
    func run(game:Game, arguments: [String])
}

/// Error type used in `Controller`
enum CommandError:Error {
    
    /// No command registered for the indicated `keyword`
    case commandNotFound(keyword:String)
}

/**
    The `Controller` holds a registry of keywords and associated commands.
 */
class Controller {
    
    /// A dictionary mapping keywords to associated commands
    private(set) var commands = [String:Command]()

    /// A reference to the game instance, need for running commands
    let game:Game

    /// Initializer
    init(game:Game) {
        self.game = game
    }
    
    /**
     Adds a mapping between the provided keyword and command.
     
     - Parameters:
        - keyword: The keyword which a user needs to enter to execute the command
        - command: The command to associate with
     */
    func register(keyword:String, command:Command) {
        self.commands[keyword] = command
    }
    
    /**
     Removes the command for the given keyword (if any).
     
     - Parameters:
        - keyword: The keyword whose associated command shall be removed
     */
    func deregister(keyword:String) {
        self.commands.removeValue(forKey: keyword)
    }
    
    /**
     Executes a command for the provided keyword, with the provided arguments.
     
     - Parameters:
        - keyword: The keyword entered by the user
        - arguments: The array of (`String`) arguments entered by the user
     
     - Throws: `CommandError.commandNotFound` if no command is registered for the provided keyword
     */
    func execute(command keyword:String, arguments: [String]) throws {
        if let command = self.commands[keyword] {
            command.run(game: self.game, arguments: arguments)
        } else {
            throw CommandError.commandNotFound(keyword: keyword)
        }
    }
    
}

// MARK: Concrete command implementations

/// This command prints all keywords known to a game's controller.
class HelpCommand:Command {

    /// Initializer
    init() {}
    
    func run(game: Game, arguments: [String]) {
        print("Available commands: \(game.controller.commands.keys.joined(separator: " "))")
    }
}

/// This command stops a game, based on its `finished` property (cf. `Game` protocol)
class StopCommand:Command {

    /// Initializer
    init() {}

    func run(game: Game, arguments: [String]) {
        game.finished = true
        game.currentRun.finished = true
    }
}

/// This command allows to change the `currentRoom` of a game instance, based on the currently available exits. As a single argument, the direction is expected (cf. `Direction` enum).
class GoCommand:Command {

    /// Initializer
    init() {}

    func run(game: Game, arguments: [String]) {
        // only allow a single argument
        guard arguments.count < 2 else {
            print("Could you please decide where to go?")
            return
        }
        
        // require an argument
        guard let combatString = arguments.first else {
            print("Please indicate a direction!")
            return
        }
        
        // retrieve the enum value for the given string
        guard let direction = Direction.init(rawValue: combatString) else {
            print("Unknown direction!")
            return
        }
        
        // retrieve the room in this direction (if any)
        guard let nextRoom = game.currentRoom.nextRoom(direction: direction) else {
            print("You cannot go \(direction) from here.")
            return
        }
        
        // set the game's current room
        game.currentRoom = nextRoom
        nextRoom.enterRoom(game: game, room: nextRoom)
            
    }
}

// class lauchCombat:Command{

//     init(){}

//     func run(game: Game, arguments: [String]) {
//         game.controller.deregister(keyword: "go")

//     }
// }


class showInventory:Command {
    
    init(){}
    
    func run(game: Game, arguments: [String]) {
        game.controller.register(keyword: "medpack", command: medpackCommand())
        game.controller.register(keyword: "energydrink", command: energyCommand())
        game.controller.register(keyword: "bomb", command: bombCommand())
        game.controller.register(keyword: "showgear", command: showGear())
        game.controller.register(keyword: "back", command: backCommand())
        game.controller.deregister(keyword: "inventory")
        game.controller.deregister(keyword: "go")
        game.currentRun.back = false

        game.currentRun.playersInventory.showInventory() 

        game.controller.deregister(keyword: "medpack")
        game.controller.deregister(keyword: "energydrink")
        game.controller.deregister(keyword: "bomb")
        game.controller.deregister(keyword: "showgear")
        game.controller.register(keyword: "inventory", command: showInventory())
        game.controller.register(keyword: "go", command: GoCommand())
        game.controller.deregister(keyword: "back")
        
    }
}

class backCommand:Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        game.currentRun.back = true

    }
}

class showStats:Command{

    init(){}

    func run(game: Game, arguments: [String]) {
    game.currentRun.playersCharacter.printStats()
    }
}

class showMap:Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        print("\nThe Map:")
        game.currentRun.currentlevel.currentMap.printMap(map: game.currentRun.currentlevel.map, row: game.currentRun.currentlevel.row, column: game.currentRun.currentlevel.column)
    }
}

class searchCommand:Command{
    init(){}

    func run(game: Game, arguments: [String]) {
        if (game.currentRoom as! SpecialRoom).itemTaken == false{
            (game.currentRoom as! SpecialRoom).event(game: game)
        }else{
            print("Nothing to Scatter arround here...")
        }
    }
}

class exitLevel:Command{
    init(){}

    func run(game: Game, arguments: [String]) {
     game.currentRun.levelFinished = true
    }
}
