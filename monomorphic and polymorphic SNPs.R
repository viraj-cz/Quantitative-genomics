#Monomorphic and polymorphic Data

#copying code from the previous example
set.seed(6155)
m = 500                                  # number of SNPs
maf = runif(m, 0, .5)                    # random MAF for each SNP
x012 = rbinom(m, 2, maf)
n = 400                                    # number of individuals
x012 = t(replicate(n, rbinom(m, 2, maf)))  # n x m genotype matrix

#Now let's understand monomorphic SNPs
#For example, we find out that SNP1 is the same in all 100 individuals (AA) , SNP2 is the same in all 100 individuals (GG), and so on. Since these SNPs do not vary between individuals, they will not be informative for our study.
#But SNPs by their very definition vary across population and hence are polymorphic
#therefore we need to eliminate the monomorphic SNPs (cause in real data we will only have polymorphic SNPs)

x012 = t(replicate(n, rbinom(2*m, 2, c(maf, maf))))

#apply in R is essentially a loop
#When "2" is used as the second argument in the apply function, it tells R to apply the function "var" to each column of the data in "x012" matrix.
#We are essentially calculating the variance across the data, each column and storing it as true or false

polymorphic = apply(x012, 2, var) > 0
polymorphic
#If you manually check the data, all the values in column 245 are 0, so essentially that is not a SNP

#now we make sure that we only select the vales in Matrix that have Polymorphic = TRUE
x012 = x012[,polymorphic][,1:m]
x012

#And we are only selecting MAF for SNPs whose polymorphic value was TRUE above
maf = c(maf, maf)[polymorphic][1:m]
round(maf[1:10], 2)

#just displaying 
x012[1:5, 1:10]
