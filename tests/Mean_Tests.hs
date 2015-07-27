module Mean_Tests (mean_tests_units,mean_tests_props) where

-- Boilerplate
import Test.Tasty
import Test.Tasty.Smallcheck as SC
import Test.Tasty.HUnit

-- "mean" statistics
import Math.Statistics(mean, meanWgh, average, harmean, geomean)


mean_tests_units = testGroup "Mean unit tests" []
mean_tests_props = testGroup "Mean property tests" [mean_props,average_props]

mean_props = testGroup "Regular mean properties"
    [ SC.testProperty "Should return sum divided by count - Double" $
        \x -> (mean (x::[Double])) == (sum x) / (fromIntegral (length x)) || (mean x) == 0,
        SC.testProperty "Should return sum divided by count - Float" $
        \x -> (mean (x::[Float])) == (sum x) / (fromIntegral (length x)) || (mean x) == 0

    ]

average_props = testGroup "Average properties"
    [ SC.testProperty "Should return sum divided by count - Double" $
        \x -> (average (x::[Double])) == (sum x) / (fromIntegral (length x)) || (average x) == 0,
        SC.testProperty "Should return sum divided by count - Float" $
        \x -> (average (x::[Float])) == (sum x) / (fromIntegral (length x)) || (average x) == 0

    ]