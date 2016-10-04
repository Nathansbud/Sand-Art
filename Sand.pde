class Sand
{
  PVector sandPosition, gravity; //Vectors for sand position and fall speed
  float _rad; //Radius
  color colour;

  Sand(color _color) //Color is defined in constructor 
  {
    sandPosition = new PVector(mouseX + (int)random(-7, 7), mouseY);
    gravity = new PVector(0, 3);
    _rad = 2;
    colour = _color;
  }

  void Falling()
  {
    fill(colour);
    ellipse(sandPosition.x, sandPosition.y, _rad, _rad); //Draws ellipse at sandPosition.x & y
    sandPosition.add(gravity); //Vector sandPosition is increased by gravity
    if (sandSpeed[0] == true)
    {
      gravity.y = 0;
    }
    if (sandSpeed[1] == true)
    {
      gravity.y = 1;
    }
    if (sandSpeed[2] == true)
    {
      gravity.y = 3;
    }
    if (sandSpeed[3] == true)
    {
      gravity.y = 6;
    }
    if (sandSize[0] == true)
    {
      _rad = 1;
    }
    if (sandSize[1] == true)
    {
      _rad = 2;
    }
    if (sandSize[2] == true)
    {
      _rad = 4;
    }
    if (sandSize[3] == true)
    {
      _rad = 8;
    }
    if (windSpeed[0] == true)
    {
      _rad = 1;
    }
    if (sandSize[1] == true)
    {
      _rad = 2;
    }
    if (sandSize[2] == true)
    {
      _rad = 4;
    }
    if (sandSize[3] == true)
    {
      _rad = 8;
    }
    if (sandPosition.y >= height - _rad)
    {
      gravity.y = 0;
    }
  }
}