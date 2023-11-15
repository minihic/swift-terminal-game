class Map {
    static func createMap(row: Int, column: Int) -> [[Int]] {

        //Initialisation of the parameters

        var specialRoomList: [Int] = []

        var randomSpecialRoomList: [Int] = [3, 4, 5, 7]

        randomSpecialRoomList.remove(at: .random(in: 0...2))
        
        let range: Int = 4

        var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: row), count: column)
        var specialRoom: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: row), count: column)

        //Setup Random Non-Repeating Generator

        var availableA: [Int] = []
        var rangeA: Int = range
        var availableB: [Int] = []
        var rangeB: Int = 1
        
        // Randomly generate Special Room using Non-Repeating Generator

        while (availableA.count < (row - range - 2)) {
                availableA.append(rangeA)
                rangeA += 1
        }

        while (availableB.count < (column - 1)) {
                availableB.append(rangeB)
                rangeB += 1
        }

        availableA.shuffle()
        availableB.shuffle()

        // print("availableA = \(availableA)")
        // print("availvableB = \(availableB)")

        for z: Int in 0..<randomSpecialRoomList.count {

            map[availableA[0]][availableB[0]] = randomSpecialRoomList[z]
            specialRoom[availableA[0]][availableB[0]] = randomSpecialRoomList[z]

            availableA.remove(at: 0)
            availableB.remove(at: 0)

            specialRoomList.append(z)
        }

        //Adding Fixed Room Locations

        //Add Airlock Location (does not need to be appended to specialRoomList because it is starting Room)

        map[1][5] = 2
        specialRoom[1][5] = 2

        //Add Secret Room Location

        let secretRoomPossibleLocation: [Int] = [1,2,3,7,8,9]
        let secretRoomY: Int = Int.random(in: 0...(secretRoomPossibleLocation.count-1))
        map[3][secretRoomPossibleLocation[secretRoomY]] = 6
        specialRoom[3][secretRoomPossibleLocation[secretRoomY]] = 6
        specialRoomList.append(6)

        //Add Combat Room Location

        map[9][5] = 8
        specialRoom[9][5] = 8
        specialRoomList.append(8)

        //Grabs all of the Special Rooms and Lables them in order for the connector
        var specialRoomLocationX: [Int] = []
        var specialRoomLocationY: [Int] = []
        for x: Int in 1..<row {
            for y: Int in 1..<column {
                if ((map[x][y] != 0) && (map[x][y] != 2)) {
                        specialRoomLocationX.append(x)
                        specialRoomLocationY.append(y)
                        // print("Room \(x) - \(y) \(map[x][y])")
                }
            }
        }

        //Adds Corridor Rooms between all the special rooms on map array
        var startRoomX: Int = 1
        var startRoomY: Int = 5

        for z: Int in 0..<specialRoomList.count {
            
            let goToLocationX: Int = specialRoomLocationX[z]
            let goToLocationY: Int = specialRoomLocationY[z]

                if startRoomX < goToLocationX {
                    while (startRoomX < goToLocationX) {
                        map[startRoomX][startRoomY] = 1
                        startRoomX += 1
                    }
                } else {
                    while (startRoomX > goToLocationX) {
                        map[startRoomX][startRoomY] = 1
                        startRoomX -= 1
                    }
                }

                if startRoomY < goToLocationY {
                    while (startRoomY < goToLocationY) {
                        map[startRoomX][startRoomY] = 1
                        startRoomY += 1
                    }
                } else {
                    while (startRoomY > goToLocationY) {
                        map[startRoomX][startRoomY] = 1
                        startRoomY -= 1
                    }
                }

            startRoomX = goToLocationX
            startRoomY = goToLocationY
        }
        
        //Combine Special Room and map Array into one for export
        for x: Int  in 1..<row {
            for y: Int in 1..<column{
                for k: Int in 2...8{
                    if specialRoom[x][y] == k {
                        map[x][y] = k
                    }
                }
            }
         }

        return map
    }

    static func linkMap(map: [[Int]], row: Int, column: Int) -> [Room] {

        //Initializing
        let map: [[Int]] = map
        let row: Int = row
        let column: Int = column

        var rooms: [Room] = [Room]()

        var mapLocationX: [Int] = [Int]()
        var mapLocationY: [Int] = [Int]()
        var mapLocationValue: [Int] = [Int]()


        //Grabs Room locations from Map and initialises room instances for those rooms
        for x: Int in 1..<row {
            for y: Int in 1..<column {
                if map[x][y] == 1 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let corridor: Corridor = Corridor(name: "Corridor \(x) - \(y)")
                    rooms.append(corridor)
                } else if map[x][y] == 2 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let airlock: Airlock = Airlock(name: "Airlock \(x) - \(y)")
                    rooms.append(airlock)
                } else if map[x][y] == 3 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let armory: Armory = Armory(weapon: weapon(name: "placeHolder") , name: "Armory Room \(x) - \(y)")
                    armory.weaponOfArmory = weaponsInit().randomElement()!
                    rooms.append(armory)
                } else if map[x][y] == 4 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let technical: Technical = Technical(colls: collectibles(name: "placeHolder"), name: "Technical Closet \(x) - \(y)")
                    technical.collInTechnical = collectiblesInit().randomElement()!
                    rooms.append(technical)
                } else if map[x][y] == 5 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let storage: Storage = Storage(equipement: equipment(name: "placeHolder"), name: "Storage Closet \(x) - \(y)")
                    storage.equipmentInStorage = equipementInit().randomElement()!
                    rooms.append(storage)
                } else if map[x][y] == 6 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let secret: Secret = Secret(shipUpgrade: shipUpgrades(name: "placeHolder"), name: "Corridor \(x) - \(y)")
                    secret.shipUpgrade = shipUpgradesInit().randomElement()!
                    rooms.append(secret)
                } else if map[x][y] == 7 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let quarters: Quarters = Quarters(name: "Crew Quarters \(x) - \(y)")
                    rooms.append(quarters)
                } else if map[x][y] == 8 {
                    mapLocationX.append(x)
                    mapLocationY.append(y)
                    mapLocationValue.append(map[x][y])
                    let combat: Combat = Combat(name: "Combat Room \(x) - \(y)")
                    rooms.append(combat)
                } 
            }
        }   

        let queueX: [Int] = mapLocationX
        let queueY: [Int] = mapLocationY
        var tempCount: Int = 0

        //Add exits and exit rooms to each room
        for x: Int in 1..<row {
            for y: Int in 1..<column {
                var temp: [String] = []
                tempCount += 1
                if map[x][y] != 0 {
                    if map[x-1][y] != 0 {
                        let roomIndex: Int = findRoomIndex(findX: x, findY: y, queueX: queueX, queueY: queueY)
                        let roomEdgeIndex: Int = findRoomIndex(findX: x-1, findY: y, queueX: queueX, queueY: queueY)
                        rooms[roomIndex].exits[.North] = rooms[roomEdgeIndex]
                        temp.append("north")
                    }
                    if (map[9][y] != 0) && (x == 9) {

                    } else if map[x+1][y] != 0 {
                        let roomIndex: Int = findRoomIndex(findX: x, findY: y, queueX: queueX, queueY: queueY)
                        let roomEdgeIndex: Int = findRoomIndex(findX: x+1, findY: y, queueX: queueX, queueY: queueY)
                        rooms[roomIndex].exits[.South] = rooms[roomEdgeIndex]
                        temp.append("south")
                    }
                    
                    if map[x][y-1] != 0 {
                        let roomIndex: Int = findRoomIndex(findX: x, findY: y, queueX: queueX, queueY: queueY)
                        let roomEdgeIndex: Int = findRoomIndex(findX: x, findY: y-1, queueX: queueX, queueY: queueY)
                        rooms[roomIndex].exits[.West] = rooms[roomEdgeIndex]
                        temp.append("west")
                    }
                    if (map[x][9] != 0) && (y == 9) {

                    } else if map[x][y+1] != 0 {
                        let roomIndex: Int = findRoomIndex(findX: x, findY: y, queueX: queueX, queueY: queueY)
                        let roomEdgeIndex: Int = findRoomIndex(findX: x, findY: y+1, queueX: queueX, queueY: queueY)
                        rooms[roomIndex].exits[.East] = rooms[roomEdgeIndex]
                        temp.append("east")
                    }
                }
                
            }
        }
        
        func findRoomIndex(findX: Int, findY: Int, queueX: [Int], queueY: [Int]) -> Int {
            let findX: Int = findX
            let findY: Int = findY
            let queueX: [Int] = queueX
            let queueY: [Int] = queueY
            var index: Int = 0
        
            while (queueX[index] == (findX) && queueY[index] == findY) != true {
                index += 1
            }   
            return index
        }

        return rooms
    
    }

    func printMap(map:[[Int]], row: Int, column: Int) {
        for x: Int  in 1..<row {
            for y: Int in 1..<column{
                if map[x][y] == 0 {
                    print("┄", terminator: "  ")
                } else if map[x][y] == 1 {
                    print("┿", terminator: "  ")
                } else if map[x][y] == 2 {
                    print("╥", terminator: "  ")
                } else if ((map[x][y] != 0) && (map[x][y] != 1)  && (map[x][y] != 2)){
                    print("╬", terminator: "  ")
                }
            }
            print("\n")
        }
    }
}