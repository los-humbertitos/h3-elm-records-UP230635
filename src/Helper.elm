module Helper exposing (..)

import Html


add2 : Int -> Int -> Int
add2 x y =
    x + y


add3 : Float -> Float -> Float -> Float
add3 x y z =
    x + y + z


calc : a -> a -> (a -> a -> b) -> b
calc x y op =
    op x y



--https://classroom.github.com/a/XK-1vfwc


langs : List { name : String, releaseYear : Int, currentVersion : String }
langs =
    [ { name = "Java"
      , releaseYear = 1991
      , currentVersion = "23.0"
      }
    , { name = "Elm"
      , releaseYear = 2012
      , currentVersion = "0.19.1"
      }
    ]


languageNames :
    List { name : String, releaseYear : Int, currentVersion : String }
    -> List String
languageNames inData =
    List.map .name inData


users : List { name : String, uType : String }
users =
    [ { name = "Roberto", uType = "Student" }
    , { name = "Mitsiu", uType = "Professor" }
    ]


onlyStudents :
    List { name : String, uType : String }
    -> List String
onlyStudents list =
    List.map
        (\u ->
            case .uType u of
                "Student" ->
                    .name u

                _ ->
                    ""
        )
        list


type alias Videogame =
    { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }


videogames : List Videogame
videogames =
    [ { title = "Control"
      , releaseYear = 2019
      , available = True
      , downloads = 1234567
      , genres = [ "Action", "Shooter" ]
      }
    , { title = "Ocarina of time"
      , releaseYear = 1998
      , available = False
      , downloads = 12345
      , genres = [ "Action", "Adventure" ]
      }
    ]


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres list =
    List.map .genres list


type alias Computer =
    { ram : String
    , model : String
    , brand : String
    , screenSize : String
    }


myLaptop : Computer
myLaptop =
    { ram = "32", model = "Tinkpad", brand = "Lenovo", screenSize = "16" }


main : Html.Html msg
main =
    Html.div []
        [ Html.h1 [] [ Html.text "My laptop" ]
        , Html.div []
            [ aList
                [ "Ram: " ++ .ram myLaptop
                , "Modelo: " ++ .model myLaptop
                , "Marca: " ++ .brand myLaptop
                , "Pulgadas: " ++ .screenSize myLaptop

                --[ Html.text ("Ram: " ++ .ram myLaptop) ]
                ]
            ]
        ]


aList : List String -> Html.Html msg
aList listcontent =
    Html.ul
        []
        (List.map anItem listcontent)


anItem : String -> Html.Html msg
anItem content =
    Html.li [] [ Html.text content ]
