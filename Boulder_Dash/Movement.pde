void keyPressed() {
  if (keyCode == ENTER) {
    setup();
    gameState = true;
    isDead = false;
  }
  
  if (isDead) {
    return;
  }
  if (keyCode == RIGHT) {
    if (x * sizeCell < width - sizeCell) {
      if ((playingField[x+ 1][y] == wallElement) || (playingField[x + 1][y] == boulderElement)) {
        return; 
      }
      x++;
      diamondCollected();
      joueur = loadImage("Sprites/characterright.png");
      if (playingField[x][y] != doorElement) {
        playingField[x][y] = walkedElement;
      }
    }
  } else if (keyCode == LEFT) {
    if (x * sizeCell > 0) {
      if ((playingField[x - 1][y] == wallElement) || (playingField[x - 1][y] == boulderElement)) {
        return;
      }
      x--;
      diamondCollected();
      joueur = loadImage("Sprites/characterleft.png");
      if (playingField[x][y] != doorElement) {
        playingField[x][y] = walkedElement;
      }
    }
  } else if (keyCode == DOWN) {
    if (y * sizeCell < height - sizeCell) {
      if ((playingField[x][y + 1] == wallElement) || (playingField[x][y + 1] == boulderElement)) {
        return;
      }
      y++;
      diamondCollected();
      if (playingField[x][y] != doorElement) {
        playingField[x][y] = walkedElement;
      }
    }
  } else if (keyCode == UP) {
    if (y * sizeCell > 0) {
      if ((playingField[x][y - 1] == wallElement) || (playingField[x][y - 1] == boulderElement)){
        return;
      }
      y--;
      diamondCollected();
      if (playingField[x][y] != doorElement) {
        playingField[x][y] = walkedElement;
      }
    }  
  }
}
