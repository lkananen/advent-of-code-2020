module Day1Solution where

import System.IO

-- Returns value pairs that sum up to target sum
filterByTwo :: (Ord a, Num a) => [a] -> a -> [[a]]
filterByTwo values target =
     [[x, y] | x<-values, y<-values, x + y == target, x < y]

-- Converts a string with endline chars to an integer
-- E.g. "12\n" -> 12
strToInt :: [Char] -> Integer
strToInt xs = read [x | x<-xs, not (elem x "\n\r")] :: Integer

-- Uses list comprehension to prepare the data as a list of integers. The data gets run through the filter
-- and then the same preparation steps (conversions) get undone.
filterData :: String -> String
filterData d = unlines [show l | l<-(filterByTwo [strToInt l | l<-(lines d)] 2020)]


main :: IO()
main = do
    fileHandle <- openFile "day1RawDataDump.txt" ReadMode
    contents <- hGetContents fileHandle
    -- putStr contents

    putStrLn $ filterData contents
    hClose fileHandle
