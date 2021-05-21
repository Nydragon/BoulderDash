int boulderDestroyedCounter;

class Boulder {
  
  void boulderBehave() {
    boulderCrush();
   // boulderLeft();
    // boulderRight();
    boulderDrop();
  }
  
  void boulderCrush() {
    try {
      if ((playingField[x/sizeCell][(y/sizeCell) - 2] == boulderElement) && (playingField[x/sizeCell][(y/sizeCell) - 1] == walkedElement)) {
        playingField[x/sizeCell][y/sizeCell] = boulderElement;
         playingField[x/sizeCell][(y/sizeCell) - 2] = walkedElement;
         if (playingField[x/sizeCell][(y/sizeCell)] == boulderElement) {
           isDead = true;
           joueur = loadImage("Sprites/mort.png");
         }
      }
    } catch(Exception e) {}
  }
  
  void boulderDrop() {
    for (int i = 0; i < width/sizeCell; i++) {
      for (int j = 0; j < height/sizeCell; j++) {
        if ((playingField[i][j] == boulderElement || playingField[i][j] == boulderDestroyedElement) && !(i * sizeCell == x && (j + 1) * sizeCell == y)) {
         // println(x, y);
          // iterating over every block that is below a boulder
          for (int f = j; f < height/sizeCell; f++) {
            println(f);
            if (playingField[i][f] == walkedElement) {
              playingField[i][f] = boulderElement;
              //playingField[i][f < 0 ? f : f + 1] = walkedElement;
            } 
            //else {
              //break;
            //}
          }
        }
      }
    }
  }
  

  void boulderLeft() {
    try {
      if (((playingField[x/sizeCell - 1][(y/sizeCell) - 1] == boulderElement) || (playingField[x/sizeCell - 1][(y/sizeCell) - 1] == boulderDestroyedElement)) && (playingField[x/sizeCell - 1][y/sizeCell] == walkedElement)) {
        int boulderX = x/sizeCell - 1;
        int boulderY = y/sizeCell - 1;
        for (int i = 0; i < height/sizeCell; i++) {
          playingField[boulderX][boulderY + 1] = boulderDestroyedElement;
          playingField[boulderX][boulderY] = walkedElement;
          boulderY++;
          if (playingField[boulderX][boulderY + 1] != walkedElement) {
            break;
          }
        }
        boulderDestroyedCounter++;
      }
    } catch(Exception e) {}
  }
  
  void boulderRight() {
    try {
      if (((playingField[x/sizeCell + 1][(y/sizeCell) - 1] == boulderElement) || (playingField[x/sizeCell + 1][(y/sizeCell) - 1] == boulderDestroyedElement)) && (playingField[x/sizeCell + 1][y/sizeCell] == walkedElement)) {
        int boulderX = x/sizeCell + 1;
        int boulderY = y/sizeCell - 1;
        for (int i = 0; i < height/sizeCell; i++) {
          playingField[boulderX][boulderY + 1] = boulderDestroyedElement;
          playingField[boulderX][boulderY] = walkedElement;
          boulderY++;
          if (playingField[boulderX][boulderY + 1] != walkedElement) {
            break;
          }
        }
        boulderDestroyedCounter++;
      }
    } catch (Exception e) {}
  }
}

Boulder boulderBehaviour;
