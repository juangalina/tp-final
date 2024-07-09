ArrayList<Pato> patos;

class SpawnerPatos {
  PImage imgPato;  // Imagen de los patos
  
  SpawnerPatos(PImage imgPato) {
    this.imgPato = imgPato;
    patos = new ArrayList<Pato>();
    spawnPatos();
  }
  
  void spawnPatos() {
    for (int i = 0; i < 5; i++) {
      patos.add(new Pato(-random(100, 5500), height/6, imgPato));  // Patos en la fila superior
      patos.add(new Pato(-random(100, 5500), height/2, imgPato));  // Patos en la fila central
      patos.add(new Pato(-random(100, 5500), 5 * height/6, imgPato));  // Patos en la fila inferior
    }
  }
  
  void actualizar() {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      pato.mover();
      if (pato.fueraDePantalla()) {
        patos.remove(i);  // Eliminar patos que están fuera de la pantalla
      }
    }
    if (patos.size() < 15) {
      spawnPatos();  // Generar más patos si hay menos de 15
    }
  }
  
  void mostrar() {
    for (Pato pato : patos) {
      pato.mostrar();
    }
  }
  
  void verificarColisiones(Mira mira) {
    for (Pato pato : patos) {
      pato.verificarColision(mira);  // Marcar el pato como colisionado si hay colisión
    }
  }

  void verificarClic(float mouseX, float mouseY) {
    for (int i = patos.size() - 1; i >= 0; i--) {
      Pato pato = patos.get(i);
      if (pato.colisionado && 
          mouseX > pato.x && mouseX < pato.x + pato.imagen.width &&
          mouseY > pato.y && mouseY < pato.y + pato.imagen.height) {
        patos.remove(i);  // Eliminar el pato si está colisionado y hay un clic sobre él
      }
    }
  }
}
