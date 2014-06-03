def prime_factors(N):
    pass

def is_unit(x,S):
    if x==0: return False
    n=x.numerator()
    H=prime_factors(n)
    for p in H:
        if p not in S: return False 
    d=x.denominator()
    F=prime_factors(d)
    for p in F:
        if p not in S: return False
    return True

def is_unit_(x,S):
    pass

def units(S):
    pass

def small_elements(n,G):
    pass
			
def to_unit(x,S):
    pass

def small_solutions(n,S):
    pass
