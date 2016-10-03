import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; 
Minim minim; //Just your standard minim fare
AudioPlayer[] Song = new AudioPlayer[9]; //Array of song for music player
ArrayList<Sand> sand = new ArrayList<Sand>(); //ArrayList of Sand objects 
boolean gravity, sandSize[]; //Variable used to signal sand creation and drawing
Square colorSelector[] = new Square[7]; //Squares for color selector
color colors[] = {color(255, 0, 0), color(255, 127, 0), color(255, 255, 0), color(0, 255, 0), 
  color(0, 0, 255), color(75, 0, 130), color(148, 0, 211), color(0)}; //Array of colors used (will be changed once color wheel is implemented)
int num, c; //Integers used for song # (num) and colors[#] (c)
float screen;
String buttonText[] = {"None", "Low", "Med", "High"}, headerText[] = {"Invisible", "Gravity", "Size", "Wind Speed"}, 
  sizeText[] = {"Mini", "Small", "Med", "Large"};

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
  Song[8] = minim.loadFile("Dance of the Decorous.mp3"); //Files used with music player
  num = (int)random(0, 9); //Randomizes int num such that the MP3 chosen is random
  c = 7; //c = black at first
  screen = 0.1;
  sandSize = new boolean[3];
}

void draw()
{
  if (screen == 0.2)
  {
    background(175);
    stroke(0);
    fill(255);
    rect(width/8, height/8, width - width/8 * 2, height - height/8 * 2);
    rect(width/2 - width/36, height - height/6, width/24, height/48, 8);
    fill(0);
    textSize(50);
    text("Settings", width/2 - width/12, height/10);
    for (int i = 0; i < 4; i++)
    { 
      for (int j = 1; j < 4; j++)
      {      
        fill(255);
        rect(i * width/14.4 + width/2.75, j * height/4, width/24, height/48, 8);
        fill(0);
        textSize(25);

        if (i == 3)
        {
          text(headerText[i], width/2 - width/16, height/5 * i);
        } else
        {
          text(headerText[i], width/2 - width/24, height/5 * i);
        }
        textSize(15);
        if (j == 2)
        {
          text(sizeText[i], i * width/14.4 + width/144 + width/2.75, j * height/4 + height/60);
        } else
        {
          text(buttonText[i], i * width/14.4 + width/144 + width/2.75, j * height/4 + height/60);
        }
      }
    }
    text("Back", width/2 - width/53, height - height/6 + height/60);
  } else
  {
    background(175);
    textSize(50);
    fill(0);
    text("Settings", width/1.3090909091, height/11.25);
    if (mousePressed)
    {
      gravity = true;
    }
    if (gravity == true) //Ensures that sand particles stay on screen rather than being removed once mouseReleased
    {
      if (mousePressed)
      {
        sand.add(new Sand(colors[c])); //Creates new sand with color "c"
        noCursor(); //Doesn't show cursor until mouse released
        for (int j = 0; j < 7; j++)
        {
          {
            if (mouseX >= width/14.4 * j + width/48 && mouseX <= width/14.4 * j + width/18 && mouseY >= height/30 && mouseY <= height/11.25)
            {
              c = j;
            }
          }
        }
      } // Set color selector collision, and c (color) = j (square), which are already filled with c;
      for (Sand sand : sand) //Cause all sand particles to be falling!
      {
        sand.Falling();
      }
    }
    for (int i = 0; i < 7; i++) //Creates squares for color selection
    {
      colorSelector[i] = new Square((int)(i * width/14.4 + width/48)); 
      colorSelector[i].SetPosition(colors[i]);
    }
    CollisionChecks(); //Checks collisions between circles
    MusicPlayer(width/1.846153, height/16.363636, 50); //Draws music player circles
  }
}

