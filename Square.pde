class Square
{
  private float _squarePosX, _squarePosY, _squareWidth, _squareHeight;
  private color _col;
  Square(int squarePosX)
  {
    _squarePosX = squarePosX;
    _squarePosY = 30;
    _squareWidth = 50;
    _squareHeight = 50;
  }

  void SetPosition()
  {
    fill(_col);
    rect(_squarePosX, _squarePosY, _squareWidth, _squareHeight, 8);
  }

  void FillColor(int _r)
  {
    _col = color(_r);
  }
}