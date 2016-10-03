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

  //void Update()
  //{
  //  Falling();
  //  Settings();
  //}

  void Falling()
  {
    fill(colour);
    ellipse(sandPosition.x, sandPosition.y, _rad, _rad); //Draws ellipse at sandPosition.x & y
    sandPosition.add(gravity); //Vector sandPosition is increased by gravity
    if (sandPosition.y >= height - 2) //If sand reaches bottom, sandPosition.y no longer is increased
    {
      gravity.y = 0;
    }
  }
  
  //void Settings()
  //{
  // if(sandSize[0] == true)
  // {
  //  _rad = 18; 
  // }
  //}
}