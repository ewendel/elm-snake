module Main exposing (..)

import Model exposing (..)
import View exposing (..)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import Html exposing (program)


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
