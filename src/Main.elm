module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- Main function starts as an Html of msg


main : Html msg
main =
    -- Remember: all Html elements available are functions
    -- Each takes 2 arguments: attributs and children
    div [ class "a-class-name" ] [ text "Hello world" ]



-- Intermediate
-- main =
--   Html.beginnerProgram { model = 0, view = view, update = update }
-- type Msg = Increment | Decrement
-- update msg model =
--   case msg of
--     Increment ->
--       model + 1
--     Decrement ->
--       model - 1
-- view model =
--   div []
--     [ button [ onClick Decrement, class "btn btn-danger" ] [ text "-" ]
--     , h1 [ class "h1"] [ text (toString model) ]
--     , button [ onClick Increment, class "btn btn-success" ] [ text "+" ]
--     ]
