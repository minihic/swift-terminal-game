///command to flee during combat
class fleeCommand: Command{

    init(){}

    func run(game: Game, arguments: [String]) {
        game.currentRun.playersCharacter.stats.healthPoints -= Int.random(in: 1..<10)
        print("You run away from the alien. You're now in the previous room, unfortunatelly, you lost some HP.")
        game.currentRun.combatFinished = true
        game.currentRun.turnFinished = true
    }
}