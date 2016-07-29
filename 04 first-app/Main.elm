module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String


-- model


type alias Model =
    { calories : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    -- Model 0 0 Nothing
    { calories = 0
    , input = 0
    , error = Nothing
    }



-- update


type Msg
    = AddCalories
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalories ->
            { model
                | calories = model.calories + model.input
                , input = 0
            }

        Input value ->
            -- try to convert string to int
            -- String.toInt returns a Result which is a union type Ok | Err
            -- if it is Ok the the conversion was successful and we have our int value. Otherwise
            -- we get en Err which contains the string error that has just happened
            case String.toInt value of
                Ok value ->
                    { model
                        | input = value
                    }

                Err error ->
                    { model
                        | input =
                            0
                            -- model.error is a Maybe so we can't set a String error directly, we have to use Just
                            -- which has Maybe type
                        , error = Just error
                    }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.calories)) ]
        , input
            [ placeholder "Enter your calories"
            , type' "text"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""
                 else
                    toString model.input
                )
            ]
            []
        , div
            [ style [ ( "color", "red" ) ] ]
            [ text (Maybe.withDefault "" model.error) ]
        , button
            [ type' "button"
            , onClick AddCalories
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        , p [] [ text (toString model) ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
