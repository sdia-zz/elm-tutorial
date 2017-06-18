module App exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)



{- MODEL
 * the model of tha app is defined as a type alias, string here.
 * the init function provides initial state for the app

-}
type alias Model =
    Bool

init : ( Model, Cmd Msg )
init =
     ( False, Cmd.none )



{- MESSAGES
 * Messages are things that happen in the app, to which components respond to.

-}
type Msg
    = Expand
    | Collapse



{- VIEW
 * dependant of the state of the model.
 * this view is of type Html Msg, we can trigger msg of that type via onClick
 * Collapse and Expand are both of type Msg
 
-}
view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Collapse" ]
            , text "Widget"
            ]
    else
        div []
            [ button [ onClick Expand ] [ text "Expand" ] ]

{- UPDATE
 * update respnds to messages
 * depending of the messages it returns the desired state

-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
       case msg of
           Expand ->
               ( True, Cmd.none )
                
           Collapse ->
               ( False, Cmd.none )

{- SUBSCRIPTIONS
 * subscriptions listen for external inputs to the app
 * external inputs examples:
    - mouse movement
    - keyboard events

-}
subscriptions : Model -> Sub Msg
subscriptions model =
              Sub.none

{- MAIN
 1. Html.program calls view with the initial state and renders it
 2. when user clicks on expand, the view triggers the Expand message
 3. Html.program receives the Expand message, sends it to update along with the current app state 
 4. update function returns new app state and a command to run (here: Cmd.none)
 5. Html.program receives the updated state, stores it and calls the view with the updated state


Conclusion: Html.program is the only place where the state of the app is kept.

 -}
main : Program Never Model Msg
main =
     program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
