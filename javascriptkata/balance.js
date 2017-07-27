function balance (left, right) {
  return calcWeight(left) === calcWeight(right) ? 'Balance' : calcWeight(left) > calcWeight(right) ? 'Left' : 'Right'

  function calcWeight (str) {
      return [...str].reduce((sum, letter) => {
        return sum + (letter === '!' ? 2 : 3)
      }, 0)
  }
}

console.log(balance("!!","??")) // === "Right"
console.log(balance("!??","?!!")) // === "Left"
console.log(balance("!?!!","?!?")) // === "Left"
console.log(balance("!!???!????","??!!?!!!!!!!")) // === "Balance"
