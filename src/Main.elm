module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
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
  { id: Int
  , title : String
  , isEditing : Bool
  , inputValue : String
  }

initialModel : Model
initialModel =
  { cardLists =
    [ CardList 0 "First" True ""
    , CardList 1 "Second" False ""
    ]
  }


init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

-- MESSAGES
type Msg
  = NoOp
  | HandleClick
  | EditCardListTitle Int
  | CancelEditCardListTitle Int
  | UpdateCardListTitle Int String

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    HandleClick ->
      let
        newIndex = List.length model.cardLists
        newCardList = List.append model.cardLists [CardList newIndex "New list" False ""]
      in
        ({ model | cardLists = newCardList }, Cmd.none)

    EditCardListTitle id ->
      let
        newCardList = List.map (openEditField id) model.cardLists
      in
        ({ model | cardLists = newCardList }, Cmd.none)

    CancelEditCardListTitle id ->
      let
        newCardList = List.map (closeEditField id) model.cardLists
      in
        ({ model | cardLists = newCardList }, Cmd.none)

    UpdateCardListTitle id newInput ->
      let
        newCardList = List.map (updateEditFieldText id newInput) model.cardLists
      in
          ({ model | cardLists = newCardList }, Cmd.none)

    NoOp ->
      (model, Cmd.none)

openEditField : Int -> CardList -> CardList
openEditField id cardList =
  updateEditField True id cardList

closeEditField : Int -> CardList -> CardList
closeEditField id cardList =
  updateEditField False id cardList

updateEditField : Bool -> Int -> CardList -> CardList
updateEditField isEditing id cardList =
  if cardList.id == id then
    { cardList | isEditing = isEditing }
  else
    cardList

updateEditFieldText : Int -> String -> CardList -> CardList
updateEditFieldText id newInputValue cardList =
  if cardList.id == id then
    { cardList | inputValue = newInputValue }
  else
    cardList

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Trello Clone" ]
    , button [ onClick HandleClick ] [ text "Add" ]
    , div [] (renderLists model.cardLists)
    ]

renderLists : List CardList -> List (Html Msg)
renderLists cardLists =
  List.map renderList cardLists

renderList : CardList -> Html Msg
renderList cardList =
  ul []
    [ li []
      [ span []
        [
          if cardList.isEditing then
            div []
              [ input
                [ placeholder "Change card title name"
                , value (getListInputValue cardList)
                , onInput (UpdateCardListTitle cardList.id)
                ]
                []
              , button [ onClick (CancelEditCardListTitle cardList.id) ] [ text "Cancel" ]
              ]
          else
            span [ onClick (EditCardListTitle cardList.id) ] [ text cardList.title ]
        ]
      ]
    ]

getListInputValue : CardList -> String
getListInputValue cardList =
  if cardList.inputValue == "" then
    cardList.title
  else
    cardList.inputValue

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
