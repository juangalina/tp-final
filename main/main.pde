import ddf.minim.*;

Minim minim;
AudioPlayer musicaMenu;
AudioPlayer musicaPartida;
AudioPlayer musicaGameOver; // Nueva música para Game Over
AudioSample sonidoDisparo;

PImage fondo;
Mira mira;
SpawnerPatos spawner;
Pistola pistola;
HUD hud;
Menu menu;
GameOver gameOver;

boolean juegoActivo = false;

void setup() {
  size(800, 600);
  minim = new Minim(this);

  // Cargar la música
  musicaMenu = minim.loadFile("musica_menu.mp3");
  musicaPartida = minim.loadFile("musica_partida.mp3");
  musicaGameOver = minim.loadFile("musica_gameover.mp3"); // Cargar la música de Game Over

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
  gameOver = new GameOver();

  musicaMenu.loop();
}

void draw() {
  if (menu.visible) {
    menu.mostrar();
  } else if (juegoActivo) {
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
  } else {
    gameOver.mostrar(hud.puntaje);
  }
}

void mousePressed() {
  if (!menu.visible && juegoActivo) {
    sonidoDisparo.trigger();
    spawner.verificarClic(mouseX, mouseY, hud);
  }
}

void keyPressed() {
  if (menu.visible) {
    menu.manejarInput();
  } else if (!juegoActivo) {
    if (key == ' ') {
      reiniciarJuego();
    }
  }
}

void reiniciarJuego() {
  hud = new HUD();
  spawner = new SpawnerPatos(loadImage("pato.png"));
  juegoActivo = true;
  musicaPartida.loop();
  musicaMenu.pause();
  musicaGameOver.pause(); // Pausar la música de Game Over
}
