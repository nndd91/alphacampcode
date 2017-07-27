class SiegeState {
  constructor() {
    this.damage = 20
    this.canMove = false
  }
}

class TankState {
  constructor() {
    this.damage = 5
    this.canMove = true
  }
}

class Tank {
  constructor() {
    this.state = new TankState()
  }

  get damage() {
    return this.state.damage
  }

  get canMove() {
    return this.state.canMove
  }
}

let tank = new Tank()
console.log(tank.damage)
tank.state = new SiegeState()
