doubleMe :: (Num a) => a -> a
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z'] ]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

anyOfThree :: (Eq a) => a -> a -> a -> Bool
anyOfThree a b c = a == b || a == c || b == c

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

failedGuard :: Int -> String
failedGuard 10 = "You got a 10!"

bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= under = "underweight"
  | bmi <= good = "good"
  | bmi <= over = "overweight"
  | otherwise   = "obese"
  where bmi = weight / height ^ 2
        under = 18.5
        good = 25.0
        over = 30.0

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n-1) x

take' :: Int -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _          = []
zip' _ []          = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ []     = False
elem' x (y:ys) = x == y || elem' x ys

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = filter (<= x) xs
      larger = filter (>x) xs
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger

prod :: (Num a) => [a] -> a
prod = foldl (*) 1

doTwice :: (a -> a) -> a -> a
doTwice f a = f (f a)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _          = []
zipWith' _ _ []          = []
zipWith' f (x:xs) (y:ys) = (f x y):(zipWith' f xs ys)

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

largestDivisible :: Integer
largestDivisible = head (filter p [99999,99998..])
  where p x = x `mod` 3829 == 0

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs)
  | p x = x : takeWhile' p xs
  | otherwise = []

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n
  | even n = n:collatz (n `div` 2)
  | otherwise = n:collatz (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map collatz [1..100]))

numSqrtsToExceed1000 :: Int
numSqrtsToExceed1000 = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

fn = ceiling . negate . tan . cos . max 50
