input mpcolornames

prologues:=3;

def drawTriangle(expr pos, len, angle) = 
    begingroup
        pair endpoint;
        endpoint := pos + (len, 0);
        
        pair TOP;
        TOP:= endpoint + (0, len/4);

        pair BOT;
        BOT:= endpoint + (0, -len/4);

        TOP:= TOP rotatedabout (pos, angle);
        BOT:= BOT rotatedabout (pos, angle);

        draw pos--BOT--TOP--pos;
    endgroup;
enddef;

numeric LabelScale;
LabelScale:= 2.9;

u:= 10mm;
d = 2u;
s = 2.5u;

%%%(C,B)
beginfig(1)

pair p[];
p1:= (0,0);
p2:= (5u,-5u);

p2:= p2 rotatedabout(p1, 135);

p3:= p1 rotatedabout(p2, -90);
p4:= p2 rotatedabout(p1, 90);

p5:= (p1 + p2 + p3 + p4) / 4;
p6:= p5 + (-u,-u);
p6:= p6 rotatedabout(p5, 135);

for i:= 1,2,3: p[6+i]:= p6 rotatedabout(p5, i * 90); endfor;

p10:= p4 + (p4 - p1);

for i:= 1,2,3,4: p[i+10]:= p[i + 5] + (p4 - p1); endfor;

pickup pencircle scaled 14pt;
for i=1 upto 14: draw p[i]; endfor;

pickup pencircle scaled .9mm;
draw p1--p2--p3--p4--p1;
draw p6--p7--p8--p9--p6;

for i=6 upto 9: draw p[i]--p5; endfor;

draw p6--p1--p9--p4--p8--p3--p7--p2--p6;

draw p11--p12--p13--p14--p11;
draw p4--p10;
draw p12--p14;
draw p12--p3--p11--p4--p14--p10--p13;
draw p1--(p1 + (2u, -2u));

pair h[];
h1:= p3 + 0.2*(p3 - p4);
h2:= h1 + 0.2*(p3 - p4);
h3:= h2 + 0.2*(p3 - p4);

draw p10..h3..p2;
draw p13..h2..p2;
draw p12..h1..p2;

triangleSize = 1.6u;
drawTriangle(p2, triangleSize, 0);
drawTriangle(p1, triangleSize, 25);
drawTriangle(p4, triangleSize,  -90);
drawTriangle(p10, triangleSize, -90);
endfig;

%%%(D,B)
beginfig(2)

pair p[];
p1:= (0, 0);
p2:= p1 + (5u, 0);
p3:= p1 rotatedabout(p2, -180 + 72);
p4:= p2 rotatedabout(p3, -180 + 72);
p5:= p2 rotatedabout(p1, 180 - 72);

p6:= p1 rotatedabout(p2, -90);
p7:= p2 rotatedabout(p1, 90);
p8:= (p1 + p2 + p6 + p7) / 4;
p9:= (p7 + p6) / 2;

p13:= p8 rotatedabout(p1, -90);
p13:= p13 + (0, 1u);
p10:= p13 + (-1.3u,-1.3u);
p11:= p13 rotatedabout(p10, -90);
p12:= p10 rotatedabout(p11, -90);

pickup pencircle scaled 14pt;
for i=1 upto 13: draw p[i]; endfor;

pickup pencircle scaled .9mm;

draw p1--p2--p3--p4--p5--p1;
draw p1--p7--p6--p2;

draw p1--p8--p7--p9--p8--p2;
draw p8--p6--p4--p9;
draw p5--p7--p4;
draw p6--p3;

draw p10--p11--p12--p13--p1--p10--p12--p2--p13--p10;

draw p4--(p4 + (0, 2u));
draw p5--(p5 + (-2u, 0));
draw p3--(p3 + (2u, 0));

pair h[];
h1:= p1 + (-1u, 0);
h2:= h1 + (-1u, 0);

h3:= p2 + (1u, 0);
h4:= h3 + (1u, 0);

h5:= p11 + (0, -1u);

draw p10..h1..p5;
draw p11..h2..p5;

draw p12..h3..p3;
draw p11..h4..p3;

draw p5..h5..p3;

triangleSize:= 1.6u;
drawTriangle(p5, triangleSize, 90);
drawTriangle(p3, triangleSize, 90);
drawTriangle(p4, triangleSize, 15);

