{-# OPTIONS_GHC -Wall -Werror #-}

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
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

lucky :: Int -> String
lucky 7 = "Lucky number seven!"
lucky x = "Sorry, you're out of luck, pal!"
