function sortArray(array) {

  if (array.length == 0) {
    return [];
  }

  var odd_array = array.filter(function(element) {
    return element%2 != 0
  });

  console.log(odd_array);

  odd_array.sort(function(a, b) {
    return a - b
  });
  console.log(array);
  console.log(odd_array);
  for(i = 0; i < array.length; i++) {
    if (array[i]%2 != 0) {
      array[i] = odd_array.shift();
      console.log(odd_array);
    };
  };
  console.log(array);
  return array
}

console.log(sortArray([5, 3, 2, 8, 1, 4]) ==  [1, 3, 2, 8, 5, 4])
console.log(sortArray([5, 3, 1, 8, 0]) ==  [1, 3, 5, 8, 0])
console.log(sortArray([]) == [])
console.log(sortArray([]))
console.log(sortArray([ 5, 3, 2, 8, 1, 4, 11 ]))
