const meal_titles = document.querySelectorAll(".meal-title");

meal_titles.forEach(function(title) {
  let meal_details = title.nextElementSibling;

  if (!(meal_details.classList.contains("meal-details"))) {
    console.log(
      "My `meals.js` script may be broken because `.meal-details` \
      is no longer the direct sibling neighbor of `.meal-title`."
    );
  }

  title.addEventListener('click', e => {
    if (meal_details.style.maxHeight !== '600px') {
          meal_details.style.maxHeight = '600px';
    }
    else {
        meal_details.style.maxHeight = '0';
    }
  });
});
