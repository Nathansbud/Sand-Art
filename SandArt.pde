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
MusicPlayer buttons;
color colors[] = {color(255, 0, 0), color(255, 127, 0), color(255, 255, 0), color(0, 255, 0), 
  color(0, 0, 255), color(75, 0, 130), color(148, 0, 211)};
int num;

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
}

void draw()
{
  background(255);
  buttons = new MusicPlayer();
  textSize(50);
  fill(0);
  text("Settings", 1100, 80);
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
    }   
    for (Sand sand : sand)
    {
      sand.Falling();
    }
    if (keyPressed && key == BACKSPACE)
    {
      sand.clear();
    }
  }
  for (int i = 0; i < 7; i++)
  {
    for (int j = 0; j < 7; j++)
    {
      colorSelector[i] = new Square(i * 100 + 30); 
      colorSelector[i].FillColor(colors[i]);
      colorSelector[i].SetPosition();
    }
  }
  CollisionChecks();
}

void CollisionChecks()
{
  for (int i = 0; i < sand.size(); i++)
  {
    for (int j = 0; j < sand.size(); j++)
    {
      float dist = dist(sand.get(i)._sandPosX, sand.get(i)._sandPosY, sand.get(j)._sandPosX, sand.get(j)._sandPosY);
      if (i == j)
      {
        continue;
      }
      if (dist <= 1)
      {
        sand.get(i)._sandFallSpeed = 0;
      }
    }
  }
}

void mouseReleased()
{
  cursor();
}