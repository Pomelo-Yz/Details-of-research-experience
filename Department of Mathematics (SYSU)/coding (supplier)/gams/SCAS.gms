option optcr=0.0000000001;
option optca=0.0000000001;
option minlp=lindoglobal;
option threads=20;
option ITERLIM=1000000000;
option ResLiM=20000000000;
option decimals = 8;

sets
k the set of selected suppliers  /k1*k10/
;

parameters
D Buyer's annual demand
hb Buyer's inventory holding cost per unit per unit time
N The upper bound of the number of the suppliers
epsilon
M
*t
;

D = 200000;
hb = 2.6;
N = 6;
epsilon = 0.001;
M = 1000;
*t = 1/D;

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



binary variables
y(k)  0 - The kth supplier is not chosen
;

positive variables
q(k)  Purchased quantity per period from the kth supplier
qprime(k) Purchased quantity per period from the kth supplier based on a percentage of buyer's annual demand rate
b(k)
t
;

variables
Z1
;

equations
eq1

eq2(k)

eq3(k)

eq7

eq11(k)

eq12(k)

eq13(k)

eqr1

*eqr2(k)

*eqr3

eq
;

eq1.. sum(k,qprime(k))=e=1;

eq2(k).. qprime(k)=l=y(k)*P(k)/D;

eq3(k).. qprime(k)=g=epsilon*y(k);

eq7.. sum(k,y(k))=l=N;

eq11(k)..  b(k)=l=M * y(k);

eq12(k)..  b(k)=l=t;

eq13(k)..  t - b(k) + M * y(k)=l=M;

eqr1(k)..  t * q(k) =e= qprime(k);

*eqr2(k)..   q(k) =e=qprime(k) * D;

*eqr3..       t =g= 0.0000001;


eq..  Z1=e=D * sum(k, (z(k) + c(k)) * qprime(k) + (A(k) + S(k)) * b(k) + 1/2 * (hb/D + h(k)/P(k)) * qprime(k) * q(k));

model case1 /all/;
solve case1 using minlp min Z1;
display Z1.l, y.l, qprime.l, q.l, t.l, b.l;
