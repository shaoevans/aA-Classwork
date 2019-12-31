import { connect } from "react-redux";
import TodoList from "./todo_list";
import { allTodos, allErrors } from "../../reducers/selectors";
import { receiveTodo, removeTodo, fetchTodos, createTodo } from "../../actions/todo_actions";

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: allErrors(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo)),
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
