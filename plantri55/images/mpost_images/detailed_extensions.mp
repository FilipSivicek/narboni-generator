input mpcolornames

prologues:=3;

def drawTriangle(expr pos, len, angle) = 
    begingroup
        pair endpoint;
        endpoint := pos + (len, 0);
        
        pair top;
        top:= endpoint + (0, len/4);

        pair bot;
        bot:= endpoint + (0, -len/4);

        top:= top rotatedabout (pos, angle);
        bot:= bot rotatedabout (pos, angle);

        draw pos--bot--top--pos;
    endgroup;
enddef;

numeric LabelScale;
LabelScale:= 4;
numeric LabelEScale;
LabelEScale:= 4;

u:= 5mm;
d = 2u;
s = 2.5u;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detailed E_B
beginfig(1);

pair p[];
p[1]:= (0, 0);
p[2]:= p[1] + (8u, -8u);
p[3]:= p[2] + (8u, 8u);
p[4]:= p[3] + (-8u, 8u);

p[5]:= p[1] + (2.5u, 0);
p[6]:= p[2] + (0, 2.5u);
p[7]:= p[3] + (-2.5u, 0);
p[8]:= p[4] + (0, -2.5u);

p9:= (p1+p3)/2;

path q;
q:=p9..p8;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

pickup pencircle scaled 14pt;
for i:=5,6,7,8,9: draw p[i]; endfor;

pickup pencircle scaled .9mm;
for i:=1,2,3,4: draw p[i]--p[i+4]--p[9]; endfor;

draw p[5]--p[6]--p[7]--p[8]--p[5];

for i:= 1,2,3,4: drawTriangle(p[i + 4], 2u, 45 + i*90); endfor;


labeloffset:= 10bp;
label.lft(btex e etex scaled LabelEScale, (p8+p9)/2);
endfig;

beginfig(2)

pair p[];
p[1]:= (0, 0);
p[2]:= p[1] + (8u, -8u);
p[3]:= p[2] + (8u, 8u);
p[4]:= p[3] + (-8u, 8u);

p[5]:= p[1] + (2.5u, 0);
p[6]:= p[2] + (0, 2.5u);
p[7]:= p[3] + (-2.5u, 0);
p[8]:= p[4] + (0, -2.5u);

p9:= (p1+p3)/2;
p10:= (p5+p6+p9)/3;

path q;
q:=p9..p8;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

pickup pencircle scaled 14pt;
for i:=5,6,7,8,9,10: draw p[i]; endfor;

pickup pencircle scaled .9mm;
for i:=1,2,3,4: draw p[i]--p[i+4]--p[9]; endfor;

draw p[5]--p[6]--p[7]--p[8]--p[5];
draw p5--p10--p6;
draw p9--p10;

for i:= 1,2,3,4: drawTriangle(p[i + 4], 2u, 45 + i*90); endfor;

label.lft(btex e etex scaled LabelEScale, (p8+p9)/2);

endfig;

beginfig(3)

pair p[];
p[1]:= (0, 0);
p[2]:= p[1] + (8u, -8u);
p[3]:= p[2] + (8u, 8u);
p[4]:= p[3] + (-8u, 8u);

p[5]:= p[1] + (2.5u, 0);
p[6]:= p[2] + (0, 2.5u);
p[7]:= p[3] + (-2.5u, 0);
p[8]:= p[4] + (0, -2.5u);

p9:= (p1+p3)/2;
p10:= (p5+p6+p9)/3;

p11:=(p9+p6)/2;

path q;
q:=p9..p8;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

pickup pencircle scaled 14pt;
for i:=5,6,7,8,9,10,11: draw p[i]; endfor;

pickup pencircle scaled .9mm;
for i:=1,2,3,4: draw p[i]--p[i+4]--p[9]; endfor;

draw p[5]--p[6]--p[7]--p[8]--p[5];
draw p5--p10--p6;
draw p9--p10--p11--p7;

for i:= 1,2,3,4: drawTriangle(p[i + 4], 2u, 45 + i*90); endfor;

label.lft(btex e etex scaled LabelEScale, (p8+p9)/2);

endfig;

beginfig(4)

pair p[];
p[1]:= (0, 0);
p[2]:= p[1] + (8u, -8u);
p[3]:= p[2] + (8u, 8u);
p[4]:= p[3] + (-8u, 8u);

p[5]:= p[1] + (2.5u, 0);
p[6]:= p[2] + (0, 2.5u);
p[7]:= p[3] + (-2.5u, 0);
p[8]:= p[4] + (0, -2.5u);

p9:= (p1+p3)/2;
p10:= (p5+p6+p9)/3;

p11:=(p9+p6)/2;

pair middle;
middle = (p[1] + p[3])/2;

p[9]:= middle + (-1.2u, -1.2u);
p[10]:= middle + (1.2u, -1.2u);
p[11]:= middle + (1.2u,1.2u);
p[12]:= middle + (-1.2u,1.2u);

pickup pencircle scaled 14pt;
for i:=5,6,7,8,9,10,11,12: draw p[i]; endfor;

pickup pencircle scaled .9mm;
for i:=1,2,3,4: draw p[i]--p[i+4]--p[i+8]; endfor;

draw p[12]--p[5];

pickup pencircle scaled .9mm;
for i:=6,7,8: draw p[i]--p[i+3]; endfor;

draw p[9]--p[10]--p[11]--p[12]--p[9];
draw p[12]--p[10];

draw p[5]--p[6]--p[7]--p[8]--p[5];

