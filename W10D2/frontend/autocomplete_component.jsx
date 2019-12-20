import React from 'react';

class AutocompleteComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {initialVal: ""};
    this.clickHandler = this.clickHandler.bind(this);
    this.update = this.update.bind(this);
  }

  clickHandler(e) {
    this.setState({initialVal: e.currentTarget.innerText});
  }

  update(e) {
    this.setState({initialVal: e.currentTarget.value})
  }



  render() {
    console.log(this.props.array)
    const results = this.props.array.filter((el) => {
      console.log(el.startsWith(""));

      return el.startsWith(this.state.initialVal);
    })
    console.log(results);
    return (
      <div>
        <h1>AutoComplete</h1>

        <div className="autocomplete">
          <h2>Search</h2>
          <input type="text" value={this.state.initialVal} onChange={this.update}/>
          <ul>
            {results.map((el, idx) => {
              return (
                <li key={idx} onClick={(e) => { this.clickHandler(e) }}>
                  {el}
                </li> 
                ) 
            })}
          </ul>
        </div>
      </div> 
    )
  }
}

export default AutocompleteComponent;