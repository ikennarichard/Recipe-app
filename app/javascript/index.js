function slideUp() {
  const notice = document.querySelector('.notice');
  notice.classList.add('slide-up');
  console.log('Thanks')
}

setTimeout(slideUp, 5000);