extension Room{

    ///this function will permit the game to do any function based on the room type the player is in
    func enterRoom(game: Game, room: Room){
        game.controller.register(keyword: "search", command: searchCommand())
        switch room {

        case is Combat:
            game.controller.deregister(keyword: "search")
            game.currentRun.combatStart = true

        case is Airlock:
            game.controller.deregister(keyword: "search")

        case is Armory:
            print("\n\(getArmoryDescription())")
            game.controller.register(keyword: "search", command: searchCommand())
            if (room as! SpecialRoom).itemTaken == true{ 
                game.controller.deregister(keyword: "search")
            }

        case is Technical:
            print("\n\(getTechnicalDescription())")
            game.controller.register(keyword: "search", command: searchCommand())
            if (room as! SpecialRoom).itemTaken == true{ 
                game.controller.deregister(keyword: "search")
            }

        case is Storage:
            print("\n\(getStorageDescription())")
            game.controller.register(keyword: "search", command: searchCommand())
            if (room as! SpecialRoom).itemTaken == true{ 
                game.controller.deregister(keyword: "search")
            }

        case is Secret:
            print("\n\(getSecretDescription())")
            game.controller.register(keyword: "search", command: searchCommand())
            if (room as! SpecialRoom).itemTaken == true{ 
                game.controller.deregister(keyword: "search")
            }

        case is Quarters:
            print("\n\(getQuartersDescription())")
            game.controller.register(keyword: "search", command: searchCommand())
            if (room as! SpecialRoom).itemTaken == true{ 
                game.controller.deregister(keyword: "search")
            }

        default:
            game.controller.deregister(keyword: "search")
            print("\n\(getCorridorDescription())")
            
        }
    }
}

class Airlock: Room{
    
}

class Corridor: Room{

}

class SpecialRoom: Room{
    var itemTaken = false

    func event(game: Game){
    }
}

//definition of special Rooms
class Armory: SpecialRoom{
    var weaponOfArmory:weapon
    
    init(weapon: weapon, name: String){
        self.weaponOfArmory = weapon
        super.init(name: name)
    }

    override func event(game: Game) {
        print("\nThe armory has been damaged, and a lot of weapons aren't functionnal anymore.\nOn the ground, lies a \(weaponOfArmory.name)\n")
        let w = game.currentRun.playersInventory.getweapon(foundweapon: weaponOfArmory)
        if w == nil{
            itemTaken = true
        }else{
            weaponOfArmory = w!
        }
    }
}

class Technical: SpecialRoom{
    var collInTechnical: collectibles

    init(colls: collectibles, name: String){
        self.collInTechnical = colls
        super.init(name: name)
    } 

    override func event(game: Game) {
        print("\nYou rummage through the room, looking for something, you manage to find a \(collInTechnical.name) ")
        game.currentRun.playersInventory.getcollectible(foundcol: collInTechnical)
        itemTaken = true
    }
}

class Storage: SpecialRoom{
    var equipmentInStorage: equipment

    init(equipement: equipment, name: String){
        self.equipmentInStorage = equipement
        super.init(name: name)
    }

    override func event(game: Game) {
        print("\nAlthough the room is pretty small, it contains a \(equipmentInStorage.name)")
        game.currentRun.playersInventory.getequipement(fequipement: equipmentInStorage, run: game.currentRun)
        itemTaken = true
    }
}

class Secret: SpecialRoom{
    var shipUpgrade: shipUpgrades

    init(shipUpgrade: shipUpgrades, name: String){
        self.shipUpgrade = shipUpgrade
        super.init(name: name)
    }

    override func event(game: Game) {
        print("\nInside the room, a strange large box is floating. \nYou can see that a big lock, preventing you from openning it easily")
        if game.currentRun.playersInventory.backpack[0].count > 0{
            print("\nLucky for you, you have a key in your inventory !\nYou open the box and inside, you found a brand new \(shipUpgrade.name) ")
            (game as! MyGame).getShipUpgrade(upgrade: shipUpgrade)
            itemTaken = true
        }else{
            print("\nUnfortnaltly, you don't have any key to open it, maybe you should come back once you find one.\n")
        }
    }
}

class Quarters: SpecialRoom{

    override func event(game: Game) {
        let qItem = quarterInit().randomElement()!
        print("A small detail of the room seems strange, on a locker, a screen is asking to take entry, as if was waiting for a password.")
        print("//ù%/$¨µ/Ro-0@é >", terminator: "")
        let password = readLine()
        if password == "iloveAliens4ever"{
            print("CORRECT, the screens turns green as the locker opens, revealing an pretty \(qItem.name)")
            qItem.equipementGet(name: qItem.name, currentRun: game.currentRun)
            itemTaken = true
        }else{
            print("WRONG, the screens turn red and the screens disapear, you had only one try...")
            itemTaken = true
        }
    }
}

//creation of all the text lines for the differen rooms
class Combat: SpecialRoom{
}

