A = [2,-4,5,7];
B = [3,9,-2,0];
C = [-3,6,3,4];
D = [2,-2,1;4,3,6;1,3,-2];
E = [-1,3,5;2,-3,1;6,-2,-4];
F = [7,0,-4;-2,1,3;0,-1,6];
G = [6;-3;2];
I = [4;-1;5];
J = [4,3,-5;-2,-1,4];
H = [-2,4,-5]


res_a = A + 3*C;
disp(res_a)
res_b = -2*B;
disp(-2*B);
res_c = 2*C - B - 3*A;
disp(res_c);
res_d = 2*D - E;
disp(res_d);
res_e = 3*F - E + 4*D;
disp(res_e);
res_f = 2*F - D - 3*E;
disp(res_f)
res_g = 2*E - 3*D;
disp(res_g);
res_p = (2*G)*(3*H);
disp(res_p)
res_o = (G-I)*(3*H);
disp(res_o);
res_x = J*((3*G)+(5*I));
disp(res_x)