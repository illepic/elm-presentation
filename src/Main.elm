module Main exposing (..)

-- If we choose to just import all:
--
-- import Html exposing (..)
-- import Html.Attributes exposing (..)
-- import Html.Events exposing (..)

import Html exposing (Html, beginnerProgram, button, div, input, text)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)


-- main is NOT a function. main is a value of type Program with three arguments:
-- Never, Model, Msg just like String is an argument to the type List in: List String.
--
-- Because we're using beginnerProgram, this type signature says "We're going to
-- use a Program type that uses no flags (Never), has a model of type Model, and
-- passes messages of type Msg, all types defined within the scope of this file.


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- Our Model will be a simple integer. We're "aliasing" our model before we
-- actually instantiate one.


type alias Model =
    Int



-- Actually instantiate our model variable of type Model (and integer)


model : Model
model =
    0



-- We need to throw around Msg's, and there are only 3 in this Union:
-- Increment, Decrement, Explicit (which provides a String)


type Msg
    = Increment
    | Decrement
    | Explicit String



-- The update function takes in a Msg and Model and return a new Model. We
-- NEVER call this directly, but rather provide it to beginnerProgram.


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Explicit newval ->
            case String.toInt newval of
                Ok newval ->
                    newval

                Err value ->
                    0



-- Finally the view. This is provided to beginnerProgram and is responsible for:
-- 1. Generating HTML
-- 2. Emitting Msg's.


view : Model -> Html Msg
view model =
    div []
        [ div [ class "input-group" ]
            [ div [ class "input-group-prepend" ]
                [ button [ onClick Decrement, class "btn btn-warning btn-lg" ] [ text "-" ]
                ]
            , input
                [ type_ "text"
                , class "form-control form-control-lg"
                , value (toString model)
                , onInput Explicit
                ]
                []
            , div [ class "input-group-append" ]
                [ button [ onClick Increment, class "btn btn-success btn-lg" ] [ text "+" ]
                ]
            ]
        ]
