function initUpdateBannerOnScroll() {
  const transparent = document.querySelector('.transparent');
   if (transparent) {
    window.addEventListener('scroll', () => {
      // transparent.classList.add('make-transp');
      const scrollPosition = ((window.innerHeight - window.scrollY) / (window.innerHeight)) / 1.60
      console.log(`Inner height : ${window.innerHeight / 4}`)
      console.log(`Scroll Y : ${window.scrollY}`)
      console.log(scrollPosition)
      transparent.style.opacity = scrollPosition
    });
  }
  console.log("I'm working!")
};

export { initUpdateBannerOnScroll };
