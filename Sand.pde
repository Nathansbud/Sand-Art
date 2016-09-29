class Sand
{
  private int _sandPosX, _sandPosY, _rad;
  private float _sandFallSpeed;
  private color _color;
  private boolean colorChange[] = new boolean[7];

  Sand()
  {
    _sandFallSpeed = 3;
    _sandPosX = mouseX + (int)random(-7, 7);
    _sandPosY = mouseY + 5 +(int)random(2, 6);
    _rad = 5;
  }

  void Falling()
  {
    fill(_color);
    _sandPosY += _sandFallSpeed;
    ellipse(_sandPosX, _sandPosY, _rad, _rad);
    if (_sandPosY >= height - 2)
    {
      _sandFallSpeed = 0;
    }
    for (int i = 0; i < 7; i++)
    {
      if (mousePressed)
      {
        if (mouseX >= 100 * i + 30 && mouseX <= 100 * i + 80 && mouseY >= 30 && mouseY <= 80)
        {
          colorChange[i] = true;
        }
      }
      if (colorChange[i] == true)
      {
        _color = color(colors[i]);
      }
    }
  }
}