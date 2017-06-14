function calculateYears(principal, interest, tax, desired) {
  var amount = principal
  var year = 0

  while (amount < desired) {
    accrued_interest = amount * interest
    amount = amount + accrued_interest- (accrued_interest*tax)
    year += 1
  }
  return year
}

console.log(calculateYears(1000, 0.05, 0.18, 1100) == 3);
console.log(calculateYears(1000,0.01625,0.18,1200) == 14);
console.log(calculateYears(1000,0.05,0.18,1000) == 0);
