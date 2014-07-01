load 


# 
def maxPr(ZpCA_p, L):
    L_p = []
    L_p= [(ZpCA_p(p_i).log().abs(), p_i) for p_i in L]
    L_p.sort()
    return [pL for q,pL in L_p] 

def theta_i(p_Max, L):
    pass


# Beschreibung ###############
# Liefert eine Liste der Theta_i in Z ## 
def approx(m, Ti):
    Ti = [(t_i.lift()) for t_i in Ti]
    return Ti

def getVector(entry, posOf1, size):
    pass

def lattice(Ti_m):
    pass



def findSolution(S, M, num_shortest_vectors):
    L_P = []
    for p_i in S:
        ZpCA_p = ZpCA(p_i)

        while n<=M:
        L_P = maxPr(ZpCA_p, [q for q in S if q != p_i])
        Theta_i = theta_i(L_P)

        L = lattice()            




    
