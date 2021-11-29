option optcr=0.0000000001;
option optca=0.0000000001;
option minlp=lindoglobal;
option threads=10;
option ITERLIM=1000000;
option ResLiM=20000000000;
option decimals = 8;

sets
k the set of selected suppliers  /k1*k10/
*i /i1/
j /j1, j2/
;
alias(k,kk);

parameters
D Buyer's annual demand
hb Buyer's inventory holding cost per unit per unit time
N The upper bound of the number of the suppliers
epsilon
M
;

D = 200000;
hb = 2.6;
N = 6;
epsilon = 0.001;
M = 1000;

parameters A(k) Ordering cost for the kth supplier
/k1 40, k2 19, k3 25, k4 39, k5 27, k6 33, k7 30, k8 23, k9 20, k10 34/
;

parameters S(k) Setup cost of production for the kth supplier
/k1 43, k2 39, k3 42, k4 30, k5 38, k6 42, k7 40, k8 39, k9 38, k10 32/
;

parameters c(k) Unit price offered by the kth supplier
/k1 9.0, k2 9.1, k3 8.7, k4 10.5, k5 9.5, k6 8.9, k7 8.7, k8 10.4, k9 9.0, k10 10.5/
;

parameters h(k) Inventory holding cost of the kth supplier per unit per unit time
/k1 2.29, k2 1.96, k3 2.74, k4 0.54, k5 1.50, k6 1.25, k7 2.00, k8 2.09, k9 1.90, k10 1.71/
;

parameters z(k) Variable cost for each product of the kth supplier
/k1 4.04, k2 6.48, k3 7.17, k4 5.87, k5 6.30, k6 4.85, k7 5.08, k8 7.00, k9 6.00, k10 5.25/
;

parameters P(k) Annual production rate of the kth supplier
/k1 42000, k2 34000, k3 36500, k4 63000, k5 45500, k6 64000, k7 41500, k8 36000, k9 66500, k10 61000/
;

parameters I(k)
/k1 253, k2 268, k3 259, k4 180, k5 257, k6 248, k7 330, k8 327, k9 330, k10 321/
;

table O(j,k)
       k1       k2       k3       k4       k5       k6        k7       k8       k9        k10
j1     240      210      270      200      160      230       170      180      170       200
j2     90       80       70       70       70       80        60       70       60        80
;


binary variables
y(k)  0 - The kth supplier is not chosen
;

positive variables
q(k)  Purchased quantity per period from the kth supplier
qprime(k) Purchased quantity per period from the kth supplier based on a percentage of buyer's annual demand rate
b(k)
U(k,j)
V(k)
e(k)
t
;

variables
Z2
;

equations
eq1

eq2(k)

eq3(k)

eq4(k)

eq5(k)

eq6(k,kk)

eq7

eq8(j,k)

eq9(k)

eq10(j,k)

eq11(k)

eq12(k)

eq13(k)

eqr(k)

eq
;

eq1.. sum(k,qprime(k))=e=1;

eq2(k).. qprime(k)=l=y(k)*P(k)/D;

eq3(k).. qprime(k)=g=epsilon*y(k);

eq4(k).. V(k) * I(k) =e= y(k);

eq5(k)..  sum(j, U(k,j) * O(j,k)) + e(k) =e= y(k);

eq6(k,kk)$(ord(k)<>ord(kk))..  sum(j,U(k,j) * O(j,kk)) - V(k) * I(kk) =l= 0;
*eq6(k)..  sum(j,U(k,j) * O(j,k)) - V(k) * I(k) =l= 0;

eq7.. sum(k,y(k))=l=N;

eq8(j,k)..  U(k,j) =g= epsilon * y(k);

eq9(k)..  V(k) =g= epsilon * y(k);

eq10(j,k).. U(k,j) * O(j,k) =l= y(k);

eq11(k)..  b(k)=l=M * y(k);

eq12(k)..  b(k)=l=t;

eq13(k)..  t - b(k) + M * y(k)=l=M;

eqr(k)..  t * q(k) =e= qprime(k);

eq..  Z2 =e= sum(k, 1 - e(k));

model case1 /all/;
solve case1 using minlp max Z2;
display Z2.l, y.l, qprime.l, b.l, t.l, U.l, V.l, e.l;
































