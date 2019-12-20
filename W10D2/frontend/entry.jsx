import React from 'react';
import ReactDOM from 'react-dom';
import ClockComponent from './clock';
import TabsComponent from './tabs';
import AutoCompleteComponent from "./autocomplete_component";


function NewRoot() {
  return (
    <div>
      <ClockComponent />
      <TabsComponent array={[{ title: "one", content: "i am one" }, {title: "two", content: "i am two"},{title: "three", content: "i am three"}]} />
      <AutoCompleteComponent array={["evans", "abba", "kevin", "jeff", "jenny", "sarah", "sally", "xander"]} />
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<NewRoot />,root);
});