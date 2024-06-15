import Text.Read (readMaybe)

multiplyVectorByScalar :: [Double] -> Double -> [Double]
multiplyVectorByScalar vector scalar = map (* scalar) vector

validateInput :: String -> IO Double
validateInput prompt = do
    putStrLn prompt
    input <- getLine
    case readMaybe input of
        Just number -> return number
        Nothing -> do
            putStrLn "Sorry, the input you provided is invalid. Please try again."
            validateInput prompt

main :: IO ()
main = do
    x1 <- validateInput "Enter x1's value."
    y1 <- validateInput "Enter y1's value."
    scalar <- validateInput "By how much do you want to scale the vector?"

    let vector = [x1, y1]
    let scaledVector = multiplyVectorByScalar vector scalar
    putStrLn $ "The vector " ++ show vector ++ " scaled by " ++ show scalar ++ " is " ++ show scaledVector ++ "."
