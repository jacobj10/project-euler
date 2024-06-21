class PrimeFactorGenerator:
    def __init__(self):
        self.primes = [2, 3]
        self.last_n = 3

    def generate_up_to(self, n):
        if self.last_n > n:
            return self.primes
        for i in range(self.last_n + 1, n+1):
            found = False
            for prime in self.primes:
                if i % prime == 0:
                    found = True
                    break
            if not found:
                self.primes.append(i)
        self.last_n = n
        return self.primes

    def factorization_for(self, n):
        if n > self.last_n:
            raise Exception("invalid")
        factor_to_count = {}
        for prime in self.primes:
            if n == 1:
                return factor_to_count
            while n % prime == 0:
                n = n // prime
                if prime not in factor_to_count:
                    factor_to_count[prime] = 0
                factor_to_count[prime]+=1
        return factor_to_count

    def merged_divisors_for(self, a, b):
        n1 = self.factorization_for(a)
        n2 = self.factorization_for(b)
        for p in n1:
            if p in n2:
                n2[p] += n1[p]
            else:
                n2[p] = n1[p]
        return n2


"""
The nth triangle number is;
    (n)(n+1)/2

    consider the unique prime factorization of each n, n+1;

    (p1....pn)(q1....qn)/2

    If we merge the factorizations:
    z1^a..zx^f..zn^z)/2, we can compute the total number of divisors as:

    (a+1)....(f+1)...(z+1), but we need to remove one instance of 2, since
    the total is divided by two.


"""
g = PrimeFactorGenerator()
div = 0
i = 2
while div < 500:
    i += 1
    tn = (i) * (i + 1) // 2
    g.generate_up_to(i+1)
    merged = g.merged_divisors_for(i, i+1)
    div = 1
    for m in merged:
        if m != 2:
            div *= (merged[m] + 1)
        else:
            div *= (merged[m])

print(i*(i+1)//2)
