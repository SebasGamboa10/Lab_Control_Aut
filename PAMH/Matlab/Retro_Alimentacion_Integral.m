%Retroalimentación de estado integral

%Si nos dan una función de trans
s=tf('s');

%Nota, quitar el polo menos domintante
%%sys =ss(Gs);
%csys = canon(sys,'companion')


A = [-0.1456 4.141; -4.141 -0.1456];
B = [0;1.966];
C = [1.388 0];
D = 0;

%Polos
u1=-3.01-2.26*1i;
u2=-3.01+2.26*1i;
u3=-8.4;
P=[u1, u2, u3]

M_crt = [A B;-C 0]


A_t = [A [0;0];-C 0];
B_t = [B;0];
M=[B_t (A_t*B_t) ((A_t^2)*B_t)]

%Sacando K, y ki
Ks = acker(A_t, B_t,P)

K_REI=[Ks(:,1) Ks(:,2)]
Ki_REI = -Ks(:,3)

