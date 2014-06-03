import inspect

def test_prime_factors():
    name = inspect.stack()[0][3]
    tester = sage.misc.sage_unittest.InstanceTester(name);
    tester.assertListEqual(prime_factors(-18),[2,3]);
    tester.assertListEqual(prime_factors(-17),[17]);
    tester.assertListEqual(prime_factors(2*2*3*19),[2,3,19]);
    tester.assertListEqual(prime_factors(11*13*13*13),[11,13]);
    tester.assertListEqual(prime_factors(101*7*2^10),[2,7,101]);
    tester.assertListEqual(prime_factors(1),[])
    print "Test cases in %s pass."%name

def test_is_unit():
    name = inspect.stack()[0][3]
    tester = sage.misc.sage_unittest.InstanceTester(name)
    N = [1,2,6,30]
    for n in N:
        S=prime_factors(n)
        X=[0,1,-1]  + [1/i for i in range(-1000,1000) if i!=0] + [j/i for i in range(-50,50) for j in range(-50,50) if i!=0]
        for x in X:
            tester.assertIs(is_unit(x,S),is_unit_(x,S))
    print "Test cases in %s pass."%name

def test_small_elements():
    name = inspect.stack()[0][3]
    tester = sage.misc.sage_unittest.InstanceTester(name)
    tester.assertEqual(len(small_elements(10,units([2,3]))), 882)
    tester.assertEqual(len(small_elements(5,units([2,3]))), 242)
    tester.assertEqual(len(small_elements(10,units([3]))), 42)
    tester.assertEqual(len(small_elements(10,units([]))), 2)
    print "Test cases in %s pass."%name

def test_units():
    name = inspect.stack()[0][3]
    tester = sage.misc.sage_unittest.InstanceTester(name)
    G=units([2,3,5]);
    tester.assertTupleEqual(G.gens_orders(),(2,0,0,0));
    tester.assertTupleEqual(G.variable_names(),('pm','p2','p3','p5'));
    G=units([]);
    tester.assertTupleEqual(G.gens_orders(),(2,));
    tester.assertTupleEqual(G.variable_names(),('pm',));

    G=units([3,7,19]);
    tester.assertTupleEqual(G.gens_orders(),(2,0,0,0));
    tester.assertTupleEqual(G.variable_names(),('pm','p3','p7','p19'));
    print "Test cases in %s pass."%name

def test_to_unit():
    name = inspect.stack()[0][3]
    tester = sage.misc.sage_unittest.InstanceTester(name)
    for S in ([],[2],[2,3]):
        for x in small_elements(10,units(S)):
            tester.assertEqual(to_unit(QQ(x),S),x)
    print "Test cases in %s pass."%name

test_is_unit()
test_prime_factors()
test_small_elements()
test_units()
test_to_unit()
