import Test.Tasty
import Mean_Tests (mean_tests_props)
main = defaultMain tests

tests :: TestTree
tests = testGroup "Hstats tests" [properties]

properties = testGroup "All property tests" [mean_tests_props]
