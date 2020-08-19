module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Todos
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers =
        [ startPage TodosAction
        -- Generator Marker
        , parseRoute @TodosController
        ]

instance InitControllerContext WebApplication
