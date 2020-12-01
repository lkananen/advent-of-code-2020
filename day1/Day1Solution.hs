module Day1Solution where

import System.IO

-- Returns n values which have the n entries sum corresponding to the target.
-- E.g. n=2 returns pairs     that sum up to the target sum.
--      n=3 returns triplets  that sum up to the target sum.
-- Note! Only implemented for n=[1..3]
-- filterByN :: (Ord a1, Num a1, Num a, Eq a) => [a1] -> a1 -> a -> [[a1]]
filterByN values target n
    | n == 1 = [[x]       | x<-values,                       x == target]
    | n == 2 = [[x, y]    | x<-values, y<-values,            x + y == target,     x < y]
    | n == 3 = [[x, y, z] | x<-values, y<-values, z<-values, x + y + z == target, x < y, y < z]
filterByN [] _ n = []

-- Converts a string with endline chars to an integer
-- E.g. "12\n" -> 12
strToInt :: [Char] -> Integer
strToInt xs = read [x | x<-xs, not (elem x "\n\r")] :: Integer

-- Uses list comprehension to prepare the data as a list of integers. The data gets run through the filter
-- and then the same preparation steps (conversions) get undone.
filterData :: (Num a, Eq a) => String -> Integer -> a -> String
filterData d target n = unlines [show l | l<-(filterByN [strToInt l | l<-(lines d)] target n)]


main :: IO()
main = do
    fileHandle <- openFile "day1RawDataDump.txt" ReadMode
    contents <- hGetContents fileHandle

    putStrLn "Solution pairs:"
    putStrLn $ filterData contents 2020 2

    putStrLn "Solution triplets:"
    putStrLn $ filterData contents 2020 3

    hClose fileHandle
