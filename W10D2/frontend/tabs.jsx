import React from 'react';

class TabsComponent extends React.Component{
  constructor(props) {
    super(props);

    this.state = {
      index: 0
    }
  }

  clickHandler(index) {
    this.setState({index: index});
  }

  ifHidden(index) {
    if (index === this.state.index) {
      return "className='hidden'";
    }
  }


  render() {
    return (
      <div>
        <h1>Tabs</h1>
        <ul className="tab-holder">
          {this.props.array.map((obj, i) => {
            return (
              <li key={i}>
                <h1 onClick={() => clickHandler(i)}>{obj.title}</h1>
                <article>{obj.content}</article>
              </li>
            )
          })}
        </ul>
      </div>
      
    )
  }
}

export default TabsComponent;
