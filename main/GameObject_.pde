class GameObject {
  float x, y;
  PImage imagen;

  GameObject(float x, float y, PImage imagen) {
    this.x = x;
    this.y = y;
    this.imagen = imagen;
  }

  void mostrar() {
    image(imagen, x, y);
  }
}
