function persistence(num) {
  var num = num.toString().split('').map(function(num) { return parseInt(num)});
  var no_of_times = 0;

  while (num.length > 1) {
    var final_value = 1
    num.forEach(function(each_value){
      final_value *= each_value;
    });
    num = final_value.toString().split('').map(function(num) { return parseInt(num)});
    no_of_times++;
  }

  return no_of_times;
}

console.log(persistence(39));
