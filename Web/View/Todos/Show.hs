module Web.View.Todos.Show where
import Web.View.Prelude

data ShowView = ShowView { todo :: Todo }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TodosAction}>Todos</a></li>
                <li class="breadcrumb-item active">Show Todo</li>
            </ol>
        </nav>
        <h1>Show Todo</h1>
    |]
