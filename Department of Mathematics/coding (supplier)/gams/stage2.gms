option optcr=0.0000000001;
option optca=0.0000000001;
option nlp=lindoglobal;
option threads=20;
option ITERLIM=500000;
option ResLiM=20000000000;
option decimals = 8;

sets
k /k1*k4/
;

parameters A(k) Ordering cost for the kth supplier
/k1 40, k2 25, k3 39,k4 33/
;

parameters S(k) Setup cost of production for the kth supplier
/k1 43,k2 42, k3 30,k4 42/
;

parameters h(k) Inventory holding cost of the kth supplier per unit per unit time
/k1 2.29,k2 2.74, k3 0.54,k4 1.25/
;

parameters z(k) Variable cost for each product of the kth supplier
/k1 4.04,k2 7.17,k3 5.87,k4 4.85/
;

parameters q(k)
*/k1 1845.54, k2 1603.86, k3 2526.63, k4 2812.25/
/k1 2554.578, k2 2109.277, k3 3860.533, k4 3933.719/
;

parameters qprime(k)
*/k1 0.2100, k2 0.1825, k3 0.2875, k4 0.3200/
/k1 0.210, k2 0.16832620, k3 0.30167380, k4 0.320/
;

parameters G(k)
*/k1 1.702848026772127, k2 1.454789644665761, k3 2.949792706190104, k4 2.671299170580333/
/k1 163658.9946455747, k2 42899.0762668477, k3 232833.7775619793, k4 217594.1658839335/
;

parameters P(k) Annual production rate of the kth supplier
/k1 42000, k2 36500, k3 63000, k4 64000/
;

parameters
D Buyer's annual demand
hb Buyer's inventory holding cost per unit per unit time
B
t
;

D = 200000;
hb = 2.6;
B = 1760000;
t = 1/sum(k,q(k));

positive variables
c(k)
;

variables
Z3
;

equations
eq1

eq2(k)

eq3

eq
;

eq1..   D * sum(k, c(k) * qprime(k) + A(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k)) =l= B;

eq2(k)..   D * (c(k) * qprime(k) - (z(k) * qprime(k) + S(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k))) =g= G(k);

eq3..   sum(k, c(k) * qprime(k) + A(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k)) =g= sum(k, c(k) * qprime(k) - (z(k) * qprime(k) + S(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k)));

eq..   Z3 =e= (B - D * sum(k, c(k) * qprime(k) + A(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k))) * prod(k, D * (c(k) * qprime(k) - (z(k) * qprime(k) + S(k) * t + 1/2 * h(k)/P(k) * qprime(k) * q(k))) - G(k));


model case1 /all/;
solve case1 using nlp max Z3;
display Z3.l, c.l;





