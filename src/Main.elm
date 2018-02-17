module Main exposing (..)

import Html exposing (Html, div, text, program)

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
type alias Model =
  String

init : (Model, Cmd Msg)
init =
  ("Hello", Cmd.none)

-- MESSAGES
type Msg
  = NoOp

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ text model ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
