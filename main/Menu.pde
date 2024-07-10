class Menu {
  boolean visible = true;

  void mostrar() {
    fill(0, 150);
    rect(0, 0, width, height);

    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Menu Principal", width / 2, height / 3);

    textSize(32);
    text("Presiona ENTER para Empezar", width / 2, height / 2);
    text("Presiona ESC para Salir", width / 2, 2 * height / 3);
  }

  void manejarInput() {
    if (keyPressed) {
      if (key == ENTER) {
        visible = false;
        musicaMenu.pause(); // Pausar la música del menú
        musicaPartida.loop(); // Reproducir la música de la partida en bucle
      } else if (key == ESC) {
        exit();
      }
    }
  }
}