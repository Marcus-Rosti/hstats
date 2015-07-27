import Test.Tasty
import Mean_Tests (mean_tests_props)
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [properties]

properties = testGroup "All Property tests" [mean_tests_props]
