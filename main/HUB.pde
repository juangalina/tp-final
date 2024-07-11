class HUD {
  int puntaje;
  int patosPerdidos; // Nuevo contador de patos perdidos

  HUD() {
    puntaje = 0;
    patosPerdidos = 0;
  }

  void incrementarPuntaje() {
    puntaje++;
  }

  void incrementarPatosPerdidos() {
    patosPerdidos++;
  }

  void mostrar() {
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Puntaje: " + puntaje, width / 2, 32);
    text("Patos Perdidos: " + patosPerdidos, width / 2, 64); // Mostrar patos perdidos
  }
}
