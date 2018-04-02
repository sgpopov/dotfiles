# Dotfiles


## PhpStorm settings

Go to **help > Edit Custom VM Options** and changed the maximum amount of RAM allocated to PHPStorm, and added two graphics options (at the end of the file).

```
-Xms500m
-Xmx1500m

-Dawt.useSystemAAFontSettings=lcd
-Dawt.java2d.opengl=true

# Only for people on Mac, it makes Java use an optimised graphics engine.
-Dapple.awt.graphics.UseQuartz=true
```
