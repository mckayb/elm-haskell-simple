module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String

-- MODEL
type alias Model =
  { count: Int
  }

initialModel : Model
initialModel =
  { count = 0
  }

-- UPDATE
type Msg =
  Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | count = model.count + 1 }
    Decrement ->
      { model | count = (Basics.max (model.count - 1) 0) }

-- VIEW

view : Model -> Html Msg
view model =
  div [] [
    div [ class "h1" ] [ text ( "Hello, Elm" ++ ( "!" |> String.repeat model.count ) ) ]
    , div [] [
      button [ class "btn btn-primary btn-lg", onClick Increment ] [
        span [ class "glyphicon glyphicon-star" ] []
        , span [] [ text "FTW!" ]
      ]
      , button [ class "btn btn-default btn-lg", onClick Decrement ] [
        span [ class "glyphicon glyphicon-minus" ] []
        , span [] [ text "Nope" ]
      ]
    ]
  ]
