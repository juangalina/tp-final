class GameOver {
  void mostrar(int puntaje) {
    fill(0, 150);
    rect(0, 0, width, height);

    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 3);

    textSize(32);
    text("Puntaje: " + puntaje, width / 2, height / 2);
    text("Presiona ESPACIO para jugar de nuevo", width / 2, 2 * height / 3);
  }

  boolean manejarInput() {
    if (keyPressed && key == ' ') {
      return true; // Indica que se debe reiniciar el juego
    }
    return false;
  }
}
