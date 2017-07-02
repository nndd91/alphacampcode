function getGcd(m1, n1) {
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

console.log(getGcd(1071, 462))
console.log(getGcd(7, 21))
console.log(getGcd(71, 21))
