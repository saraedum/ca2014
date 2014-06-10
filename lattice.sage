def lattice(K, sigma, N):
    pass

def test(K, x):
    units = k.units()
    u = K.one()
    for j in range(1,len(x)):
        u *= units[j-1]^x[j]
    
    return (1-u) in K.unit_group()

def find_solution(K, N_max):
    return []
