import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon } from "./actions/pokemon_actions"
import { fetchAllPokemon} from "./util/api_util";
import configureStore from "./store/store"
import { selectAllPokemon } from "./reducers/selectors";
import Root from "./components/root";

document.addEventListener('DOMContentLoaded', () => {

  const root = document.getElementById("root");
  const store = configureStore();
  window.getState = store.getState;
  window.requestAllPokemon = requestAllPokemon;
  window.dispatch = store.dispatch;
  window.receiveAllPokemon = receiveAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  ReactDOM.render(<Root store={store}/>,root)
});