class Mira extends GameObject {
  Mira(float x, float y, PImage imagen) {
    super(x, y, imagen);
  }
  
  void seguirMouse() {
    x = mouseX - imagen.width / 2;  // Centrar la mira en el cursor del mouse en X
    y = mouseY - imagen.height / 2;  // Centrar la mira en el cursor del mouse en Y
  }
}
