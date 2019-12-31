import React from 'react';

class PokemonIndex extends React.Component{
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    // console.log(this.props.pokemon)
    return (
      <div className="pokedex-body">
        <ul className="pokedex-index">
          {this.props.pokemon.map((poke, i) => {
            return (
              <li key={i}>
                {poke.id}
                <img className="img-size" src={poke.image_url} />
                {poke.name}
              </li>
            )
          })}
        </ul>
      </div>
    )
  }
}

export default PokemonIndex