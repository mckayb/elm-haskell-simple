-- import Http
-- import Json.Decode as Json
import Html exposing (..)
import Html.Attributes exposing (..)

-- component import example
import Components.Hello as Hello


-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update }


-- MODEL
type alias Model =
  { helloModel: Hello.Model
  }

model : Model
model =
  { helloModel = Hello.initialModel
  }

-- UPDATE
type Msg =
  HelloMsg Hello.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    HelloMsg subMsg ->
      let updatedHelloModel = Hello.update subMsg model.helloModel
      in { model | helloModel = updatedHelloModel }

-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ] [    -- inline CSS (literal)
    div [ class "row" ] [
      div [ class "col-xs-12" ] [
        div [ class "jumbotron" ] [
          img [ src "static/img/elm.jpg", style styles.img ] []                             -- inline CSS (via var)
          , div [] [ Html.map HelloMsg (Hello.view model.helloModel) ]
          , p [] [ text ( "Elm Webpack Starter" ) ]
        ]
      ]
    ]
  ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
