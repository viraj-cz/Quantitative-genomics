#used to create reproducible results when writing code that involves creating variables that take on random values - just like pytorch
set.seed(6155)

# number of SNPs in DNA
#SNPs are basically single nucleotide mutations (polymorphisms more accurately) in population
m <- 500                                  

#runif generates the given no. of values between the given limits
#500 values between 0 and 0.5 for our case

#what this basically means is that we are creating a Minor Allele Frequency for each SNP
maf <- runif(m, 0, .5)



#And, Minor allele frequency (MAF) is a measure of how often a specific version of a gene, called an allele, appears in a population.For each SNP, we are generating its frequency

#To simply put it, we are creating a collection of values for 500 SNPs of how often they appear in a population

#generates a binomial distributed with the given vector length, size (no. of tries) of the experiment and probablity of each trial
#now if you run this multiple times it basically creates a random value between 0 and 1
testBinomial <- rbinom(1,1,0.5)
testBinomial

testBinomial <- rbinom(1,1,0.5)
testBinomial

testBinomial <- rbinom(1,1,0.5)
testBinomial

#so we are basically tring to create an array full of reference allele values (0,1,2)
#Now reference allele is something like this:
#Let's say you are comparing your Locus with another person (let's called that person - the person of reference)
#Now there are three possibilities - As humans have diploid chromosomes, we can have:
# Both Alleles matching at locus (0 difference)
# One Allele matching at locus and one different (1 difference)
# Both Allele different (2 differences)
#And that is exactly how we denote reference and alternative alleles

x012 <- rbinom(m, 2, maf)
x012



#########################################
#now everything that we did above just created a genotype data for a single person now we want to repeat this for let's say n = 400 people
n = 400                                    # number of individuals
x012 = t(replicate(n, rbinom(m, 2, maf)))  # n x m genotype matrix


dim(x012)
x012[1,1]
x012[1:5, 1:10]

#Now we essentially have a 400 x 500 matrix:
#400 people and 500 SNP Loci, with number 0,1,2 as values indicating how many SNPs vary at that location compared to the reference allele

#This is essentially the structure of genotype data, we obviously can't compare 3 billion base pairs across 500 humans, but can boil it down to 500 SNPs locations and 0/1/2 reference alles
