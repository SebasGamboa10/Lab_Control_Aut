%Retroalimentación de estado integral

%Si nos dan una función de trans
s=tf('s');

%Nota, quitar el polo menos domintante
%%sys =ss(Gs);
%csys = canon(sys,'companion')


A = Model_Grua_FCC.A;
B = Model_Grua_FCC.B;
C = Model_Grua_FCC.C;
D = Model_Grua_FCC.D;

%Polos
u1=-3.5;
u2=-3*10;
u3=-8.4*100;
u4=-1.5*150;
u5=-1*1500;
u6=-10.5*205;
P=[u1, u2, u3, u4, u5];

M_crt = [A B;-C [0 0]]


A_t = [A [0;0;0;0];-C [0]];
B_t = [B;0 0];
%M=[B_t (A_t*B_t) ((A_t^2)*B_t)]

%Sacando K, y ki
Ks = place(A_t, B_t,P)

K_REI=[Ks(:,1) Ks(:,2)]
Ki_REI = -Ks(:,3)

