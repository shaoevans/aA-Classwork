export const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map(id => {
    return state.todos[id];
  });
};
