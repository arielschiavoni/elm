module Main exposing (..)

import Html
import String
import List


-- version 1 without composition
-- wordCount : String -> Int
-- wordCount sentence =
--     List.length (String.words sentence)


wordCount : String -> Int
wordCount =
    -- (String -> List String) -> (List String -> Int) -> (String -> Int)
    String.words >> List.length



-- another compositon example
-- see http://package.elm-lang.org/packages/elm-lang/core/4.0.3/Basics#>>


wordCountAsString : String -> String
wordCountAsString =
    -- (String -> Int) -> (Int -> String) -> (String -> String)
    wordCount >> toString


main : Html.Html a
main =
    "This is my sentence"
        |> wordCount
        |> toString
        |> Html.text