endfig;

%%%%%%(E, B)
beginfig(3)

pair p[];
p1:= (0, 0);
p2:= p1 + (5u, 0);
p3:= p1 rotatedabout(p2, -180 + 72);
p4:= p2 rotatedabout(p3, -180 + 72);
p5:= p2 rotatedabout(p1, 180 - 72);

pair base;
base = (p1 + p2 + p3 + p4 + p5) / 5;

p6:= base + (-1.5u, 0u);
p7:= p6 rotatedabout(base, 90);
p8:= p7 rotatedabout(base, 90);
p9:= p8 rotatedabout(base, 90);

p10:= base + 1.3 * ((p1 + p5)/2 - base);
p12:= base + 2.0 * ((p1 + p5)/2 - base);

p11:= p10 rotatedabout((p12 + p10) / 2, 90);
p13:= p12 rotatedabout((p12 + p10) / 2, 90);

pickup pencircle scaled 14pt;
for i=1 upto 13: draw p[i]; endfor;

pickup pencircle scaled .9mm;
draw p1--p2--p3--p4--p5--p1;
draw p6--p7--p8--p9--p6--p8;
draw p1--p7--p2--p8--p3--p9--p4;
draw p9--p5--p6--p1;

draw p11--p5--p10--p1--p13;
draw p10--p11--p12--p13--p10;
draw p10--p12;

pair h[];
h1:= base + 1.3 * ((p5 + p4)/2 - base);
h2:= base + 1.5 * ((p5 + p4)/2 - base);

h3:= base + 1.3 * ((p2 + p1)/2 - base);
h4:= base + 1.5 * ((p2 + p1)/2 - base);
h5:= base + 2.4 * ((p5 + p1)/2 - base);

draw p11..h1..p4;
draw p12..h2..p4;
draw p13..h3..p2;
draw p12..h4..p2;
draw p4..h5..p2;

draw p4--(p4 + (0, 2u));
draw p2--(p2 + (2u, 0));

triangleSize:= 1.6u;

drawTriangle(p2, triangleSize, -70);
drawTriangle(p3, triangleSize, 0);
drawTriangle(p4, triangleSize, 30);

endfig;


%%%%%%%(F, B)
beginfig(4)

pair p[];
p1:= (0, 0);
p2:= p1 + (0u, -5u);
p3:= p1 rotatedabout(p2, -180 + 72);
p4:= p2 rotatedabout(p3, -180 + 72);
p5:= p2 rotatedabout(p1, 180 - 72);

pair base;
base := (p1 + p2 + p3 + p4 + p5) / 5;

p6:= base + (-1.5u, 0u);
p7:= p6 rotatedabout(base, 120);
p8:= p7 rotatedabout(base, 120);

p9:= p2 rotatedabout(p1, -90);
p10:= p1 rotatedabout(p2, 90);

pair bas;
bas:= (p9 + p10 + p1 + p2) / 4;

p11:= bas + (-1u, 0);

p12:= p11 rotatedabout(bas, 90);
p13:= p12 rotatedabout(bas, 90);
p14:= p13 rotatedabout(bas, 90);

pickup pencircle scaled 14pt;
for i=1 upto 14: draw p[i]; endfor;


pickup pencircle scaled .9mm;
draw p1--p2--p3--p4--p5--p1;
draw p6--p7--p8--p6;
draw p1--p6--p2--p7--p3;
draw p7--p4--p8--p5--p1--p8;
draw p1--p6;

draw p1--p9--p10--p2;
draw p11--p12--p13--p14--p11;
draw p9--p11--p10--p12--p2--p13--p1--p14--p9;
draw p14--p12;

draw p4--(p4 + (2u, 0));

pair h[];

h1:= p1 + (0u, 2u);
h2:= p2 + (0u, -2u);
draw p9..h1..p5;
draw p10..h2..p3;

triangleSize:= 1.6u;
drawTriangle(p3, triangleSize, -50);
drawTriangle(p5, triangleSize, 50);
drawTriangle(p4, triangleSize, -70);
drawTriangle(p9, triangleSize, 180);
drawTriangle(p10, triangleSize, 180);

endfig;

end;
end.
