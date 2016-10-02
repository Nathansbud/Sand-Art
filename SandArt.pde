import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer input;
AudioPlayer[] Song = new AudioPlayer[9];
ArrayList<Sand> sand = new ArrayList<Sand>();
boolean gravity, antigravity;
Square colorSelector[] = new Square[7];
color colors[] = {color(255, 0, 0), color(255, 127, 0), color(255, 255, 0), color(0, 255, 0), 
  color(0, 0, 255), color(75, 0, 130), color(148, 0, 211)};
int num, c;
boolean colorChange[] = new boolean[7];

void setup()
{
  fullScreen();
  noStroke();
  fill(0);
  minim = new Minim(this);
  Song[0] = minim.loadFile("Bojack's Theme.mp3");
  Song[1] = minim.loadFile ("Can o' Salt.mp3");
  Song[2] = minim.loadFile ("Crypteque.mp3");
  Song[3] = minim.loadFile ("Konga Conga Kappa.mp3");
  Song[4] = minim.loadFile ("The Wight to Remain.mp3");
  Song[5] = minim.loadFile("Tank!.mp3");
  Song[6] = minim.loadFile("Heart of the Crypt.mp3");
  Song[7] = minim.loadFile("Song That Might Play When You Fight Sans.mp3");
  Song[8] = minim.loadFile("Dance of the Decorous.mp3");
  num = (int)random(0, 9);
}

void draw()
{
  background(255);
  textSize(50);
  fill(0);
  text("Settings", width/1.3090909091, height/11.25);
  if (mousePressed)
  {
    gravity = true;
  }
  if (gravity == true)
  {
    if (mousePressed)
    {
      sand.add(new Sand());

      noCursor();
      for (int i = 0; i < sand.size(); i++)
      {
        for (int j = 0; j < 7; j++)
        {
          {
            if (mouseX >= width/14.4 * j + width/48 && mouseX <= width/14.4 * j + width/18 && mouseY >= height/30 && mouseY <= height/11.25)
            {
              c = j;
            }
          }
          if (keyPressed && key == BACKSPACE)
          {
            sand.get(i)._color = color(0);
          }
        }
      }
    }   
    for (Sand sand : sand)
    {
      sand.Falling(colors[c]);
    }
  }
  for (float i = 0; i < 7.0; i++)
  {
    for (float j = 0; j < 7; j++)
    {
      colorSelector[(int)i] = new Square((int)(i * width/14.4 + width/48)); 
      colorSelector[(int)i].FillColor(colors[(int)i]);
      colorSelector[(int)i].SetPosition();
    }
  }
  CollisionChecks();
  MusicPlayer(width/1.846153, height/16.363636, 50);
}

void CollisionChecks()
{
  for (int i = 0; i < sand.size(); i++)
  {
    for (int j = 0; j < sand.size(); j++)
    {
      float dist = dist(sand.get(i).sandPosition.x, sand.get(i).sandPosition.y, sand.get(j).sandPosition.x, sand.get(j).sandPosition.y);
      if (i == j)
      {
        continue;
      }
      if (dist <= sand.get(i)._rad/2)
      {
        sand.get(i).gravity.y = 0;
      }
    }
  }
}

void mouseReleased()
{
  cursor();
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    for (int i = 0; i < sand.size(); i++)
    {
      sand.clear();
    }
  }
}

void MusicPlayer(float posX, float posY, float rad)
{
  fill(0);
  ellipse(posX, posY, rad, rad);
  ellipse(posX + 100, posY, rad, rad);
  ellipse(posX + 200, posY, rad, rad);
  fill(255);
  rect(865, 40, 10, 30);
  rect(885, 40, 10, 30);
  triangle(970, 45, 970, 65, 982, 55);
  triangle(982, 45, 982, 65, 994, 55);
  triangle(770, 40, 770, 70, 800, 55);
  if (mousePressed)
  {
    //Play Button Collision
    if (mouseX > 755 && mouseX < 805 && mouseY > 30 && mouseY < 80)
    {
      Song[num].play();
    }
    //Pause button collision
    if (mouseX > 855 && mouseX < 905 && mouseY> 30 && mouseY< 80)
    {
      Song[num].pause();
    }
    //Next song button collision
    if (mouseX > 955 && mouseX < 1005 && mouseY > 30 && mouseY < 80)
    { 
      Song[num].rewind();
      Song[num].pause();
      num =(int)random(0, 9);
      Song[num].play();
    }
  }
}