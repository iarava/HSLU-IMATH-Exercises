function ydot = twobody(t,y,y0)
  r = sqrt(y(1)^2 + y(3)^2);
  ydot = [y(2); y(4); -y(1)/r^3; -y(3)/r^3];
end