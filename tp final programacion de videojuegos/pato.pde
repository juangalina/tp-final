class Pato {
  PImage imagen;
  float x, y;
  float ancho, alto;
  
  Pato(PImage img, float posX, float posY, float ancho, float alto) {
    imagen = img;
    x = posX;
    y = posY;
    this.ancho = ancho;
    this.alto = alto;
    imagen.resize((int)ancho, (int)alto);
  }
  
  void mostrar() {
    image(imagen, x, y);
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
}
