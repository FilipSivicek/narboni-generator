input mpcolornames

prologues:=3;

def drawArrow(expr pos, len) =
    begingroup
        pair endpoint;
        endpoint := pos + 0.8(len, 0);

        pair tip;
        tip := pos + (len, 0);

        pair left;
        pair right;

        left = endpoint rotatedabout(tip, 40);
        right = endpoint rotatedabout(tip, -40);

        draw left -- tip;
        draw pos -- tip;
        draw right -- tip;
    endgroup;
enddef;

def AngledArrow(expr pos, len, ANGLE) = 
    begingroup
        pair tipbase;
        tipbase:= pos + (len, 0);

        pair tip;
        tip:= tipbase rotatedabout(pos, ANGLE);

        pair endpoint;
        endpoint:= pos + 0.8(tip - pos);

        pair left;
        pair right;

        left = endpoint rotatedabout(tip, 40);
        right = endpoint rotatedabout(tip, -40);

        draw left -- tip;
        draw pos -- tip;
        draw right -- tip;
    endgroup;
enddef;

def drawTriangle(expr pos, len, ANGLE) = 
    begingroup
        pair endpoint;
        endpoint := pos + (len, 0);
        
        pair top;
        top:= endpoint + (0, len/4);

        pair bot;
        bot:= endpoint + (0, -len/4);

        top:= top rotatedabout (pos, ANGLE);
        bot:= bot rotatedabout (pos, ANGLE);

        draw pos--bot--top--pos;
    endgroup;
enddef;

def drawNGon(expr pos, num, NGONLENGTH, initialAngle) =
    begingroup
        numeric ANGLE;
        ANGLE = 360 / num;

        pair baseNgon;
        baseNgon:= pos + (0, -NGONLENGTH);
        pair NGONPOINTS[];
        pair hlp;

        pickup pencircle scaled .9mm;
        for i=1 upto num:
            NGONPOINTS[i]:= baseNgon rotatedabout(pos, initialAngle + ANGLE * i);
        endfor;

        draw NGONPOINTS[num]--NGONPOINTS1;
        for i=2 upto num: draw NGONPOINTS[i]--NGONPOINTS[i-1]; endfor;

        pickup pencircle scaled 14pt;
        for i=1 upto num: draw NGONPOINTS[i]; endfor;

    endgroup;
enddef;

def drawLine(expr pos, distance, len, ANGLE) = 
    begingroup
        pair START;
        START:= pos + (0, -distance);
        pair END;
        END:= pos + (0, -distance - len);

        pair p[];
        p1:= START rotatedabout(pos, ANGLE);
        p2:= END rotatedabout(pos, ANGLE);

        pickup pencircle scaled 0.9mm;
        draw p1--p2;

    endgroup;
enddef; 

numeric LabelScale;
LabelScale:= 5;

u:=10mm;
d = 2u;
s = 2.5u;

beginfig(1)

pair orig;
orig:= (0,0);

pair base;
base:= orig + (0, -3u);

drawNGon((0,0), 3, 3u, -60);

pair p[];
for i=1 upto 3: p[i]:= base rotatedabout(orig, -60 + 120 * i); endfor;

pickup pencircle scaled 14pt;
draw orig;

pickup pencircle scaled .9mm;
for i=1 upto 3: draw p[i]--orig; endfor;

drawArrow(((p1+p3)/2 + p2)/2 + (4u, 0), 5u);
LabelScale:= 3;
label.top(btex $E_3, E_4$ etex scaled LabelScale, ((p1+p3)/2 + p2)/2 + (6.5u, 0));

orig:= orig + (13u, 0);

for i=1 upto 3: p[i]:= p[i] + (13u, 0); endfor;

pair mid;
mid:= (p1 + p3)/2;
p4:= mid + (p2 - mid) / 3;
p5:= mid + 2/3*(p2 - mid);
pickup pencircle scaled 14pt;
draw p4;
draw p5;

pickup pencircle scaled .9mm;
draw p4--p2;
draw p1--p4--p3--p5--p1;

drawNGon(orig, 3, 3u, -60);

endfig;

beginfig(2)

pair origA;
origA:= (0,0);

pair origB;
origB:= (0, -20u);

numeric lenSmaller;
lenSmaller:= 3u;
numeric lenBigger;
lenBigger:= 10u;

drawNGon(origA, 3, lenSmaller, -120);
drawNGon(origA, 3, lenBigger, -60);

pair pa[];

for i=1 upto 3: pa[i]:= (origA + (0, -lenSmaller)) rotatedabout (origA, -120 + i * 120); endfor;
for i=4 upto 6: pa[i]:= (origA + (0, -lenBigger)) rotatedabout(origA, -60 + i * 120); endfor;

pickup pencircle scaled .9mm;
draw pa6--pa1--pa4--pa2--pa5--pa3--pa6;

LabelScale:= 5;
labeloffset:= 5bp;
label.urt(btex $v_1$ etex scaled LabelScale, pa3 + (0.5u, 0));
label.rt(btex $v_2$ etex scaled LabelScale, pa5);

lenSmaller:= 4.5u;
drawNGon(origB, 3, lenSmaller, -60);
drawNGon(origB, 3, lenBigger, -60);

pair pb[];

for i=1 upto 3: pb[i]:= (origB + (0, -lenSmaller)) rotatedabout (origB, -60 + i * 120); endfor;
for i=4 upto 6: pb[i]:= (origB + (0, -lenBigger)) rotatedabout(origB, -60 + i * 120); endfor;

pickup pencircle scaled 0.9mm;
draw pb6--pb3--pb4--pb1--pb5--pb2--pb3--pb5;

labeloffset:= 14bp;
label.bot(btex $v_1$ etex scaled LabelScale, pb3);
label.bot(btex $v_2$ etex scaled LabelScale, pb2 + (0, -0.8u));

AngledArrow((13u, 3u), 13u, -20);
AngledArrow((13u, -17u), 13u, 20);

label(btex $E_4(v_1v_2)$ etex scaled LabelScale, (13u, 3u) + (5u, 1u)) rotatedabout ((13u, 3u), -20);
label(btex $E_5(v_1v_2)$ etex scaled LabelScale, (13u, -17u) + (5u, 1u)) rotatedabout ((13u, -17u), 20);

pair origC;
origC:= (origA + origB)/2 + (40u, 0u); 

pair pc[];
lenSmaller:= 3u;
drawNGon(origC, 4, lenSmaller, -90);
drawNGon(origC, 3, lenBigger, -60);

for i=1 upto 4: pc[i]:= (origC + (0, -lenSmaller)) rotatedabout (origC, -90 + i * 90); endfor;
for i=5 upto 7: pc[i]:= (origC + (0, -lenBigger)) rotatedabout(origC, -60 + (i-4) * 120); endfor;

pickup pencircle scaled 0.9mm;
draw pc7--pc1--pc5--pc2--pc6--pc3--pc1;
draw pc7--pc4--pc6;

endfig;

end;
end.

