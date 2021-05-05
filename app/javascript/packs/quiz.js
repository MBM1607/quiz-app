
document.addEventListener('turbolinks:load', () => {
  document.getElementById('quiz-start')?.addEventListener('click', () => {
    document.querySelector('.qmodal').classList.toggle('is-active');
  });
});
