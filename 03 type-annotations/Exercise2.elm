module Main exposing (..)

import Html


type alias Item =
    { name : String, qty : Int, freeQty : Int }


cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    , { name = "Banana", qty = 15, freeQty = 0 }
    , { name = "Kiwi", qty = 25, freeQty = 0 }
    ]


calculateFreeQty : Int -> Int -> Item -> Item
calculateFreeQty minQty freeQty item =
    -- only calculate freeQty one time, we should not get multiple offers!
    if item.freeQty == 0 && minQty > 0 then
        { item | freeQty = item.qty // minQty * freeQty }
    else
        item


main : Html.Html msg
main =
    List.map ((calculateFreeQty 10 3) >> (calculateFreeQty 5 1)) cart
        |> toString
        |> Html.text
