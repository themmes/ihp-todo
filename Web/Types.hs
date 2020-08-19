module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [IHP.Controller.Session.FlashMessage]
    , controllerContext :: ControllerSupport.ControllerContext
    , layout :: Layout
    }

data TodosController
    = TodosAction
    | NewTodoAction
    | ShowTodoAction { todoId :: !(Id Todo) }
    | CreateTodoAction
    | EditTodoAction { todoId :: !(Id Todo) }
    | UpdateTodoAction { todoId :: !(Id Todo) }
    | DeleteTodoAction { todoId :: !(Id Todo) }
    deriving (Eq, Show, Data)
