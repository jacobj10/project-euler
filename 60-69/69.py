class PrimeFactorGenerator:
    def __init__(self):
        self.primes = [2, 3]
        self.last_n = 3
        self.factorization_cache = []

    def insert_to_cache(self, n, factor):
        self.factorization_cache[n].add(factor)

    def generate_up_to(self, n):
        x = [True,] * n
        for i in range(n):
            self.factorization_cache.append(set())

        for i in range(2, n):
            if not x[i]:
                continue
            self.insert_to_cache(i, i)
            for j in range(i + i, n, i):
                x[j] = False
                self.insert_to_cache(j, i)
        self.primes = [a for (a, b) in enumerate(x) if a > 1 and b]
        return self

    def merge(a, b):
        for f in a:
            if f in b:
                b[f] += a[f]
            else:
                b[f] = a[f]
        return b

    def factorization_for(self, n):
        factor_to_count = {}
        for prime in self.factorization_cache[n]:
            if n == 1:
                return factor_to_count
            while n % prime == 0:
                n = n // prime
                if prime not in factor_to_count:
                    factor_to_count[prime] = 0
                factor_to_count[prime]+=1

        return factor_to_count

    def phi(self, n):
        f = self.factorization_for(n)
        total = 1
        for x in f:
            total *= (pow(x, f[x] - 1) * (x - 1))
        return total
            
CONST = 1000000
g = PrimeFactorGenerator().generate_up_to(CONST)
phi_max = 0
i_max = 0
for i in range(2, CONST):
    phi_ratio = i / g.phi(i)
    if (phi_ratio > phi_max):
        i_max = i
        phi_max = phi_ratio

print(i_max, phi_max)
