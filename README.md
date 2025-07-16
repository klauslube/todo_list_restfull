Todo List RESTful API

Projeto simples de API para gerenciamento de tarefas (To-Do List) com Ruby on Rails.

✅ Funcionalidades

Criar, listar, atualizar e excluir tarefas.

Filtrar tarefas por status, título, descrição, data de criação e data de vencimento.

Organização por scopes no model.

Atualização automática do status para overdue se a tarefa vencer.

🚀 Setup do Projeto

1. Clone o repositório

git clone https://github.com/klauslube/todo_list_restfull.git
cd todo_list_restfull

2. Instale as dependências

bundle install

3. Crie e migre o banco de dados

rails db:create db:migrate

4. Popule com tarefas exemplo (opcional)

rails db:seed

5. Rode o servidor

rails server

A API estará acessível em: http://localhost:3000/api/v1/tasks

🧪 Exemplos de uso com cURL

📃 Listar todas as tarefas

curl http://localhost:3000/api/v1/tasks

🔍 Filtrar tarefas por status

curl "http://localhost:3000/api/v1/tasks?status=completed"

➕ Criar uma tarefa

curl -X POST http://localhost:3000/api/v1/tasks \
 -H "Content-Type: application/json" \
 -d '{
"title": "Nova tarefa",
"description": "Descrição da tarefa",
"status": "in_progress",
"due_date": "2025-07-20"
}'

✏️ Atualizar uma tarefa

curl -X PATCH http://localhost:3000/api/v1/tasks/1 \
 -H "Content-Type: application/json" \
 -d '{"status": "completed"}'

🗑️ Deletar uma tarefa

curl -X DELETE http://localhost:3000/api/v1/tasks/1

📂 Estrutura da API

GET /api/v1/tasks

POST /api/v1/tasks

GET /api/v1/tasks/:id

PATCH /api/v1/tasks/:id

DELETE /api/v1/tasks/:id
