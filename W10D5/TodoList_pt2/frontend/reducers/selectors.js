export const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map(id => {
    return state.todos[id];
  });
};

export const allErrors = (state) => {
  // array
  const errors = state.errors;
  return errors;
};
