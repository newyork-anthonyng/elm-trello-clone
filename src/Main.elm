module Main exposing (..)

import Html exposing (program)
import Models exposing (..)
import Messages exposing (..)
import Update exposing (..)
import View exposing (..)
import Subscriptions exposing (..)

-- Main
main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)
