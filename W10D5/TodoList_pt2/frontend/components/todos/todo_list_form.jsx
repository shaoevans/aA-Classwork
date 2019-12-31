import React from 'react';

class TodoListForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "" };
    this.updateBody = this.updateBody.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.submitForm = this.submitForm.bind(this);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  updateTitle(e) {
    this.setState({ title: e.target.value});
  }

  updateBody(e) {
    this.setState({ body: e.target.value});
  }

  submitForm(e) {
    e.preventDefault();
    this.props.createTodo({
      title: this.state.title,
      body: this.state.body,
      done: false
    }).then(() => {
      this.setState({ title: '', body: '' });
    });
  }

  render() {
    return (
      <div>
        <form>
          <label>Title
          <input onChange={this.updateTitle} type="text" value={this.state.title} />
          </label>
          <label>Body
          <input onChange={this.updateBody} type="text" value={this.state.body} />
          </label>
          <input onClick={this.submitForm} type="submit" value="Create Todo" />
        </form>
        <ul>
          {this.props.errors.map((error, i) => {
            return (<li key={i}>{error}</li>)
          })}
        </ul>
      </div>

    )
  }
}

export default TodoListForm;