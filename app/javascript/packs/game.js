//Elements
const canvas = document.getElementById('canvas');
const left = document.getElementById('left');
const right = document.getElementById('right');
const vs = document.getElementById('vs-icon');
const score = document.getElementById('score');

const user_score = Math.floor((Math.random() * 10) + 1);
const opponent_score = Math.floor((Math.random() * 10) + 1);

const settleGame = () => {

  canvas.classList.add('blurred-background');

  setTimeout(() => {

  if (user_score > opponent_score) {
    score.insertAdjacentHTML('beforeend','You win!');
  } else if (user_score < opponent_score) {
    score.insertAdjacentHTML('beforeend','You lost!');
  } else {
    score.insertAdjacentHTML('beforeend',"It's a tie!");
  }

  }, 1000);

}

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

  setTimeout(() => {
    settleGame();
  },4000);

  setTimeout(() => {
    window.location.reload(true)
  },6000);

}

gameInit();


