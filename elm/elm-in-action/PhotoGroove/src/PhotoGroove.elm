module PhotoGroove exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

view : { a | selectedUrl : String, photos : List { b | url : String } } -> Html { description : String, data : String }
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [id "thumbnails" ] (List.map
                                    (viewThumbnail model.selectedUrl)
                                    model.photos)
        , img
            [ class "large"
            , src ("http://elm-in-action.com/large/" ++ model.selectedUrl)
            ]
            []
        ]

viewThumbnail : String -> { a | url : String } -> Html { description : String, data : String }
viewThumbnail selectedUrl thumb =
    let
        urlPrefix =
            "http://elm-in-action.com/"
    in
    img [ src (urlPrefix ++ thumb.url)
        , classList [ ("selected", thumb.url == selectedUrl) ]
        , onClick { description = "ClickedPhoto", data = thumb.url }
        ]
        []

update : { a | description : String, url : b } -> { c | selectedUrl : b } -> { c | selectedUrl : b }
update msg model =
    if msg.description == "ClickedPhoto" then
        { model | selectedUrl = msg.url }
    else
        model

initialModel : { photos : List { url : String }, selectedUrl : String }
initialModel =
    { photos =
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "1.jpeg"
    }

main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
