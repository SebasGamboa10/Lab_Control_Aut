%Retroalimentación de estado integral

%Si nos dan una función de trans
s=tf('s');

%Nota, quitar el polo menos domintante
%%sys =ss(Gs);
%csys = canon(sys,'companion')


A = Heli_ss.A;
B = Heli_ss.B;
C = Heli_ss.C;
D = Heli_ss.D;

%Polos
u1=-0.48901+0.13265i;
u2=-0.48901-0.13265i;
u3=-1.44;
u4=-1.54;
u5=-1.64;
u6=-1.74;

P=[u1, u2, u3, u4, u5, u6];

M_crt = [A B;-C [0 0; 0 0]]
%deter = det(M_crt)
%rank(M_crt)


A_t = [A [0 0;0 0;0 0;0 0];-C [0 0; 0 0]]
B_t = [B;[0 0;0 0]]
M=[B_t (A_t*B_t) ((A_t^2)*B_t) ((A_t^3)*B_t) ((A_t^4)*B_t) ((A_t^5)*B_t)]
rank(M*M')
det(M*M')

%Sacando K, y ki
Ks = place(A_t, B_t,P)

K_REI=[Ks(:,1) Ks(:,2) Ks(:,3) Ks(:,4)]
Ki_REI = -Ks(:,[5:6])

