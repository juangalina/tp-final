import ddf.minim.*;

Minim minim;
AudioPlayer musicaMenu;
AudioPlayer musicaPartida;
AudioSample sonidoDisparo;

PImage fondo;
Mira mira;
SpawnerPatos spawner;
Pistola pistola;
HUD hud;
Menu menu;

void setup() {
  size(800, 600);
  minim = new Minim(this);

  // Cargar la música
  musicaMenu = minim.loadFile("musica_menu.mp3");
  musicaPartida = minim.loadFile("musica_partida.mp3");

  // Cargar el sonido de disparo
  sonidoDisparo = minim.loadSample("sonido_disparo.mp3");

  fondo = loadImage("fondo.png");
  PImage imgMira = loadImage("mira.png");
  imgMira.resize(50, 50);
  mira = new Mira(width / 2, height / 2, imgMira);

  PImage imgPato = loadImage("pato.png");
  imgPato.resize(50, 50);
  spawner = new SpawnerPatos(imgPato);

  PImage imgPistola = loadImage("pistola.png");
  imgPistola.resize(100, 50);
  pistola = new Pistola(width / 2, height - 50, imgPistola);

  hud = new HUD();
  menu = new Menu();

  musicaMenu.loop(); // Reproducir la música del menú en bucle
}

void draw() {
  if (menu.visible) {
    menu.mostrar();
    menu.manejarInput();
  } else {
    background(255);
    image(fondo, 0, 0, width, height);
    mira.seguirMouse();
    mira.mostrar();

    spawner.actualizar();
    spawner.mostrar();
    spawner.verificarColisiones(mira);

    pistola.seguirMouse();
    pistola.mostrar();

    hud.mostrar();
  }
}

void mousePressed() {
  if (!menu.visible) {
    sonidoDisparo.trigger(); // Reproducir el sonido de disparo
    spawner.verificarClic(mouseX, mouseY, hud);
  }
}
