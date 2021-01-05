
def core_formula_function(lambda0,a1,a2,neffc):
n1 = sellmeier_function_core(lambda0)
n2 = sellmeier_function_clad(lambda0)
b =(pow(neffc,2)-pow(n2,2))/(pow(n1,2)-pow(n2,2))
V= 2*math.pi / lambda0 * a1 * math.sqrt(pow(n1,2)-pow(n2,2))
temp_value = 1-b
sqr_temp1 = math.sqrt(temp_value)
sqr_temp2 = math.sqrt(b)
c = V * sqr_temp1 d = special.jn(1,c) e =
special.jn(0,c) left_fun = c * d / e f = V *
sqr_temp2 g = special.kn(1,f) h = special.kn(0,f)
right_fun = f * g/ h return left_fun, right_fun
def coremode_function(lambda0,a1,a2):
print('current wavelength',lambda0)
n1 = sellmeier_function_core(lambda0)
n2 = sellmeier_function_clad(lambda0)
n_eff_prev_core=n2+0.000000000000001 % can infinitely close to but can't be the exact value o
n_eff_post_core=n1-0.000000000000001

while n_eff_post_core - n_eff_prev_core > 0.000000001
  % print(n_eff_prev_core)
  % print(n_eff_post_core)
  % print(n_eff_post_core-n_eff_prev_core)
  n_eff_co_precise = (n_eff_prev_core+n_eff_post_core)/2

  % print(core_formula_function(lambda0,a1,a2,n_eff_prev_core)[0]-core_formula_function(lam
end

if (core_formula_function(lambda0,a1,a2,n_eff_co_precise)[0]-core_formula_function(lambda0))
  n_eff_prev_core = n_eff_co_precise
elseif (core_formula_function(lambda0,a1,a2,n_eff_co_precise)[0]-core_formula_function(lambda0))
  n_eff_post_core=n_eff_co_precise
  n_eff_co_precise = (n_eff_prev_core+n_eff_post_core)/2
  return n_eff_co_precise
end
%coremode_function(1525*math.pow(10,-9),4.15 * math.pow(10,-6),62.5*math.pow(10,-6))
%print(coremode_function(1525*math.pow(10,-9),4.15 * math.pow(10,-6),62.5*math.pow(10,-6)))

%%

start = time.time()
def claddingmode_function(lambda0,a1,a2,r,n3):
  n1 = sellmeier_function_core(lambda0)
  n2 = sellmeier_function_clad(lambda0)
  img = cm.sqrt(-1) l = 1
w_l = len(np.arange(1300,1600,1))
% w_l = len(range(1300,2000,1))
wavelength = [np.arange(1300,1600,1)[ith_wl] * math.pow(10,-9) for ith_wl in range(0,w_l)]
n_eff = np.arange(1.442, n2-0.00001 , 0.000001) %upper limit can not acceed n2
% n_eff = np.arange(1.435, n2-0.00001 , 0.000001) %upper limit can not acceed n2
Z_0 = 377
u1_1 = pow(2 * math.pi/lambda0,2)
u1_2 = pow(n1,2) - pow(n_eff, 2)
u1 = pow(u1_1 * u1_2,0.5) u2_2 =
pow(n2,2) - pow(n_eff, 2) u2 =
pow(u1_1 * u2_2,0.5) w3_2 =
pow(n_eff,2) - pow(n3, 2) w3
=pow(u1_1 * w3_2,0.5) sigma1 =
img*l*n_eff/Z_0 sigma2 =
img*l*n_eff*Z_0 u21 = 1
/pow(u2,2) - 1/pow(u1,2)
u32 = 1 /pow(w3,2) +
1/pow(u2,2)
J_1 = special.jn(0,u1 * a1)-special.jn(2,u1*a1)
J_2 = u1 * special.jn(1,u1*a1)
J = 1/2 * J_1/J_2
K_1 = special.kn(0,w3*a2)+special.kn(2,w3*a2)
K_2 = w3 * special.kn(1,w3*a2)
K = -1/2 * K_1/K_2
1
p1=special.jn(1, u2 * r)*special.yn(1,u2*a1)-special.jn(1, u2 * a1)* special.yn(1,u2*r)
q1=1/2*(special.jn(1,u2*r) *(special.yn(0,u2*a1)-special.yn(2,u2*a1))-special.yn(1,u2*r)* (s
r1=1/2*(special.yn(1,u2*a1)*(special.jn(0,u2*r)-special.jn(2,u2*r))-special.jn(1,u2*a1)*(spe
s1=1/4*((special.jn(0,u2*r)-special.jn(2,u2*r))*(special.yn(0,u2*a1)-special.yn(2,u2*a1))-(s
f1 = u2 * (J * K + sigma1*sigma2*u21*u32/(pow(n2,2)*a1*a2))*p1-K*q1+J*r1-1/u2 *s1
f2 = -u2 * (u32/(pow(n2,2)*a2)*J-u21/(pow(n1,2)*a1)*K)*p1+u32/(pow(n1,2)*a2)*q1+u21/(pow(n1,
zeta0 = 1/sigma2*f1/(f2)
f3 = u2*(u32/a2*J-pow(n3,2)*u21*K/(pow(n2,2)*a1))*p1-u32*q1/a2-u21*r1/a1
f4 = u2*(pow(n3,2)*J*K/pow(n2,2)+sigma1*sigma2*u21*u32/(pow(n1,2)*a1*a2))*p1-
pow(n3,2)*K*q1/ %****************here we invert the sign of zeta1 by multiplying -1 in
front******************** zeta1=sigma1*f3/f4
zeta0_img=
zeta0.imag
zeta1_img=zeta1.imag
return n1,n2,zeta0,zeta1,zeta0_img,zeta1_img,sigma1,sigma2,u1,u2,u21,p1,q1,r1,s1,J,w3,n_eff
%claddingmode_function(1370*math.pow(10,-9),4.15 * math.pow(10,-6),62.5 * math.pow(10,-6),62.5 *
end = time.time()
print(end - start)
2
Appendix 3: Sub-Intervals for Finding Intersections