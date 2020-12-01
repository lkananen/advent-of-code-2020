import Day1Solution

import Test.HUnit

-- Example raw file data
rawNums="1\r\n23\r\n45\r\n6\r\n78\r\n9"

-- Example use cases
twoDigitExampleData = fmap (filter (\x -> length x > 1 && length x < 3) . lines) $ readFile "day1ExampleData.txt"
processedExampleData = [Day1Solution.strToInt i | i<-lines rawNums]

test1Expected = [1,23,45,6,78,9]
test1 = TestCase (assertEqual "Raw string to integer conversion" processedExampleData test1Expected)

test2Input = "1010\n23\n61\n1010\n2019\n1\n2020\n0"
test2Expected = "[1,2019]\n[0,2020]\n"
test2 = TestCase (assertEqual "Custom data test" (Day1Solution.filterData test2Input) test2Expected )

tests = TestList[TestLabel "str2int" test1,
                 TestLabel "Filter test for custom input" test2
                 ]
