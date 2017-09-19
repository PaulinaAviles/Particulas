//en este codigo no especificamos cada una de la caracteristicas en el for
// se hacen desde la definición de mi objeto. 
//Esto reduce el código y si de todas formas no me importan las carct. de cada uno de los objetos, esto reculta más eficiente


ArrayList <particula> particulas;


void setup(){
  size(400,400);
  particulas= new ArrayList <particula>();   // "particulas" es un objeto que me permite tener acceso a un monton de objetos que yo determine, <particula>
  
  for(int i=0; i<100; i++){
    particulas.add(new particula()); //agregar a mi colección de particulas la particula que se generó
  }
}

void draw(){
  background(255);
  
  for(particula p:particulas){
    p.display();
    p.movimiento();
    p.desplazamiento();
    p.rebote();
  }
}


void mousePressed(){
  particula foo = new particula(mouseX,mouseY);
  particulas.add(foo);
}





class particula{
float x,y,v,a,t;
float dx,dy;
color c;

particula(float x_, float y_, float v_, float a_, float t_, color c_){
  x=x_;
  y=y_;
  v=v_;
  a=a_;
  t=t_;
  c=c_;
}


particula(){ //objeto cuyos parametros no especifico. Lo uso para las particulas que aparecen por default
  x = random(400);
  y = random(400);
  v = random(0-10);
  a = random(TWO_PI);
  t = random(1-30);
  c = color(random(255),random(255),random(255));
}

particula (float x_,float y_){ //para cuando doy click en la pantalla, la particula aparezca donde tengo el mouse
  x = x_;
  y = y_;
  v = random(0-10);
  a = random(TWO_PI);
  t = random(1-30);
  c = color(random(255),random(255),random(255));
}

  
  void display(){
    pushMatrix();
    translate(x,y);
    noStroke();
    fill(c);
    ellipse(0,0,t,t);
    popMatrix();
  }
  
  void movimiento(){
    //x+=random(-1,1);
    //y+=random(-1,1);
  }
  
  void desplazamiento(){
    
    y+=v*sin(a);
    x+=v*cos(a);
  }
  
  void rebote(){
    
   if(x>=width){
    a=PI-a;
    y+=(v*sin(a));
    x+=(v*cos(a));}
    
  if(x<=0){
    a=PI-a;
    y+=(v*sin(a));
    x=(v*cos(a));}
  
  if(y>=height){
    a=-a;
    y+=(v*sin(a));
    x+=(v*cos(a));}
  
  if(y<=0){
    a=-a;
    y+=(v*sin(a));
    x+=(v*cos(a));}
  }
  
  
}//class