func getCorridorDescription() -> String {
    let roomDescription: [String] = ["The corridors of the spaceship were silent and empty.", 
    "The walls of the corridor were a dull grey, with no signs of life.", 
    "The air was stale and musty, as if nothing had passed through here for years.", 
    "The only sound was the faint hum of the engines in the distance.", 
    "The floor was bare, with no footprints or anything else that might indicate life.", 
    "The walls were lined with pipes and wires, but no signs of life.", 
    "The lights in the corridor were dim and flickering, as if they were about to die.", 
    "The walls were cold and bare, as if they hadn't been touched in years.", 
    "The air was still and heavy, with no movement or sound.", 
    "It was a dead end corridor, with no obvious exits.", 
    "The walls were lined with pipes and wires, but nothing else.", 
    "The lights flickered, as if they were about to go out.", 
    "The walls were cold and lifeless, with no signs of life.", 
    "There was no sound in the corridor, only the faint hum of the engines in the distance.", 
    "The air was still and stale, with no movement or sound.", 
    "The floors were bare, with no footprints or anything else that might indicate life.", 
    "The walls were covered in pipes and wires, but nothing else to be seen.", 
    "The lights were dim and flickering, as if they were about to die.", 
    "The walls were a dull grey, with no signs of life.", 
    "The corridor was empty and silent, as if no one had ever been here before."]
return roomDescription.randomElement()!

}

func getArmoryDescription() -> String {
    let roomDescription: [String] = [
    "The spaceship armory is a dark, metallic chamber, filled with an eerie silence.", 
    "It's walls are lined with mysterious, blinking lights and panels.",
    "A faint hum of energy radiates from the armory, creating a sense of foreboding.",
    "The air is thick and heavy with a mysterious air.",
    "The floor is cold and hard, and the walls are lined with thick armor plating.",
    "The armory is filled with a strange aura of power, like a force waiting to be unleashed.",
    "The walls are lined with heavy, reinforced steel, and the ceiling is reinforced with a thick layer of metal.",
    "The armory is filled with a sense of power and danger, and a feeling of dread.",
    "The darkness of the armory is oppressive, and the air is filled with a strange, electric hum.",
    "The armory is a place of secrets and mysteries, and a sense of dread lurks in every corner."
]
return roomDescription.randomElement()!

}

 func getTechnicalDescription() -> String {
     let roomDescription: [String] = ["The spaceship technical closet was filled with a peculiar energy.", 
    "The walls of the technical closet were made of a shiny, metallic material.", 
    "The air in the technical closet was still and silent.", 
    "The door to the technical closet made a gentle whirring sound when opened.", 
    "A faint hum could be heard coming from the depths of the technical closet.", 
    "The technical closet seemed to stretch on forever.", 
    "A faint glow emanated from the walls of the technical closet.", 
    "The control panel at the entrance of the technical closet displayed a complex array of lights and symbols.", 
    "The walls of the technical closet vibrated with the power of a distant engine.", 
    "A faint scent of oil and machinery lingered in the air of the technical closet."]
return roomDescription.randomElement()!

}

func getStorageDescription() -> String {
    let roomDescription: [String] = [
    "A stark, empty storage closet, filled with a faint hum of electronic static.",
    "A narrow, dimly lit storage closet, with a smooth metal floor.",
    "A cramped storage closet, illuminated by soft LED lights.",
    "An expansive storage closet, lined with humming machinery.",
    "A musty storage closet, with a few forgotten crates stacked in the corner.",
    "A cramped storage closet, with a single flickering light bulb.",
    "A large, empty storage closet, illuminated by distant stars.",
    "A vast storage closet, shrouded in a mysterious darkness.",
    "A spacious storage closet, filled with the low buzz of energy.",
    "A silent storage closet, filled with a sense of anticipation."
]
return roomDescription.randomElement()!

}

func getSecretDescription() -> String {
    let roomDescription: [String] = ["A vast, empty space that echoes with the sound of air rushing through the vents",
    "The interior walls of the spaceship vent cool and dark, illuminated only by the eerie light of distant stars",
    "The vent is illuminated by a faint light, giving it an ominous and abandoned feel",
    "The walls of the vent are lined with pipes and cables, giving a mechanical and abandoned feel",
    "The vent is filled with a stillness, broken only by the occasional sound of air rushing through",
    "The walls of the vent are cold and dark, illuminated only by the faint gleam of distant stars",
    "The vent is filled with a stillness, accompanied by the occasional sound of air rushing through the vents",
    "The walls of the vent are lined with pipes and cables, giving it a mechanical and desolate feel",
    "The vent is filled with a stillness, interrupted only by the sound of air rushing through the pipes",
    "The interior walls of the vent are cold and dark, illuminated only by the faint light of distant stars"]

return roomDescription.randomElement()!

}

func getQuartersDescription() -> String {
    let roomDescription: [String] = ["The crew quarters of the empty spaceship were eerily silent, devoid of life and activity", 
    "The walls of the crew quarters were cold and metallic, reflecting the emptiness of the space", 
    "The lights were dimmed in the crew quarters, casting a faint shadow over the room", 
    "The air was stale and warm in the crew quarters, lacking the hustle and bustle of a busy space", 
    "The chairs in the crew quarters were lined up neatly, as if anticipating passengers that never came", 
    "The consoles and monitors in the crew quarters were dark and motionless, a stark contrast to a bustling ship", 
    "The floor of the crew quarters was sparkling clean, devoid of the footprints of its occupants", 
    "The lockers in the crew quarters were closed tightly, as if they were never opened", 
    "The beds in the crew quarters were neatly made, ready for use by an invisible crew", 
    "The walls of the crew quarters were barren, devoid of the pictures and decorations of a thriving space"]

return roomDescription.randomElement()!

}
