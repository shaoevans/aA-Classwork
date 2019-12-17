
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  let p = document.createElement('p');
  p.innerHTML = string;
  htmlElement.appendChild(p);

};

htmlGenerator('Party Time.', partyHeader);
