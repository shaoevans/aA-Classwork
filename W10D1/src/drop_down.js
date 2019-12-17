
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export class DropDown {
  constructor(htmlElement) {
    this.nav = htmlElement;
    this.header = this.nav.children[0];
    this.ul = this.nav.children[1];
    this.ul.classList.add("hidden");
    this.attachDogLinks();
    this.handleEnter();
    this.handleLeave();
  }

  dogLinkCreator() {
    let results = [];
    Object.keys(dogs).forEach((key) => {
      let a = document.createElement("a");
      a.href = dogs[key];
      a.innerHTML = key;
      results.push(a);
    });
    return results;
  }

  attachDogLinks() {
    let links = this.dogLinkCreator();
    links.forEach((link) => {
      let li = document.createElement("li");
      li.appendChild(link);
      this.ul.appendChild(li);
    });
  }

  handleEnter() {
    this.nav.addEventListener("mouseover", (e) => {
      this.ul.classList.remove("hidden");
    });
  }

  handleLeave() {
    this.nav.addEventListener("mouseout", (e) => {
      this.ul.classList.add("hidden");
    });
  }
}

const ul = document.getElementsByClassName("drop-down-dog-nav")[0];
const drop = new DropDown(ul);
