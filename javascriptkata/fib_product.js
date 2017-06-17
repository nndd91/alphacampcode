function productFib(prod){
  fib = [0, 1]
  n = 1
  while ((fib[n] * fib[n-1]) < prod) {
    fib.push(fib[n] + fib[n-1])
    n++
  }
  if ((fib[n] * fib[n-1]) == prod) {
    return [fib[n-1], fib[n], true]
  } else {
    return [fib[n-1], fib[n], false]
  }
}

console.log(productFib(4895)) //, [55, 89, true])
console.log(productFib(5895)) //, [89, 144, false])
console.log(productFib(74049690)) //, [6765, 10946, true])
console.log(productFib(84049690)) //, [10946, 17711, false])
console.log(productFib(193864606)) //, [10946, 17711, true])
console.log(productFib(447577)) //, [610, 987, false])
console.log(productFib(602070)) //, [610, 987, true])
