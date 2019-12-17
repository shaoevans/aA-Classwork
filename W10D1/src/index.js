import warmUp from "./warmup";
import Clock from "./clock";
import DropDown from "./drop_down";
import TodoList from "./todo_list";
import slideScroll from "./slide_scroll"
const debounce = require("./slide_scroll.js");
window.addEventListener('scroll', debounce(() => {
  console.log(window.scrollY, "Y")
  let imgs = document.querySelectorAll("img");
  
  imgs.forEach((img) => {
    const imgDim = img.getBoundingClientRect()
    const imgBot = imgDim.bottom;
    const imgHeight = imgDim.height;
    const y = window.scrollY;
    if ((imgBot - y) > (imgBot - imgHeight)) {
      img.classList.add('slide')
      img.style.opacity = 1;
    }
    
  })
}));

// 201 + 1138
// 881 + 458

// 1339 - 180 < 1339 - imgHeight
