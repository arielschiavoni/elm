module Main exposing (..)

import Html
import String


uppercaseName : String -> Int -> String
uppercaseName name maxLength =
    if String.length name > maxLength then
        String.toUpper name
    else
        name


main : Html.Html a
main =
    let
        name =
            "Ariel Schiavoni"
    in
        (uppercaseName name 10)
            ++ " - name length: "
            ++ toString (String.length name)
            |> Html.text
