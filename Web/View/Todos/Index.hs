module Web.View.Todos.Index where
import Web.View.Prelude

data IndexView = IndexView { todos :: [Todo] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
      <div class="max-w-7xl mx-auto py-12 sm:px-6 lg:px-8">
      <div class="max-w-4xl mx-auto">
      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
        <a href={TodosAction}>
        <h3 class="text-lg leading-6 font-medium text-gray-900">
          Todos
        </h3></a>
        <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
          Personal tasks for today
        </p>
      </div>
      <div>
          {forEach todos renderTodo}
      <div class="bg-gray-50 px-4 py-5 sm:px-6">
         <a href={pathTo NewTodoAction}>
         <button class="hover:bg-gray-200 rounded-full p-3">
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
        <div>
        <p class="mt-1 text-md leading-5 text-gray-900">
          {get #description todo}
        </p>
        <p class="mt-1 text-sm leading-5 text-gray-500">
          {timeAgo $ get #createdAt todo}
        </p>
        </div>
        <div class="space-x-3">
          <a href={EditTodoAction (get #id todo)}>
            <button class="p-3 hover:bg-gray-300 text-gray-500 hover:text-gray-600 rounded-full">
              <svg class="h-6 w-6 fill-current " viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                <path d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
              </svg>
            </button>
          </a>
          <a href={DeleteTodoAction (get #id todo)} class="js-delete">
            <button class="p-3 hover:bg-gray-300 text-gray-500 hover:text-gray-600 rounded-full">
              <svg class="h-6 w-6 fill-current " viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
              </svg>
            </button>
          </a>
      </div>
      </div>
|]
