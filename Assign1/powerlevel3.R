# For each women's mean height (175,180,0.1):
#   Run 1000 tests, derive power, append to power vector
# Plot powers

# Pretty Printing:
printf <- function(...) cat(sprintf(...))
# printf("hello %d\n", 56)

# Exercise Vars:
m=n=150
sd=30

powers=numeric()
nu=seq(175,185,by=0.1)
for (i in nu) {
  B=1000
  p=numeric(B)
  for (b in 1:B) {
    x=rnorm(m,180,sd)
    y=rnorm(n,i,sd)
    p[b]=t.test(x,y,var.equal=TRUE)[[3]]
  }
  power=mean(p<.05)
  printf("%f: %f\n", i, power)
  powers=c(powers,power)
  
}

plot(nu,powers)
