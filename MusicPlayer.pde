class MusicPlayer
{
  private int _posX, _posY, _rad;

  MusicPlayer()
  {
    _posX = 780;
    _posY = 55;
    _rad = 50;
    Draw();
    Player();
  }

  void Draw()
  {
    //Play Button
    fill(0);
    ellipse(_posX, _posY, _rad, _rad);
    ellipse(_posX + 200, _posY, _rad, _rad);
    ellipse(_posX + 100, _posY, _rad, _rad);
    fill(255);
    rect(865, 40, 10, 30);
    rect(885, 40, 10, 30);
    triangle(970, 45, 970, 65, 982, 55);
    triangle(982, 45, 982, 65, 994, 55);
    triangle(770, 40, 770, 70, 800, 55);
  }

  void Player()
  {
    if (mousePressed)
    {
      //Play Button Collision
      if (mouseX > 755 && mouseX < 805 && mouseY > 30 && mouseY < 80)
      {
        Song[num].play();
      }
      //Pause button collision
      if (mouseX > 855 && mouseX < 905 && mouseY> 30 && mouseY< 80)
      {
        Song[num].pause();
      }
      //Next song button collision
      if (mouseX > 955 && mouseX < 1005 && mouseY > 30 && mouseY < 80)
      { 
        Song[num].rewind();
        Song[num].pause();
        num =(int)random(0, 9);
        Song[num].play();
      }
    }
  }
}