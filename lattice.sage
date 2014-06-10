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

def test(K, x):
    return True

def find_solution(K, N_max):
    return []
