#install.packages('normalp')

library('normalp')

dnormp(2, p=2)
pnormp(0.7, mu=1, sigmap=2, p=2)
qnormp(0.4, mu=3, sigmap=2, p=1.5)
rnormp(30,2,3,1.5)

rnormp(30,0,1,2)

# p = 1 and p = 40
graphnp(c(1,40))
