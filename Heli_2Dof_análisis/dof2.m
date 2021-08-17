%Declaro variables

syms th(t) fi(t) lmc h m Jeqp Jeqy g 
dth= diff(th,t); 
dfi= diff(fi,t);
%g = 9.8;

%Definiendo el centro de masa

Xcm = (lmc*cos(th)+h*sin(th))*(cos(fi));
Ycm = (-lmc*cos(th)-h*sin(th))*(sin(fi));
Zcm = lmc*sin(th)-h*cos(th);

%Derivadas del centro de masa

dX=diff(Xcm, t);
dY=diff(Ycm, t);
dZ=diff(Zcm, t);

%dX= diff(Xcm,th)+diff(Xcm,fi);
%dY= diff(Ycm,th)+diff(Ycm,fi);
%dZ= diff(Zcm,th)+diff(Zcm,fi);
%dX= diff(diff(Xcm,th),fi);
%dY= diff(diff(Ycm,th),fi);
%dZ= diff(diff(Zcm,th),fi);

%%%%%%%%%Lagrange%%%%%%%%%%%%%
%Energía cinética
Trp = (1/2)*Jeqp*(dth)^2;
Try = (1/2)*Jeqy*(dfi)^2;
Ttras = (1/2)*m*(dX^2+dY^2+dZ^2);

T = Trp+Try+Ttras;
%X= simplify(T);
%pretty(X);
%latex(X)

%Energía potencial
V = m*g*Zcm;

%Lagrangiano
L = T-V;

%Torque
syms Kpp Vmp Fcpp Kpy Vmy Fcpy  Kyp Fcyp Kyy Fcyy 
syms Bp By t

tp = (Kpp*Vmp+Fcpp)+(Kpy*Vmy+Fcpy);
ty = (Kyp*Vmp+Fcyp)*cos(th)+(Kyy*Vmy+Fcyy)*cos(th);

Q1= tp-Bp*dth;
Q2= ty-By*dfi;

%Euler-Lagrange
diff(diff(L,dth),t) - diff(L,th) == Q1;
diff(diff(L,dfi),t) - diff(L,fi) == Q2;
