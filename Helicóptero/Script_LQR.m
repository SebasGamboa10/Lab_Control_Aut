% --> LQR <---

A = Heli_ss.A;
B = Heli_ss.B;
C = Heli_ss.C;
D = Heli_ss.D;

Q = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 20 0;0 0 0 0 0 50];
R = [1/15 0; 0 1/10];

%K = lqr(A,B,Q,R);

%ceros es matriz de ceros
ceros=zeros(length(A),2); %El numero de columnas de la matriz de ceros

As = [A ceros; -C [0 0; 0 0]];
Bs = [B; [0 0;0 0]];

Ks = lqr(As,Bs,Q,R)

%Siempre hay que analizar el caso
K_LQR = Ks(:,[1:4])
Ki_LQR = -Ks(:,[5:6])


