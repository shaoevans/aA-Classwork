import React from 'react';
import uniqueId from './../../util/unique_id';

class TodoListForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "" };
    this.id = uniqueId(); 
    this.updateBody = this.updateBody.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.submitForm = this.submitForm.bind(this);
  }

  updateTitle(e) {
    this.setState({ title: e.target.value});
  }

  updateBody(e) {
    this.setState({ body: e.target.value});
  }

  submitForm(e) {
    e.preventDefault();
    this.props.receiveTodo({
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body
    });

  }

  render() {
    return (
      <form>
        <label>Title
          <input onChange={this.updateTitle} type="text"/>
        </label>
        <label>Body
          <input onChange={this.updateBody} type="text"/>
        </label>
        <input onClick={this.submitForm} type="submit" value="Create Todo"/>
      </form>
    )
  }
}

export default TodoListForm;