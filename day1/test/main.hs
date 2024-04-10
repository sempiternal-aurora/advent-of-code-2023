module Main where

import Day1

main :: IO ()
main = do
    inLines <- readFile "p1-test"
    (putStr . (++['\n']) . reverse . replaceStringNumRev . reverse) inLines