B=1000
p=numeric(B)
for (b in 1:B) {
  x=rnorm(30,180,6)
  y=rnorm(30,175,6)
  p[b]=t.test(x,y,var.equal=TRUE)[[3]]
}
#p now contains 1000 p values, from two-sample t-test on x,y
#p<.05 converts p to a vector of booleans indicating whether the original p value was <.05 or not
#p looks like: [TRUE, TRUE, FALSE, TRUE, etc.]
#mean(p) now results in #TRUE/TOTAL
power=mean(p<0.1)
power

