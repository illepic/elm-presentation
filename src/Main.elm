module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, button, input, text)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)


-- If we choose to just import all:
--
-- import Html exposing (..)
-- import Html.Attributes exposing (..)
-- import Html.Events exposing (..)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    Int


model : Model
model =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Explicit String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Explicit value ->
            case String.toInt (value) of
                Ok value ->
                    value

                Err value ->
                    0



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [ class "input-group" ]
            [ div [ class "input-group-btn" ]
                [ button [ onClick Decrement, class "btn btn-warning btn-lg" ] [ text "-" ]
                ]
            , input
                [ type_ "text"
                , class "form-control form-control-lg"
                , value (toString model)
                , onInput Explicit
                ]
                []
            , div [ class "input-group-btn" ]
                [ button [ onClick Increment, class "btn btn-success btn-lg" ] [ text "+" ]
                ]
            ]
        ]
