module App exposing (..)

import Html exposing (Html, div, text, program)



{- MODEL
 * the model of tha app is defined as a type alias, string here.
 * the init function provides initial state for the app

-}
type alias Model =
     String

init : ( Model, Cmd Msg )
init =
     ( "Hello", Cmd.none )



{- MESSAGES
 * Messages are things that happen in the app, to which components respond to.

-}
type Msg =
     NoOp



{- VIEW
 * The view uses the model to render an html.
 * Note: the return value Html curryed to Msg

-}
view : Model -> Html Msg
view model =
     div []
         [ text model ]


{- UPDATE
 * the update function is called by Html.program each time a messga is received
 * the update function responds to message by updating the model and returning commands

-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
       case msg of
       NoOp ->
            ( model, Cmd.none )


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
Finally Html.program wires everything together and returns an html 
element that we can render in the page. program takes our init, view,
update and subscriptions.

 -}
main : Program Never Model Msg
main =
     program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
