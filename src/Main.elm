module Main exposing (..)

import Html exposing (Html, div, text, ul, li, program)
import List exposing (..)

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
  { cardLists : List CardList
  }

type alias CardList =
  { name: String,
    cards: List Card
  }

type alias Card =
  { text: String
  }

initialModel : Model
initialModel =
  { cardLists = [ CardList "First" [ Card "Hi" ], CardList "Second" [ Card "bye" ]]
  }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

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
    (map createCardList model.cardLists)


createCardList : CardList -> Html Msg
createCardList cardList =
  ul []
    (concat [ [text cardList.name]
            , map createCard cardList.cards
    ])

createCard : Card -> Html Msg
createCard card =
  li []
    [ text card.text ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
