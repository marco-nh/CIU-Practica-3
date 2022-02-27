# Memoria Practica 3 CIU - Sistema Planetario
 Creado por Marco Nehuen Hernández Abba
 
 Debido al peso del gif (por los planetas y el escenario con la libreria GifAnimator), la duracion de esta es corta
 ![animacion](anima.gif)
 
 ### Contenido
- Trabajo realizado
- Herramientas y Referencias

## Trabajo realizado
Para crear la estrella, los planetas y los satelites, fueron usados variables de clase PShape, para la texturas variables de clase PImage y las rotaciones de cada planeta sobre la estrella, sobre un planeta para el satelite y sobre si mismo con variables float.
En setup(), la estructura para crear figuras esfericas es la siguiente:

```
//crear esfera
centro = createShape(SPHERE,50);
centro.setStroke(255);
//poner textura (PImage)
img = loadImage("centro.png");
centro.setTexture(img);
```

Desde draw(), la rotacion sigue esta estructura segun el tipo:

**Estrella**
```
   rotateX(radians(opcion));
   shape(centro); 
```

**Planeta**
```
  //inicio rotacion planeta
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
  
  ...
  
  popMatrix();
  //fin rotacion planeta
```

**Satelite**
```
  //inicio rotacion planeta
  pushMatrix();
  
  ...
  
  //primero el planeta, luego el texto para quitarle la rotación
  //satelite 1
  rotateZ(radians(rotacion4));
  rotateX(radians(rotacion4));
  translate(40,0,0);
  
  //texto
  shape(satelite1);
  rotateX(-radians(rotacion4));
  rotateZ(-radians(rotacion4));
  rotateZ(-radians(rotacion2));
 
  textSize(10);
  text("RR14",10,-10);
  popMatrix();
  //fin rotacion planeta
```

La interfaz de la aplicacion tiene dos teclas para aumentar o disminuir la distancia, un boton con una rotación fija y uno poner por defecto la "camara".

**Texto**
```
  pushMatrix();
  textSize(20);
  text("Arriba - Vision alternativa",20,20);
  text("Derecha/Izquierda - Distancia",20,40);
  text("R - Por defecto",20,60);
  textSize(15);
  text(distancia + "Z",width-40,40);
  popMatrix();
```

**Distancia y camara fija**
```
   if(sum[0]){
      rotateX(radians(90));
   }
   if (sum[1]) distancia++;
   if (sum[2]) distancia--;
   if (opcion > 360) opcion = 0;
   if (opcion > 360) distancia = 0;
```
```
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
```

## Herramientas y Referencias
**Gif Animator**

Para sacar el gif solicitado, con el siguiente codigo, comentado dentro de la practica.
```
void setup() {
  //gif
  //ficherogif = new GifMaker(this, "animacion.gif");
  //ficherogif.setRepeat(0);        // anima sin fin
}

void draw() {
  ...
  //ficherogif.setDelay(1000/60);
  //ficherogif.addFrame();
  }
```
