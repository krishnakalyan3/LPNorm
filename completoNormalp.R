library('normalp')

#Let's compute the density for a x value with mu=0, sigmap=2 and p=2
dnormp(2, p=2)

#Let's compute the distribution for a q value with mu=1, sigmap=2 and p=2 
pnormp(0.7, mu=1, sigmap=2, p=2)

#Let's compute the quantile for a probability value pr=0.4 with mu=3, sigmap=2 and p=2 
qnormp(0.4, mu=3, sigmap=2, p=1.5)

#In the following example, we generate a random sample of size n=30 from an exponential power distribution 
#with mu=2, sigmap=3 and p=1.5
rnormp(30,2,3,1.5)

#With the following command, we plot 5 different distributions with p=1, 2, 3, 4, 5, 10, 20, 30, 50 (the last one will be the
#uniform distribution) 
graphnp(c(1:4,5))

graphnp(c(1:4,10))

graphnp(c(1:4,20))

graphnp(c(1:4,30))

graphnp(c(1:4,50))

#and an exponential power distribution Q-Q plot for a sample of size n=100:
x=rnormp(100, p=2)
qqnormp(x, p=2)
qqlinep(x, p=2)

###Estimating the exponential power distribution parameters###

#Let's estimate the shape parameter p from a vector of observations:
x=rnormp(200,1,2,4)
p=estimatep(x, 1, 2)
p

#Let's estimate {inserire mu, sigmap } and p from a vector of observations:
x=rnormp(200,1,2,3)
parameters=paramp(x)
parameters

#Let's compute the values of theoretical and empirical indices of kurtosis, with p known or estimated
kurtosis(p=1.5)
kurtosis(x, p=1.5, value='parameter')
kurtosis(x)

#Let's perform a simulation plan for m=200 samples of size n=30, with mu=0, sigmap=1, p=3, by showing 
#the histogram for each set of estimates 
sim=simul.mp(30, 200, p=3)
sim

par(mfrow=c(3,2))
plot(sim)
par(mfrow=c(1,1))

###Fitting a linear regression model with random errors distributed according to an exponential power distribution###

#We consider an example that has the only purpose to show the use of the implemented functions to fit a 
#linear regression model when we have to assume that the random errors are distributed according to an exponential
#power distribution

#dataset=read.table('<file name>', header = TRUE)
dataset

attach(dataset)
res.lmp=lmp(Videos~Gross)
res.lmp

#Let's report a summary of the mian results with a plot showing the 2 straight lines derived by using the 
#OLS methods and the lmp() method:

summary(res.lmp)

plot(Videos~Gross)
abline(lm(Videos~Gross))
abline(res.lmp, col='red')

#Let's perform an analysis of residuals:
par(mfrow=c(1.5,2))
plot(res.lmp)

#Let's perform a simulation plan for m=200 samples of size n=30 for a linear regression model with only one 
#regressor, by showing the histogram for each set of estimates
sim=simul.lmp(30,200,1,2,1,1,3)
sim

summary(sim)

par(mfrow=c(1.5,2))
plot(sim)


