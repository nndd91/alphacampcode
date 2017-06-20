function blackOrWhiteKey(keyPressCount) {
  const BLACKS = [2, 5, 7, 10, 12];
  while (keyPressCount > 88) {
    keyPressCount -= 88;
  }
  while (keyPressCount > 12) {
    keyPressCount -= 12;
  }
  if (BLACKS.includes(keyPressCount)){
    return "black"
  }
  return "white"
}

