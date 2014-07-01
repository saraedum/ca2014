from sage.modules.free_module_integer import IntegerLattice

def getVector(entry, posOf1, size):
    v=[0 for i in range(size)]
    v[0]=entry
    v[posOf1]=1
    return v

def lattice(K, sigma, N):
    units = K.units();
    embUnits = [sigma(u) for u in units]
    liste = [getVector(floor(N*log(abs(embUnits[i]))),i+1,len(units)+1) for i in range(len(units))]
    return IntegerLattice(liste)

def l2k(K,x):
    units = K.units()
    u = K.one()
    for j in range(1,len(x)):
        u *= units[j-1]^x[j]
    return u;

def test(K, x):
    u = l2k(K,x)
    
    return abs((1-u).norm())==1

def find_solution(K, N_max, num_shortest_vectors):
    RF=RealField(10000)
    UV = set()
    N = 1
    while N<=N_max:
        found = 0
        for sigma in K.embeddings(RF):
            L=lattice(K,sigma,N)
            for s in L.shortest_vectors(num_shortest_vectors):
                if test(K,s):
                    found += 1
                    u = l2k(K,s)
                    v = 1-u
                    UV.add((u,v))
        print "Found %s for N=%s"%(found,N)
        N*=2
    return UV;
