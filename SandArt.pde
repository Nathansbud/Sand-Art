ArrayList<Sand> sand = new ArrayList<Sand>();
boolean gravity;
Square colorSelector[] = new Square[7];

void setup()
{
  fullScreen();
  noCursor();
  noStroke();
}

void draw()
{
  background(255);
  if (mousePressed)
  {
    gravity = true;
  }
  if (gravity == true)
  {

    sand.add(new Sand());
    for (Sand s : sand)
    {
      s.Falling();
    }
  }

  for (int i = 0; i < 7; i++)
  {
    for (int j = 0; j < 7; j++)
    {
      colorSelector[i] = new Square(i * 100 + 30); 
      colorSelector[i].FillColor(0, 255, 255);
    }
  }
}
void mouseReleased()
{
  if (gravity == true)
  {
    //gravity = false;
  }
}