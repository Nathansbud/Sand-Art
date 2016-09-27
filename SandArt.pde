ArrayList<Sand> sand = new ArrayList<Sand>();
boolean gravity, antigravity;
Square colorSelector[] = new Square[7];
color colors[] = {color(255, 0, 0), color(255, 127, 0), color(255, 255, 0), color(0, 255, 0), 
  color(0, 0, 255), color(75, 0, 130), color(148, 0, 211)};

void setup()
{
  fullScreen();
  noStroke();
  fill(0);
}

void draw()
{
  background(255);
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
    for (Sand s : sand)
    {
      s.Falling();
    }
    CollisionChecks();
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
        antigravity = true;
        if (antigravity == true)
        {
          sand.get(i)._sandPosY += -1;
        }
      }
      if (dist > 1)
      {
        antigravity=false;
      }
      //if(sand.get(i)._sandPosY < 80)
      //{
      // sand.remove(i); 
      //}
    }
  }
}

void mouseReleased()
{
 cursor();
}