class Mira extends GameObject {
  Mira(float x, float y, PImage imagen) {
    super(x, y, imagen);
  }

  void seguirMouse() {
    x = mouseX - imagen.width / 2;
    y = mouseY - imagen.height / 2;
  }
}
