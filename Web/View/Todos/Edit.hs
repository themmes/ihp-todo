module Web.View.Todos.Edit where
import Web.View.Prelude

data EditView = EditView { todo :: Todo }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
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
      <div class="bg-gray-50 px-4 py-5 sm:px-6">
      {renderForm todo}
         <a href={pathTo NewTodoAction}>
         <button class="hover:bg-gray-200 rounded-full p-2">
           <svg class="h-8 w-8 fill-current text-gray-800" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
           <path d="M10.43 3.43l2.14 2.14a1.45 1.45 0 0 1 .43 1v5A1.45 1.45 0 0 1 11.55 13h-7.1A1.45 1.45 0 0 1 3 11.55v-7.1A1.45 1.45 0 0 1 4.45 3h5a1.45 1.45 0 0 1 .98.43zM8 7a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8 7zm0 .5a1 1 0 1 0 1 1 1 1 0 0 0-1-1zM9.25 3h-4.5v3h4.5zm-.5 0h-3.5v2.5h3.5z"/>
           </svg>
         </button></a>
      </div>
  </div>
</div>
      </div>
      </div>
    |]

renderForm :: Todo -> Html
renderForm todo = formFor todo [hsx|
    {textField #description}
    {submitButton}
|]
