x = linespace(-1,1,9)
y = 1./(1+25x.^2)
yc = [1 y -4]
xx = linespace(-1,1)
yyc = spline(x, yc, xx)
%yyc = spline(x, y, xx)
yr = 1./(1+25*xx.^2)
plot(x,y,'o',xx,yyc,'-',xx,yr,'--')
