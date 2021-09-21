% --> LQR <---

A = [-0.1456 4.141; -4.141 -0.1456];
B = [0;1.966];
C = [1.388 0];
D = 0;

Q = eye(3);
R = 1;

%K = lqr(A,B,Q,R);

%ceros es matriz de ceros
ceros=zeros(length(A),1); %El numero de columnas de la matriz de ceros

As = [A ceros; -C D];
Bs = [B; D];

Ks = lqr(As,Bs,Q,R)

%Siempre hay que analizar el caso
K_LQR = Ks(:,[1:2])
Ki_LQR = -Ks(:,[3])


