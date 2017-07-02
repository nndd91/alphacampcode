function game (n) {
  let sum = [0, 0]
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      sum = simplifyFraction(addFraction(sum, [j + 1, j + i + 2]))
    }
  }
  if (sum[1] === 0 || sum[1] === 1) {
    return [sum[0]]
  }
  return (sum)
}

function addFraction (frac1, frac2) {
  let numerator = 0
  let denominator = 0
  if (frac1[1] === 0) {
    return [frac2[0], frac2[1]]
  }
  if (frac1[1] === frac2[1]) {
    numerator = frac1[0] + frac2[0]
    denominator = frac1[1]
  } else {
    numerator = frac1[0] * frac2[1] + frac2[0] * frac1[1]
    denominator = frac1[1] * frac2[1]
  }
  return [numerator, denominator]
}

function simplifyFraction (frac) {
  let numerator = frac[0]
  let denominator = frac[1]
  if (numerator === 1) {
    return [numerator, denominator]
  }

  for (let i = numerator; i > 1; i--) {
    if (denominator % i === 0 && numerator % i === 0) {
      return [numerator / i, denominator / i]
    }
  }
  return [numerator, denominator]
}

console.log(addFraction([1, 2], [1, 2]))
console.log(addFraction([1, 2], [1, 3]))
console.log(addFraction([1, 2], [1, 10]))
console.log(simplifyFraction([12, 20]))
console.log(game(2))
console.log(game(0))
console.log(game(5))
console.log(game(8))
