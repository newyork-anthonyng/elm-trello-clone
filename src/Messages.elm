module Messages exposing (..)

-- MESSAGES
type Msg
  = NoOp
  | HandleClick
  | EditCardListTitle Int
  | CancelEditCardListTitle Int
  | UpdateCardListTitle Int String
  | SaveCardListTitle Int
