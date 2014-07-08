load units.sage
from sage.modules.free_module_integer import IntegerLattice

# 
def maxPr(ZpCA_p, L):
    L_p = []
    L_p= [(ZpCA_p(p_i).log().abs(), p_i) for p_i in L]
    L_p.sort()
    return [pL for q,pL in L_p] 

def theta_i(S):
    return [pl.log()/S[-1].log() for pl in S if pl!=S[-1]]


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
    L=[getVector(S[i],i,len(S)+1) for i in range(len(S))]+[getVector(p^m,len(S),len(S)+1)]
    return IntegerLattice(L)
    
def toInt(x,S):
    prod=1
    for i in range(len(x)-1):
        prod *= S[i]^x[i]
    prod*=S[-1]^(-x[-1])
    return prod
    
def test(x,S,p):
    u=toInt(x,S)
    return is_unit_(1-u,S+[p])

def findSolution(S, M, num_shortest_vectors):
    L_P = []
    for p_i in S:
        print "p_i:", p_i
        ZpCA_p = ZpCA(p_i)
        m=1
        while m<=M:
            print "    m:", m
            L_P = maxPr(ZpCA_p, [q for q in S if q != p_i])
            Theta_im = approx(m,theta_i(L_P))

            L = lattice(p_i,m,Theta_im)
            for s in L.shortest_vectors(num_shortest_vectors):
                if test(s,L_P,p_i):
                    print toInt(s,L_P)
            m+=1
            
            
