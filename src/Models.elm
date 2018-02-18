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
  , cards: List Card
  }

type alias Card =
  { id : Int
  , text : String
  }

initialModel : Model
initialModel =
  { cardLists =
    [ CardList 0 "First" True "" []
    , CardList 1 "Second" False "" []
    ]
  }