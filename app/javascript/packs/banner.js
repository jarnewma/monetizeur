const initUpdateBannerOnScroll = () => {
  const transparent = document.querySelector('.transparent');
   if (transparent) {
    window.addEventListener('scroll', () => {
      navbar.classList.add('.make-transp');
    });
  }
};

export { initUpdateBannerOnScroll };
