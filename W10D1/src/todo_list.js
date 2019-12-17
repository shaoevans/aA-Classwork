
 
const todos = JSON.parse(localStorage.getItem("todos")) || [];
export class TodoList {
  constructor(ul, form) {
    this.ul = ul;
    this.form = form;
    this.addTodo();
    this.populateList();
  }

  addTodo() {
    this.form.addEventListener("submit", (e) => {
      e.preventDefault();
      let inp = this.form.querySelector('input[name=add-todo]');
      let val = inp.value;
      todos.push(val);
      inp.value = "";
      this.populateList();
      let jsonstr = JSON.stringify(todos);
      localStorage.setItem("todos", jsonstr);

    });
  }
  
  populateList() {
    this.ul.innerHTML = ""; 
    todos.forEach((str) => {
      let p = document.createElement("p");
      let lb = document.createElement("label");
      let li = document.createElement("li");
      let check = document.createElement("input");
      check.setAttribute("type", "checkbox");
      p.innerHTML = str;
      p.setAttribute("done", false);
      lb.appendChild(p);
      li.appendChild(check);
      li.appendChild(lb);
      this.ul.appendChild(li);
    });
  }
}

let todoCont = document.getElementsByClassName("todo-container")[0];
let ul = todoCont.getElementsByClassName("todos")[0];
let form = todoCont.getElementsByClassName("add-todo-form")[0];
let tdlist = new TodoList(ul, form)