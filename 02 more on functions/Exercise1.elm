module Main exposing (..)

import Html
import String


(~=) : String -> String -> Bool
(~=) a b =
    String.left 1 a == String.left 1 b


main : Html.Html a
main =
    toString ("Ariel" ~= "Juan")
        |> Html.text
