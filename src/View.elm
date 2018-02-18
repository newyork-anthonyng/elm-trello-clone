module View exposing (..)

import Messages exposing (..)
import Html exposing (..)
import Models exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

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
              , button [ onClick (SaveCardListTitle cardList.id) ] [ text "Save" ]
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
