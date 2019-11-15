
const addSoundsToCards = () => {
  const cards = document.querySelectorAll(".card-container");
  cards.forEach((card) => {
    const soundUrl = card.dataset.soundUrl;
    const audio = new Audio();
    audio.src = soundUrl;
    card.addEventListener("mouseenter", (event) => {
      audio.volume = 1;
      audio.play();
    });
    card.addEventListener("mouseleave", (event) => {
      audio.volume = 0;
    });
  });
}

export {addSoundsToCards};
