%Retroalimentación de estado integral

%Si nos dan una función de trans
s=tf('s');

%Nota, quitar el polo menos domintante
%%sys =ss(Gs);
%csys = canon(sys,'companion')


A = Grua_ss.A;
B = Grua_ss.B;
C = [1 0 0 0];
D = Grua_ss.D;

%Polos
u1=-0.72593+0.408761i;
u2=-0.72593-0.408761i;
u3=5*-0.72593;
u4=u3-3.4;
u5=u4-4.4;
P=[u1, u2, u3, u4, u5];

M_crt = [A B;-C 0]
%deter = det(M_crt)
%rank(M_crt)


A_t = [A [0;0;0;0];-C [0]]
B_t = [B;0]
M=[B_t (A_t*B_t) ((A_t^2)*B_t) ((A_t^3)*B_t) ((A_t^4)*B_t)]
%det(M)

%Sacando K, y ki
Ks = place(A_t, B_t,P)

K_REI=[Ks(:,1) Ks(:,2) Ks(:,3) Ks(:,4)]
Ki_REI = -Ks(:,5)

