import numpy as np

def get_prime_factors(n):
	factors = []
	while n % 2 == 0:
		factors.append(2)
		n //= 2    
	for i in range(3, int(np.sqrt(n)) + 1, 2):
		while n % i == 0:
			factors.append(i)
			n //= i        
	if n > 2:
		factors.append(n)
	return np.array(factors)

def divisorGenerator(n):
	divisors = []
	for i in range(1,n//2+1):
		if n%i == 0: divisors.append(i)
	return divisors

N = 28123
SUM_UP_TO_N = N * (N + 1) / 2

num_to_factor = {}
abundant_numbers = []
for i in range(1, N + 1):
	factors = get_prime_factors(i)
	divisors = np.array(divisorGenerator(i))
	if divisors.sum() > i:
		abundant_numbers.append(i)	

abundant_numbers = np.array(abundant_numbers)

matrix_sums = abundant_numbers[:, np.newaxis] + abundant_numbers
triu_indices = np.triu_indices(len(abundant_numbers), k=0)
sum_of_all_abundant_pairs = matrix_sums[triu_indices]

sums_in_range = np.sum(np.unique(sum_of_all_abundant_pairs[sum_of_all_abundant_pairs <= N]))
print(SUM_UP_TO_N - sums_in_range)


