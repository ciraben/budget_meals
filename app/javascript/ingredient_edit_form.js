var component_buttons = document.querySelectorAll(".edit-ingredient");

component_buttons.forEach(function(btn) {
  let form = btn.parentElement.parentElement.querySelector(".component-form");

  btn.addEventListener('click', e => {
    if (form.style.display !== 'block') {
      form.style.display = 'block';
    }
  });

  let overlay_bg = form.querySelector(".overlay-background");

  if (overlay_bg) {
    overlay_bg.addEventListener("click", e => {
      if (event.target !== event.currentTarget) {}
      else if (form.style.display == 'block') {
        form.style.display = 'none';
      }
    });
  }
});
