module Model exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { snake = Snake ( 10, 12 ) [ ( 10, 13 ), ( 10, 14 ) ] False
      , food = Just ( 10, 5 )
      , direction = Left
      , dead = False
      , map = createMap 20
      }
    , Cmd.none
    )


type alias Position =
    ( Int, Int )


type alias Food =
    Maybe Position


type alias Snake =
    { head : Position
    , tail : List Position
    , isGrowing : Bool
    }


type alias Model =
    { snake : Snake
    , direction : Direction
    , food : Food
    , dead : Bool
    , map : Map
    }


type Direction
    = Up
    | Down
    | Left
    | Right


type Msg
    = DirectionChange Direction
    | Tick
    | RestartGame
    | NoOp
    | PlaceFood Position


type Tile
    = Wall
    | Open Position


type alias Row =
    List Tile


type alias Map =
    List Row


createMap : Int -> Map
createMap size =
    List.map (\x -> createRow size x) (List.range 1 size)


createRow : Int -> Int -> Row
createRow size x =
    List.map (\y -> generateTileAt size ( x, y )) (List.range 1 size)


generateTileAt : Int -> Position -> Tile
generateTileAt size ( x, y ) =
    if x == 1 || y == 1 || x == size || y == size then
        Wall
    else
        Open ( x, y )
