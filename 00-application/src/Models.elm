module Models exposing (..)

import RemoteData exposing (WebData)



type alias Model =
    { players : WebData (List Player)
    }
    
type alias PlayerId =
    String

type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }
        
initialModel : Model
initialModel =
    { players = RemoteData.Loading
    }

