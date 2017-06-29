function tripleTrouble(one, two, three) {
  var final_string = "";
  for(i = 0; i < one.length; i++) {
    final_string += one[i] + two[i] + three[i];
  }
  return final_string;
 }

console.log(tripleTrouble("this","test","lock")) // "ttlheoiscstk");
console.log(tripleTrouble("aa","bb","cc")) // "abcabc");
console.log(tripleTrouble("Bm", "aa", "tn")) // "Batman");
console.log(tripleTrouble("LLh","euo","xtr")) // "LexLuthor");
