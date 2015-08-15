function [x, y] = torchic_curve(t)
%returns the x-y parametrisation of torchic, for t from 0 to 48pi
%input is accepted as radians
%for scaling purposes, the bounding box is x:[-570, 445] and y:[-752, 722]
%an output of [0, 0] signifies that nothing is to be drawn

x = ((-13/5*sin(1/26-15*t)-14/5*sin(1/4-13*t)-5/6*sin(3/4-11*t)-23/5*sin(5/4-6*t)-178/5*sin(3/2-2*t)+2850/11*sin(t+22/5)+37/4*sin(3*t+32/7)+41/4*sin(4*t+22/5)+31/10*sin(5*t+13/5)+2*sin(7*t+23/6)+4*sin(8*t+19/5)+8/5*sin(9*t+3)+7/3*sin(10*t+8/3)+17/5*sin(12*t+8/3)+16/5*sin(14*t+3)+17/5*sin(16*t+67/22)+7/2*sin(17*t+1/4)+9/4*sin(18*t+24/7)+25/13*sin(19*t+1/3)+1153/6)*heaviside(47*pi-t)*heaviside(t-43*pi)+(-8/7*sin(1/2-12*t)-5/4*sin(1/4-4*t)+1799/5*sin(t+2/3)+104/5*sin(2*t+17/4)+625/26*sin(3*t+9/2)+2*sin(5*t+17/4)+31/10*sin(6*t+9/4)+22/5*sin(7*t+10/3)+17/6*sin(8*t+17/5)+22/7*sin(9*t+35/9)+14/5*sin(10*t+14/3)+8/7*sin(11*t+13/3)+4/3*sin(13*t+17/8)+2/3*sin(14*t+2/5)+4/3*sin(15*t+14/5)+1/2*sin(16*t+1/2)+3/5*sin(17*t+17/5)+2/5*sin(18*t+1/4)+1/3*sin(19*t+10/3)-34)*heaviside(43*pi-t)*heaviside(t-39*pi)+(-sin(1/2-25*t)-73/12*sin(7/5-19*t)-3/2*sin(1/7-9*t)-13/4*sin(1/5-6*t)-5*sin(4/5-3*t)+9/7*sin(t+5/3)+52/17*sin(2*t+7/3)+16/5*sin(4*t+7/2)+20/7*sin(5*t+19/5)+7/3*sin(7*t+23/5)+32/7*sin(8*t+20/19)+41/20*sin(10*t+2)+23/11*sin(11*t+1/16)+27/4*sin(12*t+31/7)+14/3*sin(13*t+11/4)+18/7*sin(14*t+1/10)+45/7*sin(15*t+3/2)+48/5*sin(16*t+5/6)+9/4*sin(17*t+19/5)+23/4*sin(18*t+25/7)+18/5*sin(20*t+2)+37/6*sin(21*t+23/6)+12/5*sin(22*t+14/3)+18/5*sin(23*t+7/2)+2/3*sin(24*t+10/3)-998/5)*heaviside(39*pi-t)*heaviside(t-35*pi)+(-7/4*sin(1/2-24*t)-21/11*sin(5/4-23*t)-29/6*sin(9/8-21*t)-11/7*sin(1/4-19*t)-27/5*sin(1-14*t)-3/4*sin(2/3-9*t)-5/2*sin(1/3-7*t)-17/5*sin(1-6*t)-9/5*sin(4/3-t)+7/4*sin(2*t+25/13)+2/3*sin(3*t+9/5)+4*sin(4*t+35/17)+10/9*sin(5*t+22/7)+6/5*sin(8*t+5/4)+41/20*sin(10*t+17/7)+85/21*sin(11*t+11/4)+41/10*sin(12*t+5/4)+9/2*sin(13*t+3/4)+20/7*sin(15*t+21/5)+49/5*sin(16*t+7/3)+19/3*sin(17*t+14/5)+46/7*sin(18*t+9/2)+10/9*sin(20*t+25/13)+5/7*sin(22*t+18/5)+10/3*sin(25*t+19/6)+985/6)*heaviside(35*pi-t)*heaviside(t-31*pi)+(257/4*sin(t+4/5)-1963/9)*heaviside(31*pi-t)*heaviside(t-27*pi)+(176/3*sin(t+9/4)+1296/7)*heaviside(27*pi-t)*heaviside(t-23*pi)+(-3/5*sin(18/17-17*t)-sin(1/9-15*t)-8/5*sin(1/2-13*t)-62/7*sin(2/3-5*t)-67/3*sin(1-4*t)-383/4*sin(4/5-t)+207/8*sin(3*t)+293/4*sin(2*t+7/5)+6/7*sin(6*t+13/4)+14/3*sin(7*t+11/5)+29/7*sin(8*t+15/4)+17/8*sin(9*t+21/5)+19/9*sin(10*t+20/7)+8/5*sin(11*t+4/3)+6/5*sin(12*t+8/5)+2/5*sin(14*t+3/4)+1/5*sin(16*t+4/3)+sin(18*t+13/3)+3/4*sin(19*t+7/6)+2/5*sin(20*t+29/7)+10/7*sin(21*t+2)+5/6*sin(22*t+69/17)-599/10)*heaviside(23*pi-t)*heaviside(t-19*pi)+(-3/7*sin(12/13-21*t)-1/2*sin(1/10-19*t)-4/7*sin(3/4-15*t)-9/4*sin(1/3-14*t)-16/5*sin(2/3-13*t)-7/6*sin(1/11-10*t)+578/5*sin(t+19/5)+204/5*sin(2*t+3/5)+35/4*sin(3*t+9/4)+87/2*sin(4*t+13/4)+170/13*sin(5*t+12/5)+99/7*sin(6*t+15/8)+42/5*sin(7*t+14/3)+25/4*sin(8*t+1/14)+31/5*sin(9*t+9/2)+17/7*sin(11*t+9/2)+5/4*sin(12*t+1)+5/3*sin(16*t+18/7)+4/3*sin(17*t+3/2)+5/4*sin(18*t+2)+3/4*sin(20*t+13/12)+1655/8)*heaviside(19*pi-t)*heaviside(t-15*pi)+(-7/2*sin(2/5-10*t)-41/5*sin(3/4-7*t)-5/3*sin(2/3-6*t)+744/5*sin(t+15/4)+98/5*sin(2*t+9/4)+45/7*sin(3*t+13/4)+113/16*sin(4*t+1)+54/7*sin(5*t+1/2)+46/5*sin(8*t+3/7)+7/2*sin(9*t+65/16)+15/2*sin(11*t+8/5)+16/7*sin(12*t+7/5)+1173/5)*heaviside(15*pi-t)*heaviside(t-11*pi)+(-1/2*sin(3/4-16*t)-1/4*sin(5/4-14*t)-3/5*sin(16/15-12*t)-12/5*sin(3/4-11*t)-29/5*sin(1/2-3*t)+959/10*sin(t+1/3)+17/3*sin(2*t+15/4)+19/3*sin(4*t+26/9)+13/4*sin(5*t+17/4)+16/3*sin(6*t+1/4)+4*sin(7*t+17/8)+4*sin(8*t+14/3)+13/5*sin(9*t+7/2)+11/5*sin(10*t+9/5)+6/5*sin(13*t+18/7)+1/3*sin(15*t+7/3)+3/4*sin(17*t+25/7)-391/3)*heaviside(11*pi-t)*heaviside(t-7*pi)+(-1/12*sin(4/5-12*t)-1/8*sin(3/2-10*t)-2443/22*sin(7/5-t)+31/4*sin(2*t+17/6)+17/2*sin(3*t+9/2)+15/4*sin(4*t+19/5)+11/4*sin(5*t+14/3)+sin(6*t+25/7)+8/7*sin(7*t+7/2)+3/5*sin(8*t+4)+9/10*sin(9*t+17/5)+2/3*sin(11*t+23/8)+166/5)*heaviside(7*pi-t)*heaviside(t-3*pi)+(-sin(1/3-23*t)-3/5*sin(1/7-19*t)-8/9*sin(2/3-15*t)-29/6*sin(1/7-8*t)+1056/5*sin(t+23/5)+141/4*sin(2*t+2/5)+77/2*sin(3*t+8/3)+281/6*sin(4*t+17/8)+454/13*sin(5*t+2)+13/6*sin(6*t+10/7)+39/4*sin(7*t+3/2)+13/5*sin(9*t+18/7)+47/5*sin(10*t+4/3)+17/5*sin(11*t+1/3)+35/6*sin(12*t+13/3)+60/7*sin(13*t+3)+17/5*sin(14*t+9/8)+19/10*sin(16*t+23/6)+17/6*sin(17*t+13/5)+17/4*sin(18*t+7/4)+1/3*sin(20*t+7/2)+4/3*sin(21*t+10/3)+5/4*sin(22*t+9/5)+7/8*sin(24*t+24/7)-1414/5)*heaviside(3*pi-t)*heaviside(t+pi))*heaviside(sqrt(sign(sin(t/2))));
y = ((-2/5*sin(3/2-19*t)-12/5*sin(3/2-16*t)-20/7*sin(1/9-15*t)-2*sin(5/6-11*t)-28/5*sin(7/6-4*t)-27/4*sin(1/2-3*t)-213*sin(13/14-t)+7/4*sin(13*t)+71/2*sin(2*t+25/24)+74/7*sin(5*t+7/3)+13/3*sin(6*t+1/5)+39/5*sin(7*t+11/5)+23/3*sin(8*t+1/2)+2/3*sin(9*t+5/3)+13/5*sin(10*t+1/3)+1/3*sin(12*t+7/2)+1/3*sin(14*t+22/5)+19/18*sin(17*t+14/3)+sin(18*t+33/8)-297)*heaviside(47*pi-t)*heaviside(t-43*pi)+(-3/5*sin(1/3-15*t)-3/5*sin(9/8-14*t)-1/4*sin(3/5-13*t)-3/4*sin(1/5-10*t)-7/4*sin(2/5-9*t)-8/7*sin(3/2-8*t)-2/5*sin(3/4-4*t)-2295/7*sin(6/7-t)+51/5*sin(2*t+11/4)+131/10*sin(3*t+70/23)+29/6*sin(5*t+10/9)+9/8*sin(6*t+25/6)+7/4*sin(7*t+5/2)+3/2*sin(11*t+2/5)+1/3*sin(12*t+3)+2/5*sin(16*t+13/7)+5/7*sin(17*t+14/5)+11/12*sin(18*t+31/8)+4/3*sin(19*t+73/18)+221/7)*heaviside(43*pi-t)*heaviside(t-39*pi)+(-4/7*sin(8/7-24*t)-4*sin(7/5-23*t)-34/5*sin(3/5-21*t)-34/5*sin(8/7-18*t)-17/6*sin(22/21-17*t)-27/4*sin(1/2-12*t)-17/8*sin(2/5-5*t)-9/5*sin(1/2-4*t)-14/5*sin(10/11-2*t)+15/4*sin(22*t)+10/3*sin(t+18/5)+2*sin(3*t+19/5)+14/3*sin(6*t+3/7)+9/5*sin(7*t+3/2)+26/9*sin(8*t+7/3)+2*sin(9*t+8/3)+11/3*sin(10*t+10/3)+3/2*sin(11*t+8/7)+96/19*sin(13*t+22/5)+12/5*sin(14*t+7/5)+32/5*sin(15*t+3)+21/2*sin(16*t+5/2)+113/16*sin(19*t+1/16)+14/3*sin(20*t+24/7)+sin(25*t+5/4)+57)*heaviside(39*pi-t)*heaviside(t-35*pi)+(-31/4*sin(1/3-18*t)-47/16*sin(2/5-15*t)-51/13*sin(8/7-10*t)+5/3*sin(7*t)+13/7*sin(t+8/3)+3/2*sin(2*t+61/15)+8/3*sin(3*t+7/3)+14/5*sin(4*t+24/7)+9/5*sin(5*t+24/7)+11/7*sin(6*t+2/3)+1/2*sin(8*t+10/7)+5/3*sin(9*t+2)+17/5*sin(11*t+17/4)+8/3*sin(12*t+43/14)+29/6*sin(13*t+11/5)+24/5*sin(14*t+1/2)+111/11*sin(16*t+51/13)+33/5*sin(17*t+13/3)+7/4*sin(19*t+6/5)+1/2*sin(20*t+14/3)+5*sin(21*t+1/2)+13/7*sin(22*t+21/5)+11/6*sin(23*t+2/5)+8/3*sin(24*t+1/2)+17/5*sin(25*t+9/2)+757/5)*heaviside(35*pi-t)*heaviside(t-31*pi)+(47/2-281/4*sin(2/3-t))*heaviside(31*pi-t)*heaviside(t-27*pi)+(235/4*sin(t+39/10)+787/6)*heaviside(27*pi-t)*heaviside(t-23*pi)+(-3/4*sin(7/8-18*t)-5/6*sin(3/4-16*t)-5/6*sin(3/4-15*t)-7/3*sin(2/3-11*t)-29/3*sin(5/7-5*t)-40/3*sin(3/4-3*t)+34*sin(t+4)+309/10*sin(2*t+3/4)+9/2*sin(4*t+22/5)+10*sin(6*t+4/3)+64/7*sin(7*t+3/4)+36/5*sin(8*t+13/5)+36/7*sin(9*t+7/2)+8/3*sin(10*t+55/18)+6/5*sin(12*t+5/4)+8/5*sin(13*t+22/5)+11/12*sin(14*t+5/3)+2/3*sin(17*t+39/10)+3/5*sin(19*t+5/2)+sin(20*t+1/6)+1/2*sin(21*t+17/9)+1/2*sin(22*t+8/3)-5392/9)*heaviside(23*pi-t)*heaviside(t-19*pi)+(-9/10*sin(4/3-19*t)-23/11*sin(2/3-15*t)-19/5*sin(3/5-12*t)-31/3*sin(1/3-7*t)-495/7*sin(4/3-t)+7/8*sin(18*t)+263/6*sin(2*t+7/5)+51/4*sin(3*t+101/25)+59/2*sin(4*t+20/7)+92/3*sin(5*t+11/3)+28/3*sin(6*t+9/4)+24/5*sin(8*t+13/5)+9/4*sin(9*t+15/7)+27/5*sin(10*t+3/4)+7/2*sin(11*t+15/4)+15/7*sin(13*t+1)+5/3*sin(14*t+10/11)+2/5*sin(16*t+5/2)+5/3*sin(17*t+25/7)+sin(20*t+8/3)+9/8*sin(21*t+16/5)-2455/4)*heaviside(19*pi-t)*heaviside(t-15*pi)+(-17/4*sin(7/5-5*t)-137/7*sin(3/2-3*t)+951/8*sin(t+14/3)+82/5*sin(2*t+5/4)+17/3*sin(4*t+16/7)+23/4*sin(6*t+2)+13/2*sin(7*t+43/14)+19/4*sin(8*t+8/3)+7/6*sin(9*t+19/6)+3/5*sin(10*t+13/5)+11/6*sin(11*t+13/3)+7/5*sin(12*t+25/6)-1072/5)*heaviside(15*pi-t)*heaviside(t-11*pi)+(-1/8*sin(1/8-15*t)-33/16*sin(10/11-12*t)-13/3*sin(1-11*t)-23/2*sin(1/3-2*t)-357/5*sin(13/12-t)+39/4*sin(3*t+29/7)+29/3*sin(4*t+20/7)+21/4*sin(5*t+25/6)+9/5*sin(6*t+8/5)+18/5*sin(7*t+2)+37/7*sin(8*t+4)+25/4*sin(9*t+27/7)+8/5*sin(10*t+7/3)+4/3*sin(13*t+2)+4/5*sin(14*t+10/3)+1/4*sin(16*t+23/5)+5/6*sin(17*t+4)-1285/4)*heaviside(11*pi-t)*heaviside(t-7*pi)+(-9/10*sin(17/16-7*t)-29/6*sin(5/4-3*t)+353/5*sin(t+15/4)+65/6*sin(2*t+23/5)+22/5*sin(4*t+5/2)+5/4*sin(5*t+15/4)+4/3*sin(6*t+3)+7/5*sin(8*t+12/5)+2/7*sin(9*t+4/3)+2/3*sin(10*t+17/5)+1/3*sin(11*t+1/5)+3/4*sin(12*t+8/3)-16)*heaviside(7*pi-t)*heaviside(t-3*pi)+(-8/5*sin(1/5-24*t)-4/3*sin(3/4-20*t)-5/6*sin(1/3-19*t)-28/9*sin(7/8-17*t)-67/5*sin(1-10*t)-69/5*sin(1/6-7*t)-398/7*sin(4/5-4*t)+17/3*sin(12*t)+499/3*sin(t+13/4)+62*sin(2*t+7/2)+203/12*sin(3*t+14/5)+142/5*sin(5*t+7/6)+26/3*sin(6*t+17/4)+20/3*sin(8*t+13/4)+15/4*sin(9*t+5/2)+23/3*sin(11*t+17/7)+13/4*sin(13*t+17/5)+39/10*sin(14*t+3/4)+5/6*sin(15*t+19/5)+3/5*sin(16*t+10/3)+13/6*sin(18*t+4/3)+15/14*sin(21*t+13/7)+5/4*sin(22*t+35/9)+1/5*sin(23*t+8/5)+3209/7)*heaviside(3*pi-t)*heaviside(t+pi))*heaviside(sqrt(sign(sin(t/2))));
