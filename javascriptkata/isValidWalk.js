function isValidWalk(walk) {
  //insert brilliant code here
  var dir_hash = {};

  walk.forEach(function(each_dir) {
    if ( dir_hash[each_dir] == undefined ) {
      dir_hash[each_dir] = 1
    } else {
      dir_hash[each_dir] = dir_hash[each_dir] + 1
    }
  });

  if (walk.length == 10 && dir_hash['n'] == dir_hash['s'] && dir_hash['w'] == dir_hash['e']) {
    return true
  } else {
    return false
  };
}
console.log(isValidWalk(['n','s','n','s','n','s','n','s','n','s'])) //true
console.log(isValidWalk(['w','e','w','e','w','e','w','e','w','e','w','e'])) //false
console.log(isValidWalk(['w'])) //false
console.log(isValidWalk(['n','n','n','s','n','s','n','s','n','s'])) //false
