import ddf.minim.*;

Minim minim;
AudioSample blob,clink;

int pantalla = 0;
PFont titulo;
int i = 0;
int x = 0;


ArrayList<Cell> cells = new ArrayList<Cell>();

void setup() {
  size(1200, 660);
  
  //AUDIO
  minim = new Minim(this);
  blob = minim.loadSample("blob.mp3",1024);
  clink = minim.loadSample("clink.wav",1024);
  
  //TEXTO
  titulo = createFont("Megrim.ttf",300);
  
  //CELULAS
  cells.add(new Cell(100,400,40,#ff0000));
  cells.add(new Cell(300,400,40,#ffff00));
  cells.add(new Cell(500,400,40,#00ff00));
  cells.add(new Cell(700,400,40,#0000ff));
  cells.add(new Cell(900,400,40,#00ffff));
  cells.add(new Cell(1100,400,40,#ff00ff));
}

void draw() {
  background(51);
  switch (pantalla){
  case 0:
  inicio();
  break;
  
  case 1:
  instrucciones();
  break;
  
  case 2:
  mitosis();
  break;
  }

}
void inicio(){
  textFont(titulo);
  textSize(200);
  fill(0);
  text("Simulador",25,205);
  text("De",25,405);
  text("Mitosis",25,605);
  /////////////////////////////////
  fill(255);
  text("Simulador",30,200);
  text("De",30,400);
  text("Mitosis",30,600);
  noStroke();
  /////////////////////////////////
  fill(#ff0000,85);
  ellipse(850,350,150,150);
  fill(#ff0000);
  ellipse(850,350,30,30);
  /////////////////////////////////
  fill(#0000ff,85);
  ellipse(1000,450,90,90);
  fill(#0000ff);
  ellipse(1000,450,20,20);
  /////////////////////////////////
  fill(#ffff00,85);
  ellipse(910,520,75,75);
  fill(#ffff00);
  ellipse(910,520,15,15);
  /////////////////////////////////
  fill(#00ff00,85);
  ellipse(990,610,45,45);
  fill(#00ff00);
  ellipse(990,610,10,10);
  
  fill(35);
  stroke(0);
  rect(width/2-120,height-30,300,25);
  
  textSize(20);
  fill(255);
  text("Da click aquí para continuar",width/2-100,height-10);
  
 if(mousePressed){
  pantalla = 1;
  }
}

void instrucciones(){
background(51);
textSize(60);
fill(255);
text("Da click a las células para que", 100,300);
text("hagan mitosis", 100,370);

textSize(40);
text("Al final, pulsa la tecla r para reiniciar",100,height-200);

textSize(20);
text("Pulsa la tecla i para iniciar",width/2-100,height-10);

if(keyPressed){
  if(key == 'i'){
  pantalla = 2;
  }
}
}

void mitosis(){
 for (Cell c : cells) {
     c.update();
     c.show();
     c.ColisionLimites();
     c.otracelula();
   }
   if(keyPressed){
     if(key == 'r'){
     pantalla = 0;
    
     for ( i = cells.size()-1; i >= 0; i--) {
       cells.remove(i);     
       }
       nuevas();
     }
   }
}

void nuevas(){
  i = 0;
  cells.add(new Cell(100,400,40,#ff0000));
  cells.add(new Cell(300,400,40,#ffff00));
  cells.add(new Cell(500,400,40,#00ff00));
  cells.add(new Cell(700,400,40,#0000ff));
  cells.add(new Cell(900,400,40,#00ffff));
  cells.add(new Cell(1100,400,40,#ff00ff));
}
 
void mousePressed() {
  for (int i = cells.size()-1; i >= 0; i--) {
    Cell c = cells.get(i);
    if (c.clicked(mouseX, mouseY)) {
      blob.trigger();
      cells.add(c.mitosis1());
      cells.add(c.mitosis2());
      cells.remove(i);
    }
  }
}