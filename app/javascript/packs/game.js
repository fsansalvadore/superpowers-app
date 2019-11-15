//Elements
const canvas = document.getElementById('canvas');
const left = document.getElementById('left');
const right = document.getElementById('right');
const vs = document.getElementById('vs-icon');

const toggleCanvas = () => {
  canvas.classList.toggle('hidden');
}

const showScene = () => {
  canvas.classList.remove('hidden');
  left.classList.add('leftHalfScreen');
  right.classList.add('rightHalfScreen');
  vs.classList.add('dropDown');
}


const gameInit = () => {

  console.log(`Initializing game`);
  showScene();




}


export { gameInit };


