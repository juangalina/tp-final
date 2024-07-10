class Pato extends GameObject {
  float speed = 2;
  boolean colisionado = false;

  Pato(float x, float y, PImage imagen) {
    super(x, y, imagen);
  }

  void mover() {
    x += speed;
  }

  boolean fueraDePantalla() {
    return x > width;
  }

  void verificarColision(Mira mira) {
    if (dist(mira.x + mira.imagen.width / 2, mira.y + mira.imagen.height / 2, x + imagen.width / 2, y + imagen.height / 2) < mira.imagen.width / 2) {
      colisionado = true;
    }
  }

  void resetPosition() {
    x = -imagen.width - random(100, 300);
    colisionado = false;
  }
}
