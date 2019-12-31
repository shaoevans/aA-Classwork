import { combineReducers } from "redux";
import pokemonReducer from "./pokemon_reducer";

const EntitiesReducer = combineReducers({
  pokemon: pokemonReducer
})

export default EntitiesReducer;