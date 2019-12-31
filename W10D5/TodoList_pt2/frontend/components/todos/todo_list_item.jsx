import React from "react";

const TodoListItem = ({todo, removeTodo}) => (
  (
    <ul>
      <li>{todo.title}</li>
      <li>{todo.body}</li>
      <li><button onClick={() => removeTodo(todo)}>Delete Me</button></li>
    </ul>
  )
)

export default TodoListItem;