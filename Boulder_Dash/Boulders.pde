int boulderDestroyedCounter;

class Boulder {
  
  void boulderBehave() {
    boulderCrush();
    boulderDrop();
  }
  
  void boulderCrush() {
    try {
      if ((playingField[x][y - 2] == boulderElement) && (playingField[x][y - 1] == walkedElement)) {
        playingField[x][y] = boulderElement;
         playingField[x][y - 2] = walkedElement;
         if (playingField[x][y] == boulderElement) {
           isDead = true;
           joueur = loadImage("Sprites/mort.png");
         }
      }
    } catch(Exception e) {}
  }
  
  void boulderDrop() {
    // checking every block that is a boulder
    for (int i = 0; i < width/sizeCell; i++) {
      for (int j = 0; j < height/sizeCell; j++) {
        try { 
          println(playingField[i].length);
          if (playingField[i].length > j && ((playingField[i][j] == boulderElement || playingField[i][j] == boulderDestroyedElement) && playingField[i][j + 1] == walkedElement) && !(i == x && j + 1 == y)) {
            playingField[i][j + 1] = boulderElement;
            playingField[i][j] = walkedElement;
          }
        } catch (Exception e) {
          println(e);
        } 
      }
    }
  }
}

Boulder boulderBehaviour;
