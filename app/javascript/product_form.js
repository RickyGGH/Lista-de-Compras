document.addEventListener("turbo:load", function() {
  const addProductButton = document.getElementById("add-product-button");
  const productForm = document.getElementById("product-form");

  if (addProductButton && productForm) {
    addProductButton.addEventListener("click", function(event) {
      event.preventDefault();
      productForm.classList.toggle("hidden");
    });

    productForm.addEventListener("ajax:success", function(event) {
      // Hide the form after successfully adding a product
      productForm.classList.add("hidden");
      // Refresh the page after adding a product
      Turbo.visit(window.location, { action: "replace" });
    });
  }
});
