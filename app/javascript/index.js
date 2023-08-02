function slideUp() {
  const notice = document.querySelector('.notice');
  notice.classList.add('slide-up');
}


function togglePublicStatus() {
  const publicStatusElement = document.querySelector('.toggle-btn');
  const toggler = document.querySelector('.toggle-btn-toggle');

    publicStatusElement.classList.toggle('public');
    toggler.click()
    setTimeout(slideUp, 5000);
};




