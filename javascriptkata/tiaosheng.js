function tiaosheng(failedCount){
  var time = 0
  var jumps = 0
  while (time < 60) {
    failedCount.indexOf(jumps) != -1 ? time += 4 : time++;
    if (time <= 60) {
      jumps++
    };
  };
  return jumps;
}


console.log(tiaosheng([])); //,60)
console.log(tiaosheng([12, 23, 45])); //,51)
console.log(tiaosheng([17])); //,57)
console.log(tiaosheng([10, 20, 30, 40])); //,48)
console.log(tiaosheng([10, 20, 30, 40, 58])); //,48)
console.log(tiaosheng([10, 20, 30, 40, 47, 60])); //,47)
console.log(tiaosheng([1,2,3,4,5,6,7,8,9,10])); //,30)
console.log(tiaosheng([58])); //),58
