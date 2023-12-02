module Day1 where

import Unicode.Char.Numeric
import Control.Arrow
import Data.List
import Data.Maybe
import Text.Read

parseNumPair :: String -> Maybe (Char, Char)
parseNumPair = maybeTuple . (&&&) (find isNumeric) (find isNumeric . reverse)

parseNumPair' :: String -> Maybe (Char, Char)
parseNumPair' = maybeTuple . (&&&) (find isNumeric . replaceStringNum) (find isNumeric . replaceStringNumRev . reverse)

replaceStringNum :: String -> String
replaceStringNum ('o':'n':'e':cs)         = '1' : replaceStringNum cs
replaceStringNum ('t':'w':'o':cs)         = '2' : replaceStringNum cs
replaceStringNum ('t':'h':'r':'e':'e':cs) = '3' : replaceStringNum cs
replaceStringNum ('f':'o':'u':'r':cs)     = '4' : replaceStringNum cs
replaceStringNum ('f':'i':'v':'e':cs)     = '5' : replaceStringNum cs
replaceStringNum ('s':'i':'x':cs)         = '6' : replaceStringNum cs
replaceStringNum ('s':'e':'v':'e':'n':cs) = '7' : replaceStringNum cs
replaceStringNum ('e':'i':'g':'h':'t':cs) = '8' : replaceStringNum cs
replaceStringNum ('n':'i':'n':'e':cs)     = '9' : replaceStringNum cs
replaceStringNum ('z':'e':'r':'o':cs)     = '0' : replaceStringNum cs
replaceStringNum (x:xs)                   = x   : replaceStringNum xs
replaceStringNum []                       = []

replaceStringNumRev :: String -> String
replaceStringNumRev ('e':'n':'o':cs)         = '1' : replaceStringNumRev cs
replaceStringNumRev ('o':'w':'t':cs)         = '2' : replaceStringNumRev cs
replaceStringNumRev ('e':'e':'r':'h':'t':cs) = '3' : replaceStringNumRev cs
replaceStringNumRev ('r':'u':'o':'f':cs)     = '4' : replaceStringNumRev cs
replaceStringNumRev ('e':'v':'i':'f':cs)     = '5' : replaceStringNumRev cs
replaceStringNumRev ('x':'i':'s':cs)         = '6' : replaceStringNumRev cs
replaceStringNumRev ('n':'e':'v':'e':'s':cs) = '7' : replaceStringNumRev cs
replaceStringNumRev ('t':'h':'g':'i':'e':cs) = '8' : replaceStringNumRev cs
replaceStringNumRev ('e':'n':'i':'n':cs)     = '9' : replaceStringNumRev cs
replaceStringNumRev ('o':'r':'e':'z':cs)     = '0' : replaceStringNumRev cs
replaceStringNumRev (x:xs)                   = x   : replaceStringNumRev xs
replaceStringNumRev []                       = []

numPairToInt :: (Char, Char) -> Maybe Int
numPairToInt = readMaybe . (\(x,y) -> [x,y])

maybeTuple :: (Maybe a, Maybe b) -> Maybe (a,b)
maybeTuple tup = case tup of
    (Just x, Just y) -> Just (x,y)
    _                -> Nothing

part1 :: String -> Int
part1 = sum . mapMaybe numPairToInt . mapMaybe parseNumPair . lines

part2 :: String -> Int
part2 = sum . mapMaybe numPairToInt . mapMaybe parseNumPair' . lines