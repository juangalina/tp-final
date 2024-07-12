class SpawnerPatos {
  PImage imgPato;
  int numPatosIniciales = 15;
  int limitePatosFuera = 10; // Límite de patos que pueden salir antes de mostrar Game Over

  // Coordenadas Y de los tres carriles
  int[] carrilesY = {100, 300, 200}; // Ajustar estos valores según la imagen

  ArrayList<Pato> patos;

  SpawnerPatos(PImage imgPato) {
    this.imgPato = imgPato;
    this.imgPato.resize(50, 50);
    patos = new ArrayList<Pato>();
    spawnPatos(numPatosIniciales);
  }

  void spawnPatos(int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      PImage patoImage = loadImage("pato.png");
      patoImage.resize(50, 50);
      int carrilY = carrilesY[(int)random(carrilesY.length)]; // Seleccionar un carril aleatorio
      patos.add(new Pato(-patoImage.width - random(100, 300), carrilY, patoImage));
    }
  }

  void actualizar() {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      pato.mover();
      if (pato.fueraDePantalla()) {
        patos.remove(i);
        hud.incrementarPatosPerdidos(); // Incrementar contador de patos perdidos
        if (hud.patosPerdidos >= limitePatosFuera) {
          juegoActivo = false;
          musicaPartida.pause();
          musicaGameOver.loop(); // Reproducir la música de Game Over
        } else {
          PImage patoImage = loadImage("pato.png");
          patoImage.resize(50, 50);
          int carrilY = carrilesY[(int)random(carrilesY.length)]; // Seleccionar un carril aleatorio
          patos.add(new Pato(-patoImage.width - random(100, 300), carrilY, patoImage));
        }
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
