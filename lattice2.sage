load 

def maxPr(p, L):
    pass

def theta_i(S):
    return [pl.log()/S[-1].log() for p in range(0,S.len)]

def approx(m, Ti):
    pass

def getVector(entry, posOf1, size):
    v=[0 for i in range(size)]
    v[posOf1]=1
    v[-1]=entry
    return v

def lattice(p,m,S):
    L=[getVector(S[i],i,S.len) for i in range(S.len+1)]+[getVector(p^m,S.len,S.len)]
    return IntegerLattice(L)
