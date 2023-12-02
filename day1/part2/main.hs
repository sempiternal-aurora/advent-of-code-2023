module Main where

import Day1

main :: IO ()
main = do
    inFile <- readFile "p1-input"
    (putStr . show . part2) inFile
    putStr "\n"

maybeTuple :: (Maybe a, Maybe b) -> Maybe (a,b)
maybeTuple tup = case tup of
    (Just x, Just y) -> Just (x,y)
    _                -> Nothing