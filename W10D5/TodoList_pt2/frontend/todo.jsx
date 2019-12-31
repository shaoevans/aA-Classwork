import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store.js";
import { receiveTodos } from "./actions/todo_actions";
import Root from "./components/root";
import { allTodos } from "./reducers/selectors";
import { fetchTodos } from "./actions/todo_actions";

document.addEventListener("DOMContentLoaded", () => {
  // const arr = [
  //   {
  //     id: 1,
  //     title: 'wash car',
  //     body: 'with soap',
  //     done: false
  //   },
  //   {
  //     id: 2,
  //     title: 'wash dog',
  //     body: 'with shampoo',
  //     done: true
  //   }
  // ]
  const store = configureStore();
  window.allTodos = allTodos;
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.fetchTodos = fetchTodos;


  // store.dispatch(receiveTodos(arr))
  let oldRoot = document.getElementById("content");
  ReactDOM.render(<Root store={store}/>, oldRoot);
})