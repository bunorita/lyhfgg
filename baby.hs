-- {-# OPTIONS_GHC -Wall -Werror #-}
{-# OPTIONS_GHC -Wall #-}

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x =
  if x > 100
    then x
    else x * 2

boomBangs xs =
  [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

removeNonUppercase :: String -> String
removeNonUppercase str =
    [c|c<-str, c `elem` ['A'..'Z']]

factorial :: Integer -> Integer
-- factorial n = product [1..n]
factorial 0 = 1
factorial n = n * factorial (n-1)

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

lucky :: Int -> String
lucky 7 = "Lucky number seven!"
lucky x = "Sorry, you're out of luck, pal!"

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName _ = "???"

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)

first :: (a,b,c) -> a
first (a,_,_) = a

second :: (a,b,c) -> b
second (_,b,_) = b

third :: (a,b,c) -> c
third (_,_,c) = c

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]


-- Guards
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal.\
                   \ Pffft, I bet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some wight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal.\
                                   \ Pffft, I bet you're ugly!"
  | bmi <= fat    = "You're fat! Lose some wight, fatty!"
  | otherwise                   = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b    = b
  | otherwise = a

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
  | a == b    = EQ
  | a <= b    = LT
  | otherwise = GT


niceGreeting :: String
niceGreeting = "Hello! So very nice to see you,"
badGreeting :: String
badGreeting = "Oh! Pfft. It's you."
greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l]
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h |(w, h) <- xs]
    where bmi weight height = weight / height ^ 2
