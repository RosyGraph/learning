import           Data.Char
import           Data.List
import           Geometry


numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String,Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode offset = map (chr . (+ offset) . ord)

decode :: Int -> String -> String
decode offset = encode (negate offset)

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find ((== 40) . digitSum) [1..]
