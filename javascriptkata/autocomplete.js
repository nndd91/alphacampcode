function autocomplete(input, dictionary){
  let i = 0;
  let final_array = [];
  let regex = new RegExp("^" + input, "i");

  while ( final_array.length < 5 && i < dictionary.length) {
    teststring = dictionary[i].replace(/[^A-Za-z]+/, '')
    if (teststring.match(regex)) {
      final_array.push(teststring);
    }
    i ++;
  }

  return final_array;
}

console.log(autocomplete('ai', ['airplane','airport','apple','ball', 'dsadas', 'dasai', 'dasai', 'dasai', 'dasai', 'dasai']))// = ['airplane','airport']
console.log(autocomplete('airplane', ['airpl321@#@ane','airport','apple','ball']))// = ['airplane','airport']
console.log(autocomplete('a', ['dasd', 'bsd']));
