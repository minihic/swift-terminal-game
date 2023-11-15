/// Inventory is where all item are stocked during the run, it is divided in 3 part, the holster, the backpack, and the gear
class inventory{
    ///holster and its maximum, the player can only carry a certain amout of weapon
    var holster: [weapon] = []
    var holsterMaximum = 2
    
    ///gear is the place to store all the equipement
    var gear: [equipment] = []
    
    ///backpack stores the collectibles
    var backpack: [collectibles] = []

    var inventoryOpen = false

    //definition of function used to pickup anyitem
    func getequipement(fequipement: equipment, run: run){
        gear.append(fequipement)
        fequipement.equipementGet(name: fequipement.name, currentRun: run)
        }

    func getcollectible(foundcol: collectibles){
        foundcol.itemget(name: foundcol.name)
        switch foundcol.name{
            case "key":
                backpack[0].count += 1
            case "bomb":
                backpack[1].count += 1
            case "medPack":
                backpack[2].count += 1
            case "energydrink":
                backpack[3].count += 1    
            default: foundcol.count += 1
        }
    }
    
    func getweapon(foundweapon: weapon) -> weapon?{
        var newfound: weapon? = foundweapon

        if holster.count >= holsterMaximum {    
            print("You can't hold more weapons, choose with one you want to leave: ")
            switch holsterMaximum{
                case 3:
                print("Type 1, 2, 3 or 4")
                print("\n 1: \(holster[0]) \t 2: \(holster[1]) \t 3: \(foundweapon) \t 4: \(holster[2])")

                case 4:
                print("Type 1, 2, 3, 4 or 5")
                print("\n 1: \(holster[0]) \t 2: \(holster[1]) \t 3: \(foundweapon) \t 4: \(holster[2]) \t 5: \(holster[3])")

                default:
                print("Type 1, 2, or 3")
                print("\n 1: \(holster[0]) \t 2: \(holster[1]) \t 3: \(foundweapon)")
            }
            var goodchoice = false
            while goodchoice == false{
                print("your choice: ", terminator: ">")
                
                switch readLine() {
                case "1":
                    foundweapon.itemget(name: foundweapon.name)
                    newfound = holster[0]
                    holster[0] = foundweapon
                    goodchoice = true
                case "2":
                    foundweapon.itemget(name: foundweapon.name)
                    newfound = holster[1]
                    holster[1] = foundweapon
                    goodchoice = true
                case "3": 
                    print("You leave the \(foundweapon)")
                    newfound  = foundweapon
                    goodchoice = true
                case"4":
                    if holsterMaximum < 3{
                        print("Please enter a valid choice")
                    }else{
                        foundweapon.itemget(name: foundweapon.name)
                        newfound = holster[2]
                        holster[2] = foundweapon
                        goodchoice = true
                    }   
                case "5":
                    if holsterMaximum < 4{
                        print("Please enter a valid choice")
                    }else{
                        foundweapon.itemget(name: foundweapon.name)
                        newfound = holster[3]
                        holster[3] = foundweapon
                        goodchoice = true
                    }
                default:
                    print("Please enter a valid choice")
                
                }
            }

        }else{ 
            foundweapon.itemget(name: foundweapon.name)
            holster.append(foundweapon)
            newfound = nil

        }
        return newfound
    }

    func getItem(item:items, run: run) -> items?{
        switch item {
        case is weapon:
            return getweapon(foundweapon: item as! weapon)
        
        case is equipment:
            getequipement(fequipement: item as! equipment, run: run)
            return nil

        case is collectibles:
            getcollectible(foundcol: item as! collectibles)
            return nil

        default: item.itemget(name: item.name)
            return nil
            
        }
    }

    //functions to print the inventory correctly
    func showHolster(){
        print("Currently, \(holster.count) weapons in your holster : ")
        var y = 0
        for weapons in holster{
            y += 1
            print("[\(y)] ",weapons.name, " : ", weapons.attack, " Dmg")   
        }
    }

    func showBackpack(){
        print("\nIn your backpack: ")
        for i in backpack{
            print(i.name," : ", i.count)        
        }
    }


    func showInventory(){
        inventoryOpen = true
        showHolster()
        showBackpack()
        
        print("To see your compltet gear, enter showGear")
        
    }
}
class showGear:Command{

    init(){}
    func run(game: Game, arguments: [String]) {
        print("Your Gear")
        
        for j in game.currentRun.playersInventory.gear{
            print("\n- \(j)")
        }
    }
}



