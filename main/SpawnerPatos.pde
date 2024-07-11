class SpawnerPatos {
  PImage imgPato;
  int numPatosIniciales = 15;
  int patosFueraDePantalla = 0; // Contador de patos que han salido de la pantalla
  int limitePatosFuera = 10; // Límite de patos que pueden salir antes de mostrar Game Over

  ArrayList<Pato> patos; // Definir el ArrayList para los patos

  SpawnerPatos(PImage imgPato) {
    this.imgPato = imgPato;
    this.imgPato.resize(50, 50); // Redimensionar la imagen aquí
    patos = new ArrayList<Pato>();
    spawnPatos(numPatosIniciales);
  }

  void spawnPatos(int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      PImage patoImage = loadImage("pato.png");
      patoImage.resize(50, 50); // Redimensionar la imagen aquí
      patos.add(new Pato(-patoImage.width - random(100, 300), random(height), patoImage));
    }
  }

  void actualizar() {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      pato.mover();
      if (pato.fueraDePantalla()) {
        patos.remove(i);
        patosFueraDePantalla++;
        if (patosFueraDePantalla > limitePatosFuera) {
          juegoActivo = false; // Desactivar el juego si se supera el límite
        }
        PImage patoImage = loadImage("pato.png");
        patoImage.resize(50, 50); // Redimensionar la imagen aquí
        patos.add(new Pato(-patoImage.width - random(100, 300), random(height), patoImage)); // Respawn del pato
      }
    }
    if (patos.size() < numPatosIniciales) {
      spawnPatos(numPatosIniciales - patos.size());
    }
  }

  void mostrar() {
    for (Pato pato : patos) {
      pato.mostrar();
    }
  }

  void verificarColisiones(Mira mira) {
    for (Pato pato : patos) {
      pato.verificarColision(mira);
    }
  }

  void verificarClic(float mouseX, float mouseY, HUD hud) {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      if (pato.colisionado &&
          mouseX > pato.x && mouseX < pato.x + pato.imagen.width &&
          mouseY > pato.y && mouseY < pato.y + pato.imagen.height) {
        patos.remove(i);
        hud.incrementarPuntaje();
        return;
      }
    }
  }
}
