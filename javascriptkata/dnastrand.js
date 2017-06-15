function DNAStrand(dna){
  var complement = ""

  for(i = 0; i < dna.size; i++) {
    switch(dna.charAt(i)) {
      case "A":
        complement += "T";
        break;
      case "T"
        complement += "A";
        break;
      case "G"
        complement += "C";
        break;
      case "C"
        complement += "G";
        break;
    }
  }
}

console.log(DNAStrand("AAAA")); //"TTTT","String AAAA is");
console.log(DNAStrand("ATTGC")); //"TAACG","String ATTGC is");
console.log(DNAStrand("GTAT")); //"CATA","String GTAT is");
