module Main       exposing (..)


import Commands   exposing (fetchPlayers)
import Models     exposing (Model, initialModel)
import Messages   exposing (Msg)
import Navigation exposing (Location)
import Routing
import Update     exposing (update)
import View       exposing (view)



init : Location -> (Model, Cmd Msg)
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchPlayers )


--SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


--MAIN
main : Program Never Model Msg
main =
    Navigation.program Messages.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions                   
        }
