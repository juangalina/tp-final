class Pistola extends GameObject {
  Pistola(float x, float y, PImage imagen) {
    super(x, y, imagen);
  }
  
  void seguirMouse() {
    x = mouseX - imagen.width / 2;  // Centrar la pistola en el cursor del mouse en X
  }
}
