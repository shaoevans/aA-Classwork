import React from 'react';
import TodoListItem from './todo_list_item';
import TodoListForm from './todo_list_form';


const TodoList = ({ todos, receiveTodo, removeTodo, fetchTodos, createTodo, errors }) => (
  <div>
    <ul>
      <li>
        {todos.map((todo, i) => {
          return (<TodoListItem todo={todo} key={i}
          removeTodo={removeTodo}/>)
        })}
      </li>
    </ul>
    <TodoListForm receiveTodo={receiveTodo} fetchTodos={fetchTodos} createTodo={createTodo} errors={errors} />
  </div>
)
export default TodoList;