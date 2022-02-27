//rotacion general
float rotacion;
float rotacion2;
float rotacion3;
float rotacion4;

PShape planeta1;
PShape planeta2;
PShape planeta3;
PShape planeta4;
PShape planeta5;

PShape satelite1;
PShape satelite2;

PShape centro;
PImage img;
PImage bg;

int opcion;
int distancia;

//primero angulo, segundo distancia
boolean[] sum;

void setup(){
  size(1000,500,P3D);
  background(0);
  stroke(0);
  rotacion = 0;
  rotacion2 = 0;
  
  opcion = -45;
  distancia = -100;
  sum = new boolean[3];
  
  //centro
  print("Cargando centro...");
  centro = createShape(SPHERE,50);
  centro.setStroke(255);
  
  img = loadImage("centro.png");
  centro.setTexture(img);

  //planeta1
  print("Cargando planetas...");
  
  planeta1 = createShape(SPHERE,20);
  planeta1.setStroke(255);
  
  img = loadImage("planeta1.png");
  planeta1.setTexture(img);
  
  //planeta2
  
  
  planeta2 = createShape(SPHERE,30);
  planeta2.setStroke(255);
  
  img = loadImage("planeta2.png");
  planeta2.setTexture(img);
  
  //planeta3
  
  
  planeta3 = createShape(SPHERE,20);
  planeta3.setStroke(255);
  
  img = loadImage("planeta3.PNG");
  planeta3.setTexture(img);
  //planeta4
  
  
  planeta4 = createShape(SPHERE,10);
  planeta4.setStroke(255);
  
  img = loadImage("planeta4.jpg");
  planeta4.setTexture(img);
  //planeta5
  
  
  planeta5 = createShape(SPHERE,60);
  planeta5.setStroke(255);
  
  img = loadImage("planeta5.jpg");
  planeta5.setTexture(img);
  
  //satelite1
  satelite1 = createShape(SPHERE,5);
  satelite1.setStroke(255);
  
  img = loadImage("satelite.jpg");
  satelite1.setTexture(img);
  
  
  //satelite2
  satelite2 = createShape(SPHERE,10);
  satelite2.setStroke(255);
  
  img = loadImage("satelite2.jpg");
  satelite2.setTexture(img);
  
  //cargar imagen
  bg = loadImage("fondo.jpg");
  
}

void draw(){
  background(bg);
  
  
  pushMatrix();
  textSize(20);
  text("Arriba - Vision alternativa",20,20);
  text("Derecha/Izquierda - Distancia",20,40);
  text("R - Por defecto",20,60);
  textSize(15);
  text(distancia + "Z",width-40,40);
  popMatrix();
  
  
  translate(width/2, height/2,distancia);
  
  
  pushMatrix();
  rotateX(radians(opcion));
  rotateY(radians(rotacion));
  popMatrix();
  if(sum[0]){
    rotateX(radians(90));
  }
  
  shape(centro); 
  //p1
  pushMatrix();
  
  rotateZ(radians(rotacion2));
  translate(100, 0,0);
  //primero el planeta, luego el texto para quitarle la rotación
  shape(planeta1);
  //texto
  pushMatrix();
  textSize(20);
  rotateZ(-radians(rotacion2));
  text("Reda",10,-30);
  popMatrix();
  
  //satelite 1
  rotateZ(radians(rotacion4));
  rotateX(radians(rotacion4));
  translate(40,0,0);
  
  
  shape(satelite1);
  rotateX(-radians(rotacion4));
  rotateZ(-radians(rotacion4));
  rotateZ(-radians(rotacion2));
 
  textSize(10);
  text("RR14",10,-10);
  popMatrix();
  
  //p2
  pushMatrix();
  rotateY(radians(rotacion3));
  translate(250, 0,0);

  shape(planeta2);
  rotateY(-radians(rotacion3));
  
  text("Verd",10,-40);
  
  popMatrix();
  
  //p3
  pushMatrix();
  rotateZ(radians(rotacion3));
  translate(0, 300,0);
  
 
  shape(planeta3);
  rotateZ(-radians(rotacion3));
  text("Marro",10,-30);
  
  
  popMatrix();
  
  //p4
  pushMatrix();
  rotateY(radians(rotacion4));
  translate(200, 0,200);
  
  
  shape(planeta4);
  rotateY(-radians(rotacion4));
  text("Tox",10,-30);
  
  popMatrix();
  
  //p5
  pushMatrix();
  
  
  rotateY(radians(rotacion));
  rotateZ(radians(rotacion4));
  translate(500, 0,0);
  
  
  shape(planeta5);
  rotateZ(radians(-rotacion4));
  rotateY(radians(-rotacion));
  
  textSize(40);
  text("Gran",10,-60);
  
  //satelite 2
  rotateY(radians(rotacion4));
  translate(100,0,0);
  
  
  shape(satelite2);
  textSize(20);
  rotateY(-radians(rotacion4));
  text("Mim",10,-20);
  
  popMatrix();
  
  
  
  
  rotacion += 0.1;
  rotacion2 += 0.2;
  rotacion3 += 0.3;
  rotacion4 += 0.5;
  if (rotacion > 360){
    rotacion = 0;
  }
  if (rotacion2 > 360){
    rotacion2 = 0;  
  }
  if (rotacion3 > 360){
    rotacion3 = 0;  
  }
  if (rotacion4 > 360){
    rotacion4 = 0;  
  }
  
  if (sum[1]) distancia++;
  if (sum[2]) distancia--;
  if (opcion > 360) opcion = 0;
  if (opcion > 360) distancia = 0;
  
}

void keyPressed(){
  if (keyCode == UP){
    sum[0] = true;
  }
  if (keyCode == RIGHT){
    sum[1] = true;
  }
  if (keyCode == LEFT){
    sum[2] = true;
  }
  
  if (key == 'R' || key == 'r'){
    opcion = -45;
    distancia = -100;
  }
}
void keyReleased(){
  if (keyCode == UP){
    sum[0] = false;
  }
  if (keyCode == RIGHT){
    sum[1] = false;
  }
  if (keyCode == LEFT){
    sum[2] = false;
  }
}
