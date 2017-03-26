module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ text "Snake"
        , if model.dead then
            div [] [ text "Game over!", button [ onClick RestartGame ] [ text "Click to restart" ] ]
          else
            div [ class "map" ] (List.map (viewRow model.snake model.food) model.map)
        ]


viewRow : Snake -> Food -> Row -> Html Msg
viewRow snake food row =
    div [ class "row" ] (List.map (viewTile snake food) row)


viewTile : Snake -> Food -> Tile -> Html Msg
viewTile snake food tile =
    let
        className =
            if containsSnake tile snake then
                "snake"
            else if containsFood tile food then
                "food"
            else
                toString tile
    in
        span [ class (className ++ " tile") ] []


containsSnake : Tile -> Snake -> Bool
containsSnake tile snake =
    case tile of
        Wall ->
            False

        Open pos ->
            pos == snake.head || List.any ((==) pos) snake.tail


containsFood : Tile -> Food -> Bool
containsFood tile food =
    case tile of
        Wall ->
            False

        Open pos ->
            Just pos == food