void CollisionChecks()
{
  for (int i = 0; i < sand.size(); i++)
  {
    for (int j = 0; j < sand.size(); j++)
    {
      float dist = dist(sand.get(i).sandPosition.x, sand.get(i).sandPosition.y, sand.get(j).sandPosition.x, sand.get(j).sandPosition.y); //Checks collision between any 2 particles
      if (i == j) //If i == j, ignore—they're the same particle
      {
        continue;
      } 
      if (dist <= sand.get(i)._rad/2) //If distance between 2 particles = 1/2 of radius, then fall speed = 0
      {
        sand.get(i).gravity.y = 0;
      }
    }
  }
}

void mouseReleased()
{
  cursor(); //Reshow the mouse once mouse released
}

void mouseClicked()
{
  if (mouseX >= width/1.3090909091 && mouseX <= width/1.3090909091 + 350 && mouseY >= height/11.25 - 50 && mouseY <= height/11.25)
  {
    screen = 0.2;
  }
  if (mouseX >= width/2 - width/35 && mouseX <= width/2 - width/37 + width/24 && mouseY >= height - height/6 && mouseY
    <= height - height/6 + height/48 && screen == 0.2)
  {
    noStroke();
    screen = 0.1;
  }
  //if (screen == 0.2)
  //{
  //  if (mouseY >= height/4 && mouseY <= height/4 + height/48)
  //  {
  //    if (mouseX >= width/4 && mouseY <= height/4 + height/48)
  //    {
  //      sandSize[0] = true;
  //    }
  //    if (mouseY >= height/2 && mouseY <= height/2 + height/48)
  //    {
  //      sandSize[1] = true;
  //    }
  //    if(mouseY >= height/3*4 && mouseY <= height/3*4 + height/48)
  //    {
  //     sandSize[2] = true; 
  //    }
      
  //  }
  //}

  //for (int i = 0; i < 4; i++)
  //{ 
  //  for (int j = 1; j < 4; j++)
  //  {      
  //    fill(255);
  //    rect(i * width/14.4 + width/2.75, j * height/4, width/24, height/48, 8);
  //    fill(0);
  //    textSize(25);

  //    if (i == 3)
  //    {
  //      text(headerText[i], width/2 - width/16, height/5 * i);
  //    } else
  //    {
  //      text(headerText[i], width/2 - width/24, height/5 * i);
  //    }
  //    textSize(15);
  //    if (j == 2)
  //    {
  //      text(sizeText[i], i * width/14.4 + width/144 + width/2.75, j * height/4 + height/60);
  //    } else
  //    {
  //      text(buttonText[i], i * width/14.4 + width/144 + width/2.75, j * height/4 + height/60);
  //    }
  //  }
  //}
}
}

void keyPressed()
{
  if (key == BACKSPACE || key == 'r') //If delete/r pressed, clear all and set color back to black
  {
    sand.clear();
    c = 7;
    screen = 0.1;
  }
  if (key == '2')
  {
    screen = 0.2;
  }
}

void MusicPlayer(float posX, float posY, float rad) //Shapes used in making the buttons
{
  for (int i = 0; i < 3; i++)
  {
    fill(0);
    ellipse(posX + i * 100, posY, rad, rad);    
    fill(255);
    if (i > 0)
    {
      rect(posX + 65 + 20 * i, 40, 10, 30);
    }
    triangle(970, 45, 970, 65, 982, 55);
    triangle(982, 45, 982, 65, 994, 55);
    triangle(770, 40, 770, 70, 800, 55);
  }
  if (mousePressed)
  {
    if (mouseX > posX - 25 && mouseX < posX + 25 && mouseY > posY - 25 && mouseY < posY + 25) //Play Button Collision
    {
      Song[num].play();
    }
    if (mouseX > posX + 75 && mouseX < posX + 125 && mouseY> posY - 25 && mouseY< posY + 25) //Pause Button Collision
    {
      Song[num].pause();
    }
    if (mouseX > posX + 175 && mouseX < posX + 225 && mouseY > posY - 25 && mouseY < posY + 25) //Next Button Collision
    { 
      Song[num].rewind();
      Song[num].pause();
      num =(int)random(0, 9);
      Song[num].play();
    }
  }
}