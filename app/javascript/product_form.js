document.addEventListener("turbo:load", function() {
  const showProductFormButton = document.getElementById("show-product-form-button");
  const productForm = document.querySelector(".product-form");

  if (showProductFormButton && productForm) {
    showProductFormButton.addEventListener("click", function(event) {
      event.preventDefault();
      productForm.classList.toggle("hidden");
    });
  }
});
