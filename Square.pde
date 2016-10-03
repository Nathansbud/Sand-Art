class Square 
{
  PVector squarePosition, squareDimensions; //Location and dimensions
  Square(int squarePosX)  
  {
    squarePosition = new PVector(squarePosX, 30);
    squareDimensions = new PVector(50, 50);
  }

  void SetPosition(color _col)
  {
    fill(_col);
    rect(squarePosition.x, squarePosition.y, squareDimensions.x, squareDimensions.y, 8);
  }
}

//Pretty straightforward stuff, yo