module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import List

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
  {  cardLists : List CardList
  }

type alias CardList =
  { title : String
  }

init : (Model, Cmd Msg)
init =
  ({ cardLists = [] }, Cmd.none)

-- MESSAGES
type Msg
  = NoOp
  | HandleClick

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    HandleClick ->
      let
        newCardList = List.append model.cardLists [CardList "New list"]
      in
        ({ model | cardLists = newCardList }, Cmd.none)
    NoOp ->
      (model, Cmd.none)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Yo" ]
    , button [ onClick HandleClick ] [ text "Add" ]
    , div [] (renderLists model.cardLists)
    ]

renderLists : List CardList -> List (Html Msg)
renderLists cardLists =
  List.map renderList cardLists

renderList : CardList -> Html Msg
renderList cardList =
  ul []
    [ li [] [ text cardList.title ]
    ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
