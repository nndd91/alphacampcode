var tacofyHash = {
  "a" : "beef",
  "e" : "beef",
  "i" : "beef",
  "o" : "beef",
  "u" : "beef",
  "t" : "tomato",
  "l" : "lettuce",
  "c" : "cheese",
  "g" : "guacamole",
  "s" : "salsa"
 }
function tacofy (word) {
// ​
 var tacofiedArray = []
 var wordArray = word.toLowerCase().split("")

 wordArray.forEach(
  function(letter){
   if (letter in tacofyHash) {
    tacofiedArray.push(tacofyHash[letter]);
    console.log(tacofiedArray)
    }
  })

}

tacofy('as')
