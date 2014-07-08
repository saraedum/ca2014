load units.sage
from sage.modules.free_module_integer import IntegerLattice

# Uebergabeparameter: 
# Rueckgabe: 


# Uebergabeparameter: Ring der p-adischen Zahlen, Liste aller PZ ohne p
# Rueckgabe: geordnete Liste der PZ
def maxPr(ZpCA_p, L):
    L.sort(key=lambda q: -ZpCA_p(q).log().valuation())
    return L

# Uebergabeparameter: Ring der p-adischen Zahlen, geordnete Liste aller PZ ohne p
# Rueckgabe: Liste der theta_i
def theta_i(ZpCA_p,S):
    return [(ZpCA_p(pl).log()/ZpCA_p(S[-1]).log()).lift() for pl in S if pl!=S[-1]]

# Uebergabeparameter: Approximationsschranke m, Liste der theta_i
# Rueckgabe: Liste der theta_im
def approx(Ti):
    Ti = [(t_i.lift()) for t_i in Ti]
    return Ti

def getVector(entry, posOf1, size):
    v=[0 for i in range(size)]
    v[posOf1]=1
    v[-1]=entry
    print v
    return v

# Uebergabeparameter: p, Approximationsschranke m, Liste der theta_im
# Rueckgabe: Gitter Gamma_m
# Gitter.vector_space()([1,0,81]) in Gitter
def lattice(p,m,theta_im):
    r=len(theta_im)+1
    L=[getVector(theta_im[i],i,r) for i in range(r-1)]+[getVector(p^m,-1,r)]
    return IntegerLattice(L)
    
def toInt(x,S):
    prod=1
    for i in range(len(x)-1):
        prod *= S[i]^x[i]
    prod*=S[-1]^(-x[-1])
    return prod
    
def test(x,S,p):
    u=toInt(x,S)
    return is_unit__(1-u,S+[p])

def findSolution(S, M, num_shortest_vectors):
    L_P = []
    for p_i in S:
        print "p_i:", p_i
        m=1
        while m<=M:
            ZpCA_p = ZpCA(p_i,m)
            print "    m:", m
            L_P = maxPr(ZpCA_p, [q for q in S if q != p_i])
            #Theta_im = approx(m,theta_i(L_P))
            Theta_im = theta_i(ZpCA_p,L_P)
            L = lattice(p_i,m,Theta_im)
            for s in L.shortest_vectors(num_shortest_vectors):
                if test(s,L_P,p_i):
                    print toInt(s,L_P)
            m+=1
            
            
