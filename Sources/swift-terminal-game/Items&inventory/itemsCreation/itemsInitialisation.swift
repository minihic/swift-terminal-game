//here we create arrays of all the items we want to add in the game

func collectiblesInit() -> [collectibles]{
    let key = collectibles(name:"Key")

    let bomb = collectibles(name:"Bomb")

    let medPack = collectibles(name: "Medpack")
    medPack.healthBonus = 40 //to be tweaked

    let energydrink = collectibles(name:"energydrink")
    energydrink.energyBonus = 15 //to be tweaked

    //[key, bomb, medPack, energydrink]

    return [key, bomb, medPack, energydrink]

}
//Fonction très importante pour faire spawn un collectible aléatoire
func getrandomcol(colarray: [collectibles]) -> collectibles{
    return colarray.randomElement()!
}

func shipUpgradesInit() -> [shipUpgrades]{
    var spArray: [shipUpgrades] = []

    let radShield = shipUpgrades(name:"Radiation Shield")
    radShield.healthBonus = 10
    spArray.append(radShield)

    let hyperdrive = shipUpgrades(name:"HyperDrive")
    hyperdrive.energyBonus = 10
    spArray.append(hyperdrive)

    let cyclotron = shipUpgrades(name:"Cyclotron Ballista")
    cyclotron.attack = 10
    spArray.append(cyclotron)

    return spArray
}

func equipementInit() -> [equipment]{
    var stock: [equipment] = []

    let pocket1 = pocket(name:"Pocket")
    stock.append(pocket1)
    
    let quanticpocket = quanticpocket(name:"Quantic Pocket")
    stock.append(quanticpocket)
    
    let metalPlate = metalPlate(name: "Metal Plate")
    stock.append(metalPlate)

    let beskarArmor = beskarArmor(name: "Beskar Armor")
    stock.append(beskarArmor)

    let adrenaline = adrenalineShot(name: "Adrenaline Shot")
    stock.append(adrenaline)

    let fastDrower = fastDrower(name: "Fast Drower")
    stock.append(fastDrower)

    let brainchip = brainChip(name: "Brain Chip")
    stock.append(brainchip)

    let marshmallow = marshmallow(name: "Marshmallow")
    stock.append(marshmallow)

    let tshirt = Tshirt(name: "T-Shirt")
    stock.append(tshirt)

    let infraHelmet = infraredHelmet(name: "Infrared Helmet")
    stock.append(infraHelmet)

    let quanticPlate = quanticPlate(name: "Quantic Plate")
    stock.append(quanticPlate)

    let wolfamulet = wolfAmulet(name: "Wolf Amulet")
    stock.append(wolfamulet)

    return stock
}

func quarterInit() -> [equipment]{
    var qArray: [equipment] = []

    let j0j = j0j(name: "J-0J")
    qArray.append(j0j)

    let minih1c = minihic(name: "Mini H1C")
    qArray.append(minih1c)

    let hboost = hboost(name: "H-Boost Gauntlet")
    qArray.append(hboost)
    
    return qArray
}

func weaponsInit() -> [weapon]{

    var weaponsInRun: [weapon] = []
    
    let lasergun = weapon(name:"Laser Gun")
    lasergun.attack = 20
    lasergun.needenergy = 10
    weaponsInRun.append(lasergun)

    let dualgun = weapon(name: "Double Gun")
    dualgun.attack = 20
    dualgun.needenergy = 7
    weaponsInRun.append(dualgun)
    
    let shotgun1 = weapon(name: "Double Barrel")
    shotgun1.attack = 50
    shotgun1.needenergy = 30
    weaponsInRun.append(shotgun1)

    let shotgun2 = weapon(name: "Laser Barrels")
    shotgun2.attack = 50
    shotgun2.needenergy = 25
    weaponsInRun.append(shotgun2)

    let SLMG = weapon(name: "SLMG-SubPhoton")
    SLMG.attack = 35
    SLMG.needenergy = 15
    weaponsInRun.append(SLMG)

    let P90 = weapon(name: "P90 Gamma-Emplified")
    P90.attack = 25
    P90.needenergy = 10
    weaponsInRun.append(P90)

    let snipz = weapon(name: "LRL Quantum")
    snipz.attack = 70
    snipz.needenergy = 30
    weaponsInRun.append(snipz)

    let Xlauncher = weapon(name: "X-Launcher")
    Xlauncher.attack = 90
    Xlauncher.needenergy = 45
    weaponsInRun.append(Xlauncher)

    let DH17 = weapon(name: "DH-17 Blaster")
    DH17.attack = 40
    DH17.needenergy = 15
    weaponsInRun.append(DH17)

    let cruciblade = weapon(name: "Crucible Blade")
    cruciblade.attack = 50
    cruciblade.needenergy = 30
    weaponsInRun.append(cruciblade)

    let neoM4 = weapon(name: "Neo M4000")
    neoM4.attack = 45
    neoM4.attack = 20
    weaponsInRun.append(neoM4)

    let neoAK = weapon(name: "Neo AK-404 ")
    neoAK.attack = 47
    neoAK.needenergy = 22
    weaponsInRun.append(neoAK)

    let alienTech = weapon(name: "Alien Beta emitor")
    alienTech.attack = 20
    alienTech.needenergy = 10
    weaponsInRun.append(alienTech)

    let shardShaper = weapon(name: "Shard Shaper")
    shardShaper.attack = 18
    shardShaper.needenergy = 5
    weaponsInRun.append(shardShaper)

    let prjectH = weapon(name: "Project H")
    prjectH.attack = 75
    prjectH.needenergy = 60
    weaponsInRun.append(prjectH)
        
    return weaponsInRun
}