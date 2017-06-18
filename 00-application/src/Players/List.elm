module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (Player)


view : List Player -> Html Msg
view players =
    div []
        [ nav
        , list players
        ]

nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Players" ] ]


list : List Player -> Html Msg
list players =
    div [ class "p2" ]
        [ table []
          [ thead []
                [ tr []
                      [ th [] []
                      , th [] []
                      , th [] []
                      , th [] []
                      , th [] []  
                      ]
                ]
          , tbody [] (List.map playerRow players)
          ]
        ]

playerRow : Player -> Html Msg
playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text (toString player.level) ]
        , td []
            []
        ]
