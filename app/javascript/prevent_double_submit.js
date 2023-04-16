document.addEventListener("DOMContentLoaded", function() {
  console.log("DOMContentLoaded"); // Add this line
  const form = document.querySelector("form");
  const submitButton = form.querySelector('input[type="submit"]');

  form.addEventListener("submit", function(event) {
    console.log("Form submitted");
    submitButton.disabled = true;
  });
});