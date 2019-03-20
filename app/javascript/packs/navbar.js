const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const logo = document.querySelector('#nav-logo')
  const new_img = document.querySelector('#other-img').innerText
  const old_img = document.querySelector('#init-img').innerText

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
        navbar.querySelectorAll('a').forEach((a) => {
          a.style.color = 'black'; })
        logo.src = new_img
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        logo.src = old_img
        navbar.querySelectorAll('a').forEach((a) => {
          a.style.color = 'white';
        })
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
