option optcr=0.0000000001;
option optca=0.0000000001;
option nlp=lindoglobal;
option threads=16;
option ITERLIM=1000000000;
option ResLiM=20000000000;
option decimals = 8;

sets
k the set of selected suppliers  /k1*k4/
;

alias(k,kk);

parameters
D Buyer's annual demand
hb Buyer's inventory holding cost per unit per unit time
;

D = 200000;
hb = 2.6

parameters A(k) Ordering cost for the kth supplier
/k1 40, k2 33, k3 30, k4 20/
*/k1 40, k2 33, k3 30, k4 34/
;

parameters S(k) Setup cost of production for the kth supplier
/k1 43, k2 42, k3 40, k4 38/
*/k1 43, k2 42, k3 40, k4 32/
;

parameters c(k) Unit price offered by the kth supplier
/k1 9.0, k2 8.9, k3 8.7, k4 9.0/
*/k1 9.0, k2 8.9, k3 8.7, k4 10.5/
;

parameters h(k) Inventory holding cost of the kth supplier per unit per unit time
/k1 2.29, k2 1.25, k3 2.00, k4 1.90/
*/k1 2.29, k2 1.25, k3 2.00, k4 1.71/
;

parameters z(k) Variable cost for each product of the kth supplier
/k1 4.04, k2 4.85, k3 5.08, k4 6.00/
*/k1 4.04, k2 4.85, k3 5.08, k4 5.25/
;

parameters P(k) Annual production rate of the kth supplier
/k1 42000, k2 64000, k3 41500, k4 66500/
*/k1 42000, k2 64000, k3 41500, k4 61000/
;

positive variables
qprime(k) Purchased quantity per period from the kth supplier based on a percentage of buyer's annual demand rate
t
;

variables
Z1
;

equations
eq1

eq2(k)

eq
;

eq1.. sum(k,(z(k) + c(k)) * qprime(k) * t + (A(k) + S(k)) * t * t + 1/2 * (hb/D + h(k)/P(k)) * qprime(k) * qprime(k)) =e= 1;

eq2(k).. qprime(k)=l=P(k)/D * sum(kk, qprime(kk));

eq..  Z1=e= t * sum(k, qprime(k));

model case1 /all/;
solve case1 using nlp max Z1;
display Z1.l, qprime.l, t.l;
