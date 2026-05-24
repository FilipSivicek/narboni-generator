input mpcolornames

prologues:=3;

u:= 5mm;
d = 10u;
s = 2.5u;

beginfig(1)

pair p[];
p1 = (0, 0);
p2:= p1 + (-0.5 * d, 0);
p3:= p2 + (0, 0.6 *d);
p4:= p2 + (-0.5 * d, 0);
p5:= p4 + (0, 0.6 * d);

p6:= p1 + (0.2 * d, 1.0*d);
p7:= p6 + (-2*d, 0);
p8:= p7 + (0, 0.5 * d);
p10:= p6 + (0, 0.5 * d);
p9:= (p8 + p10) / 2 + (0 * d, 0.15 * d);

p11:= (p6 + p7 + p8 + p10) / 4;

p12:= p10 + (d, 0.3 * d);
p13:= p8 + (-d, 0.3 * d);
p14:= p4 + (0, -0.5 * d);

pickup pencircle scaled 14pt;
for i=1 upto 14: draw p[i]; endfor;

pickup pencircle scaled 0.9mm;

draw p1--p2--p3--p4--p5--p3--p1;
draw p2--p4--p5;

draw p1--p6--p3;
draw p5--p6--p7--p4;
draw p7--p5;

draw p7--p11--p6--p10--p11--p9--p10;
draw p7--p8--p9--p11--p8;

draw p8--p13--p9--p12--p10;
draw p13--p12;
draw p13--p7;
draw p1--p12--p6;

draw p1--p14--p2;
draw p4--p14;
draw p7--p14;

pair h[];

h1:= p4 + (-d, 0);
draw p13--p14;

h2:= p14 + (d, 0);
h3:= p12 + (0, -d);
draw p14..h2..h3..p12;

endfig;

end;
end.
