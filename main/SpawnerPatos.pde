ArrayList<Pato> patos;

class SpawnerPatos {
  PImage imgPato;
  int numPatosIniciales = 15;

  SpawnerPatos(PImage imgPato) {
    this.imgPato = imgPato;
    patos = new ArrayList<Pato>();
    spawnPatos(numPatosIniciales);
  }

  void spawnPatos(int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      patos.add(new Pato(-imgPato.width - random(100, 300), random(height), imgPato));
    }
  }

  void actualizar() {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      pato.mover();
      if (pato.fueraDePantalla()) {
        pato.resetPosition();
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
