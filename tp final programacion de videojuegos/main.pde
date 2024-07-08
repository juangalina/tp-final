PImage fondo;
Pato pato;
Pistola pistola;
int puntuacion;

void setup() {
  size(800, 600);
  
  fondo = loadImage("fondo.png");
  PImage patoImg = loadImage("pato.png");
  PImage pistolaImg = loadImage("pistola.png");
  
  pato = new Pato(patoImg, width / 2, 400, 100, 80);  // Ajusta el tamaño del pato aquí (ancho, alto)
  pistola = new Pistola(pistolaImg, width / 2, 500);
  puntuacion = 0;
}

void draw() {
  background(fondo);
  
  pato.mostrar();
  pistola.mostrar();
  
  fill(0);
  textSize(32);
  text("Puntuación: " + puntuacion, 10, 30);
}

void mouseMoved() {
  pistola.setPos(mouseX);
}

void mousePressed() {
  float px = pistola.getX();
  float py = pistola.getY();
  
  if (pato.estaVisible() && mouseX > pato.getX() && mouseX < pato.getX() + pato.getAncho() &&
      mouseY > pato.getY() && mouseY < pato.getY() + pato.getAlto()) {
    // El pato ha sido alcanzado
    pato.desaparecer();
    puntuacion++;
    
    // Reaparecer el pato en una nueva posición después de un breve retraso
    delay(500);
    float nuevoX = random(0, width - pato.getAncho());
    float nuevoY = random(0, height - pato.getAlto());
    pato.reaparecer(nuevoX, nuevoY);
  }
}
