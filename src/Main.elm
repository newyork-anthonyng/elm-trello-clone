module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)

-- Main
main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model = String

init : (Model, Cmd Msg)
init =
  ("Hi", Cmd.none)

-- MESSAGES
type Msg
  = NoOp
  | HandleClick

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    HandleClick ->
      (model ++ "i", Cmd.none)
    NoOp ->
      (model, Cmd.none)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text model ]
    , button [ onClick HandleClick ] [ text "Add" ]
    ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
