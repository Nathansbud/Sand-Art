class Sand
{
  PVector sandPosition, gravity;
  //int _sandPosX, _sandPosY;
  float _rad, _sandFallSpeed;
  color _color;
  boolean colorChange[] = new boolean[7];

  Sand()
  {
    sandPosition = new PVector(mouseX + (int)random(-7, 7), mouseY);
    gravity = new PVector(0, 3);
    //_sandFallSpeed = 3;
    //_sandPosX = mouseX + (int)random(-7, 7);
    //_sandPosY = mouseY; //+ 5 +(int)random(2, 6);
    _rad = 4;
  }

  void Falling(color _color)
  {
    fill(_color);
    ellipse(sandPosition.x, sandPosition.y, _rad, _rad);
    sandPosition.add(gravity);
    if (sandPosition.y >= height - 2)
    {
      gravity.y = 0;
    } 
  }
}