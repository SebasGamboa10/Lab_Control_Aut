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

%%%%%%%%%%%%%%%%%%% Modelo Espacio de Estados %%%%%%%%%%%%%%%%%%%%%%%%%

%Definiendo constantes

Fcpp = Fcpy = Fcyp = Fcyy = 0;
Kpp = 0.02638; %N.m/V
Kpy = 0.00189; %N.m/V
Kyp = 0.002096; %N.m/V
Kyy = 0.01871; %N.m/V
Bp = 0.01325; %N/V
By = 0.8513; %N/V
Jeqp = 0.0332; %kg.m^2
Jeqy = 0.0371; %kg.m^2
lmc = 0.0122; %m
h = 0.00714; %m
m = 1.3872; %kg

%Definiendo pasos intermedios de simplificación

%Definiendo matrices

A= [0 0 1 0; 0 0 0 1; ]


