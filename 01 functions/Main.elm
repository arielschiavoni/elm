-- expose all functions defined in this file


module Main exposing (..)

-- import the Html module to use `text` function

import Html


-- Note that in every elm file there is a small set of default imports that allow to use basic stuff like
-- math, use of data structures like lists, string manipulation, etc.
-- See: http://package.elm-lang.org/packages/elm-lang/core/4.0.3/


add : number -> number -> number
add a b =
    a + b


result : Bool
result =
    -- add (add 1 2) 3
    -- we can write the previous expression using the forward pipe operator |>.
    -- add 1 2 |> add 3
    -- anonymous functions can be created using \a -> a
    add 2 2 |> \a -> a % 2 == 0


counter : number
counter =
    -- Although this looks like a variable definition it is in fact a `Function`, more precisly a constant function
    -- so its values can't never be mutated. So there are no variables, only functions
    0


increment : number -> number -> number
increment cnt amt =
    -- we can define local functions/constans in a let expression
    let
        -- here we put our assignmnets
        localCount =
            cnt

        -- it is not possible to modify a constant, they are immutable.
        -- localCount =
        --     localCount + amt
    in
        -- here we use our assignmnets defined in let block and create expressions
        localCount + amt


main : Html.Html a
main =
    Html.text (toString result)
