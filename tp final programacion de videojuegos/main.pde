PImage fondo;
Pato pato;
Pistola pistola;

void setup() {
  size(800, 600);
  
  fondo = loadImage("fondo.png");
  PImage patoImg = loadImage("pato.png");
  PImage pistolaImg = loadImage("pistola.png");
  
  pato = new Pato(patoImg, width/2, 400, 100, 80);  // Ajusta el tamaño del pato aquí (ancho, alto)
  pistola = new Pistola(pistolaImg, width/2, 500);
}

void draw() {
  background(fondo);
  
  pato.mostrar();
  pistola.mostrar();
}

void mouseMoved() {
  pistola.setPos(mouseX);
}

void mousePressed() {
  float px = pistola.getX();
  float py = pistola.getY();
  
  if (dist(px, py, pato.getX(), pato.getY()) < 50) {
   
    println("¡Pato alcanzado!");
  }
}
