var summation = function (num) {
  var sum = 0
  for (i=0; i<=num; i++){
    sum += i;
  }
  return sum
}

console.log(summation(1) == 1);
console.log(summation(8) == 36);
