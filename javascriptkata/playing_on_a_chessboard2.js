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
    let lcm = frac1[1] * frac2[1] / getGcd(frac1[1], frac2[1])
    numerator = (frac1[0] * lcm / frac1[1]) + (frac2[0] * lcm / frac2[1])
    denominator = lcm
  }
  return [numerator, denominator]
}

function simplifyFraction (frac) {
  let numerator = frac[0]
  let denominator = frac[1]
  if (numerator === 1) {
    return [numerator, denominator]
  }

  let gcd = getGcd(numerator, denominator)

  return [numerator / gcd, denominator / gcd]
}

function getGcd (m1, n1) {
  let found = false
  let num1, num2, remainder, divisor

  if (m1 > n1) {
    num1 = m1
    num2 = n1
  } else {
    num1 = n1
    num2 = m1
  }

  while (found === false) {
    while (num1 >= num2) {
      num1 -= num2
    }
    if (num1 === 0) {
      found = true
      divisor = num2
    } else {
      remainder = num1
      num1 = num2
      num2 = remainder
    }
  }
  return divisor
}

console.log(addFraction([1, 2], [1, 2]))
console.log(addFraction([1, 2], [1, 3]))
console.log(addFraction([1, 2], [1, 10]))
console.log(simplifyFraction([12, 20]))
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
