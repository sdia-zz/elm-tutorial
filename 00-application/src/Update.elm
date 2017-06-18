module Update   exposing (..)

import Messages exposing (Msg(..))
import Models   exposing (Model)
import Routing  exposing (parseLocation)
import Commands exposing (savePlayerCmd)
import Models   exposing (Model, Player)
import RemoteData




update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Messages.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Messages.ChangeLevel player howMuch ->
            let
                updatePlayer =
                    { player | level = player.level + howMuch }
            in
                ( model, savePlayerCmd updatePlayer )

        Messages.OnPlayerSave (Ok player) ->
            ( updatePlayer model player, Cmd.none )

        Messages.OnPlayerSave (Err error) ->
            ( model, Cmd.none )


updatePlayer : Model -> Player -> Model
updatePlayer model updatePlayer =
    let
        pick currentPlayer =
            if updatePlayer.id == currentPlayer.id then
                updatePlayer
            else
                currentPlayer

        updatePlayerList players =
            List.map pick players

        updatedPlayers =
            RemoteData.map updatePlayerList model.players
    in
        { model | players = updatedPlayers }
