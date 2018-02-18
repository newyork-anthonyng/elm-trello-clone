module Models exposing (..)

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