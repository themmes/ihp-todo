module Web.View.Todos.Index where
import Web.View.Prelude

data IndexView = IndexView { todos :: [Todo] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
      <div class="max-w-7xl mx-auto py-12 sm:px-6 lg:px-8">
      <div class="max-w-4xl mx-auto">
      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
  <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      Todos
    </h3>
    <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
      Personal tasks for today
    </p>
  </div>
  <div>
          {forEach todos renderTodo}
      <div class="bg-gray-50 px-4 py-5 sm:px-6">
         <a href={pathTo NewTodoAction}><button class="hover:bg-gray-100 rounded-full p-3">
           <svg viewBox="0 0 16 16" class="h-6 w-6 fill-current text-gray-800" xmlns="http://www.w3.org/2000/svg">
             <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4a.5.5 0 0 0-1 0v3.5H4a.5.5 0 0 0 0 1h3.5V12a.5.5 0 0 0 1 0V8.5H12a.5.5 0 0 0 0-1H8.5V4z"/>
           </svg>
         </button></a>
      </div>
  </div>
</div>
      </div>
      </div>
    |]


renderTodo todo = [hsx|
      <div class="bg-gray-50 px-4 py-5 sm:px-6 flex justify-between hover:bg-gray-100">
        <p class="mt-1 text-md leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
          {get #description todo}
        </p>
        <div class="space-x-3">
          <a class="text-sm text-gray-500 hover:text-blue-500" href={ShowTodoAction (get #id todo)}>Show</a>
          <a class="text-sm text-gray-500 hover:text-blue-500" href={EditTodoAction (get #id todo)}>Edit</a>
          <a class="text-sm text-gray-500 hover:text-blue-500 js-delete" href={DeleteTodoAction (get #id todo)}>Delete</a>
      </div>
      </div>
|]