for i:= 1,2,3,4: drawTriangle(p[i + 4], 2u, 45 + i*90); endfor;

q:=p12..p8;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

labeloffset:=15bp;
label.lft(btex e etex scaled LabelEScale, (p8+p9)/2);
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detailed E_F
beginfig(5)
pair base;
base:= (0,0);

pair basePent;
basePent:= base + (0, -5u);

pair baseTrian;
baseTrian:= base + (0, -2u);

pair p[];

for i=1 upto 3: p[i]:= baseTrian rotatedabout(base, -120 + 120 * i); endfor;
for i=1 upto 5: p[i+3]:= basePent rotatedabout(base, -36 + 72 * i); endfor;
p9:= p4 + (0, -1.8u);
p10:= p9 rotatedabout(p4, 25);

p11:= p6 + (0, 2u);
p12:= p7 + (-2u, 0);
p13:= p8 + (0,-2u);
p14:= p13 rotatedabout(p8, -25);
p15:= p5 + (2u, 0);
p16:= p11 rotatedabout(p6, -12.5);
p17:= p11 rotatedabout(p6, 12.5);

pickup pencircle scaled 14pt;
for i=4 upto 8: draw p[i]; endfor;
draw base;

pickup pencircle scaled .9mm;
draw p4--p5--p6--p7--p8--p4;

for i=1 upto 5: draw p[i+3]--base; endfor;

draw p12--p7;

draw p16--p6--p17;
draw p9--p4--p10;
draw p13--p8--p14;
draw p15--p5;

drawTriangle(p5, 1.4u, 65);
drawTriangle(p6, 1.4u, 35);
drawTriangle(p7, 1.4u, 115);
drawTriangle(p8, 1.4u, 310);
drawTriangle(p4, 1.4u, -130);

path q;
q:=base..p6;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

labeloffset:=10bp;
label.lft(btex e etex scaled LabelEScale, (base + p6)/2);
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(6)

pair base;
base:= (0,0);

pair basePent;
basePent:= base + (0, -5u);

pair baseTrian;
baseTrian:= base + (0, -2u);

pair p[];

for i=1 upto 3: p[i]:= baseTrian rotatedabout(base, -120 + 120 * i); endfor;
for i=1 upto 5: p[i+3]:= basePent rotatedabout(base, -36 + 72 * i); endfor;
p9:= p4 + (0, -1.8u);
p10:= p9 rotatedabout(p4, 25);

p11:= p6 + (0, 2u);
p12:= p7 + (-2u, 0);
p13:= p8 + (0,-2u);
p14:= p13 rotatedabout(p8, -25);
p15:= p5 + (2u, 0);
p16:= p11 rotatedabout(p6, -12.5);
p17:= p11 rotatedabout(p6, 12.5);

pair new;
new:= (base + p4 + p8)/3;

pickup pencircle scaled 14pt;
for i=4 upto 8: draw p[i]; endfor;
draw base;
draw new;

pickup pencircle scaled .9mm;
for i=4 upto 8: draw p[i]--base; endfor;
draw p4--p5--p6--p7--p8--p4;
draw base--new--p4;
draw new--p8;

draw p12--p7;

draw p16--p6--p17;
draw p9--p4--p10;
draw p13--p8--p14;
draw p15--p5;

drawTriangle(p5, 1.4u, 65);
drawTriangle(p6, 1.4u, 35);
drawTriangle(p7, 1.4u, 115);
drawTriangle(p8, 1.4u, 310);
drawTriangle(p4, 1.4u, -130);

q:=base..p6;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

labeloffset:= 10bp;
label.lft(btex e etex scaled LabelEScale, (base + p6)/2);
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(7)

pair base;
base:= (0,0);

pair basePent;
basePent:= base + (0, -5u);

pair baseTrian;
baseTrian:= base + (0, -2u);

pair p[];

for i=1 upto 3: p[i]:= baseTrian rotatedabout(base, -120 + 120 * i); endfor;
for i=1 upto 5: p[i+3]:= basePent rotatedabout(base, -36 + 72 * i); endfor;
p9:= p4 + (0, -1.8u);
p10:= p9 rotatedabout(p4, 25);

p11:= p6 + (0, 2u);
p12:= p7 + (-2u, 0);
p13:= p8 + (0,-2u);
p14:= p13 rotatedabout(p8, -25);
p15:= p5 + (2u, 0);
p16:= p11 rotatedabout(p6, -12.5);
p17:= p11 rotatedabout(p6, 12.5);

pair new;
new:= (base + p4 + p8)/3;

pickup pencircle scaled 14pt;
for i=1 upto 8: draw p[i]; endfor;

pickup pencircle scaled .9mm;
draw p4--p5--p6--p7--p8--p4;

draw p12--p7;
draw p1--p2--p3--p1;

draw p8--p1--p4--p2--p5;
draw p2--p6--p3;
draw p7--p3--p8;

draw p16--p6--p17;
draw p9--p4--p10;
draw p13--p8--p14;
draw p15--p5;

drawTriangle(p5, 1.4u, 65);
drawTriangle(p6, 1.4u, 35);
drawTriangle(p7, 1.4u, 115);
drawTriangle(p8, 1.4u, 310);
drawTriangle(p4, 1.4u, -130);

q:=p3..p6;

pickup pencircle scaled 2mm;
draw q;
ahlength:= 16bp;
drawarrow subpath (0, 0.7 * length(q)) of q;

labeloffset:=3bp;
label.ulft(btex e etex scaled LabelEScale, p3 + 0.12*(p6 - p3));

endfig

end;
end.
