function selectDropdown() {
  const nameDropdown = document.getElementById('nameDropdown')
  const nameInput = document.getElementById('nameInput')

  if (nameDropdown) {
    nameDropdown.addEventListener('input', event => {
      if (event.target.value === "Add manually") {
        nameInput.classList.remove('hidden')
        nameDropdown.parentNode.removeChild(nameDropdown)
        nameInput.focus()
      }
    })
  }


}

export default selectDropdown
