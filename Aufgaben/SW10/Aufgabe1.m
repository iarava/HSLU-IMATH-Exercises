function Aufgabe1()
  x = [0,2,4,6]
  y = [1,9,41,41]
  yc = [0 y -12]
  xx = linespace(0,6)
  yyc = spline(x, yc, xx)
  %yyc = spline(x, y, xx)
  yr = 1./(1+25*xx.^2)
  plot(x,y,'o',xx,yyc,'-',xx,yr,'--')
return
