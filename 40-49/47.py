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

def satisfies(c):
    if len(c) < 4:
        return False
    return len(c[-4]) == 4 and len(c[-3]) == 4 and len(c[-2]) == 4 and len(c[-1]) == 4

g = PrimeFactorGenerator()
i = 2
cache = [{}, {}, {2: 1}]
while not satisfies(cache):
    i += 1
    g.generate_up_to(i+1)
    cache.append(g.factorization_for(i))

print(len(cache) - 4)
