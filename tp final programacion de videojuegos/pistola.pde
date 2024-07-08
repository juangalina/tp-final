class Pistola {
  PImage imagen;
  float x, y;
  
  Pistola(PImage img, float posX, float posY) {
    imagen = img;
    x = posX;
    y = posY;
  }
  
  void mostrar() {
    image(imagen, x, y);
  }
  
  void setPos(float posX) {
    x = posX - imagen.width / 2;
  }
  
  float getX() {
    return x + imagen.width / 2;
  }
  
  float getY() {
    return y + imagen.height / 2;
  }
}
