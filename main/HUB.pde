class HUD {
  int puntaje;

  HUD() {
    puntaje = 0;
  }

  void incrementarPuntaje() {
    puntaje++;
  }

  void mostrar() {
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Puntaje: " + puntaje, width / 2, 32);
  }
}
