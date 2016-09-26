class Square
{
 private int _squarePosX, _squarePosY, _squareWidth, _squareHeight;
 private color _col;
 Square(int squarePosX)
 {
   _squarePosX = squarePosX;
   _squarePosY = 30;
   _squareWidth = 50;
   _squareHeight = 50;
   Draw();
 }
 
 void Draw()
 {
  fill(_col);
  rect(_squarePosX, _squarePosY, _squareWidth, _squareHeight, 8);
 }
 
 void FillColor(int _r, int _g, int _b)
 {
  _col = color(_r, _g, _b);
 }
 
}