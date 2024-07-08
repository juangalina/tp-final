PImage fondo;  // Declarar fondo como una variable global
Mira mira;     // Declarar la instancia de la mira
SpawnerPatos spawner;  // Declarar el spawner de patos
Pistola pistola;  // Declarar la instancia de la pistola

void setup() {
  size(800, 600);  // Tamaño de la ventana
  fondo = loadImage("fondo.png");  // Cargar imagen de fondo
  PImage imgMira = loadImage("mira.png");  // Cargar imagen de la mira
  imgMira.resize(50, 50);  // Redimensionar la imagen de la mira
  mira = new Mira(width/2, height/2, imgMira);  // Crear la mira en el centro de la pantalla
  
  PImage imgPato = loadImage("pato.png");  // Cargar imagen de los patos
  imgPato.resize(50, 50);  // Redimensionar la imagen de los patos
  spawner = new SpawnerPatos(imgPato);  // Crear el spawner de patos

  PImage imgPistola = loadImage("pistola.png");  // Cargar imagen de la pistola
  imgPistola.resize(100, 50);  // Redimensionar la imagen de la pistola
  pistola = new Pistola(width/2, height - 50, imgPistola);  // Crear la pistola en la parte inferior de la pantalla
}

void draw() {
  background(255);  // Limpiar la pantalla en cada frame
  image(fondo, 0, 0, width, height);  // Dibujar el fondo
  mira.seguirMouse();  // Actualizar la posición de la mira para que siga al mouse
  mira.mostrar();  // Mostrar la mira en su posición actual
  
  spawner.actualizar();  // Actualizar la posición de los patos
  spawner.mostrar();  // Mostrar los patos
  spawner.verificarColisiones(mira);  // Verificar colisiones entre la mira y los patos

  pistola.seguirMouse();  // Actualizar la posición de la pistola para que siga el movimiento horizontal del mouse
  pistola.mostrar();  // Mostrar la pistola en su posición actual
}

void mousePressed() {
  spawner.verificarClic(mouseX, mouseY);  // Verificar clic sobre los patos
}
