def prime_factors(N):
     F = N.factor()
     S = []
     for p in F:
        S.append(p[0])
     return S

def is_unit(x,S):
    if x==0: return False
    x = QQ(x)
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
    if x==0: return False;    
    x = QQ(x)
    d=x.denominator();
    for s in S:
        while d%s==0:
            d/=s;
    n=x.numerator();
    for s in S:
        while n%s==0:
            n/=s;
    return d==1 and (n==1 or n==-1)

def is_unit__(x,S):
    x = QQ(x)
    if x==0: return False
    S = prod(S)
    return x.numerator().prime_to_m_part(S).abs()==1 and x.denominator().prime_to_m_part(S).abs()==1

def units(S):
    pass

def small_elements(n,G):
    pass
			
def to_unit(x,S):
    pass

def small_solutions(n,S):
    pass
