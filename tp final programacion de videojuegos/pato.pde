class Pato {
  PImage imagen;
  float x, y;
  float ancho, alto;
  boolean visible;
  
  Pato(PImage img, float posX, float posY, float ancho, float alto) {
    imagen = img;
    x = posX;
    y = posY;
    this.ancho = ancho;
    this.alto = alto;
    imagen.resize((int)ancho, (int)alto);
    visible = true;
  }
  
  void mostrar() {
    if (visible) {
      image(imagen, x, y);
    }
  }
  
  void desaparecer() {
    visible = false;
  }
  
  void reaparecer(float posX, float posY) {
    x = posX;
    y = posY;
    visible = true;
  }
  
  boolean estaVisible() {
    return visible;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getAncho() {
    return ancho;
  }
  
  float getAlto() {
    return alto;
  }
}
