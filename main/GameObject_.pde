class GameObject {
  float x, y;  // Posición del objeto
  PImage imagen;  // Imagen del objeto
  
  GameObject(float x, float y, PImage imagen) {
    this.x = x;
    this.y = y;
    this.imagen = imagen;
  }
  
  void mostrar() {
    image(imagen, x, y);  // Mostrar la imagen en la posición x, y
  }
}
