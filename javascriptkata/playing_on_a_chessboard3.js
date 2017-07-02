function game (n) {
  return (n * n / 2) % 1 == 0 ? (n * n / 2) : [ (n * n), 2]
}


console.log(game(0))
console.log(game(1))
console.log(game(2))
console.log(game(3))
console.log(game(4))
console.log(game(5))
console.log(game(6))

console.log(game(8))

console.log(game(10))
console.log(game(20))
