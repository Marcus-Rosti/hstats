module Mean_Tests (mean_tests_units,mean_tests_props) where

-- Boilerplate
import Test.Tasty
import Test.Tasty.QuickCheck as SC
import Test.Tasty.HUnit

-- "mean" statistics
import Math.Statistics(mean, meanWgh, average, harmean, geomean)


mean_tests_units = testGroup "Mean unit tests" []
mean_tests_props = testGroup "Mean property tests" [mean_props,average_props,geomean_props,harmean_props]


trunk :: (Fractional a, RealFrac a) => a -> a
trunk f = (fromInteger $ round $ f * (10^5)) / (10.0^^5)

mean_props = testGroup "Regular mean properties"
    [ SC.testProperty "Should return sum divided by count - Double" $
        \x -> trunk (mean (x::[Double])) == trunk ((sum x) / (fromIntegral (length x))) || (mean x) == 0
    ]

average_props = testGroup "Average properties"
    [ SC.testProperty "Should return sum divided by count - Double" $
        \x -> trunk (average (x::[Double])) == trunk ((sum x) / (fromIntegral (length x))) || (average x) == 0
    ]

geomean_props = testGroup "Geometric mean properties"
    [ SC.testProperty "Should return the nth root of the product" $
        \x -> (trunk $ (product (x::[Double])) ** (1/fromIntegral (length x))) == (trunk $ geomean x)|| x == [] || (isNaN.geomean) x

    ]

harmean_props = testGroup "Harmonic mean properties" 
    [ SC.testProperty "Should return the harmonic mean" $
        \x -> harmean (x::[Double]) == (fromIntegral (length x )) / (sum (map ((/) 1) x)) || x == [] || (isNaN.harmean) x
    ]