module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)

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

    SaveCardListTitle id -> 
      let
        newCardList = List.map (saveCardListTitle id) model.cardLists
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

saveCardListTitle : Int -> CardList -> CardList
saveCardListTitle id cardList =
  if cardList.id == id then
    { cardList
    | title = cardList.inputValue
    , inputValue = ""
    , isEditing = False
    }
  else
    cardList

