load 


# 
def maxPr(ZpCA_p, L):
    L_p = []
    L_p= [(ZpCA_p(p_i).log().abs(), p_i) for p_i in L]
    L_p.sort()
    return [pL for q,pL in L_p] 

def theta_i(S):
    return [pl.log()/S[-1].log() for p in range(0,S.len)]


# Beschreibung ###############
# Liefert eine Liste der Theta_i in Z ## 
def approx(m, Ti):
    Ti = [(t_i.lift()) for t_i in Ti]
    return Ti

def getVector(entry, posOf1, size):
    v=[0 for i in range(size)]
    v[posOf1]=1
    v[-1]=entry
    return v

def lattice(p,m,S):
    L=[getVector(S[i],i,S.len) for i in range(S.len+1)]+[getVector(p^m,S.len,S.len)]
    return IntegerLattice(L)

def findSolution(S, M, num_shortest_vectors):
    L_P = []
    for p_i in S:
        ZpCA_p = ZpCA(p_i)

        while n<=M:
        L_P = maxPr(ZpCA_p, [q for q in S if q != p_i])
        Theta_i = theta_i(L_P)

        L = lattice()
