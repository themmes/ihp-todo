module Web.Controller.Todos where

import Web.Controller.Prelude
import Web.View.Todos.Index
import Web.View.Todos.New
import Web.View.Todos.Edit
import Web.View.Todos.Show
import Web.View.Todos.Index
import Web.View.Todos.New
import Web.View.Todos.Show
import Web.View.Todos.Edit

instance Controller TodosController where
    action TodosAction = do
        todos <- query @Todo |> fetch
        render IndexView { .. }

    action NewTodoAction = do
        let todo = newRecord
        render NewView { .. }

    action ShowTodoAction { todoId } = do
        todo <- fetch todoId
        render ShowView { .. }

    action EditTodoAction { todoId } = do
        todo <- fetch todoId
        render EditView { .. }

    action UpdateTodoAction { todoId } = do
        todo <- fetch todoId
        todo
            |> buildTodo
            |> ifValid \case
                Left todo -> render EditView { .. }
                Right todo -> do
                    todo <- todo |> updateRecord
                    setSuccessMessage "Todo updated"
                    redirectTo EditTodoAction { .. }

    action CreateTodoAction = do
        let todo = newRecord @Todo
        todo
            |> buildTodo
            |> ifValid \case
                Left todo -> render NewView { .. } 
                Right todo -> do
                    todo <- todo |> createRecord
                    setSuccessMessage "Todo created"
                    redirectTo TodosAction

    action DeleteTodoAction { todoId } = do
        todo <- fetch todoId
        deleteRecord todo
        setSuccessMessage "Todo deleted"
        redirectTo TodosAction

buildTodo todo = todo
    |> fill @'["description"]
