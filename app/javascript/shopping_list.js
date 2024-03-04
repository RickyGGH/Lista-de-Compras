document.addEventListener("click", function(event) {
  if (event.target.matches('.product-card input[type="checkbox"]')) {
    var checkbox = event.target;
    var productCard = checkbox.closest('.product-card');
    productCard.style.display = 'none';

    var productId = productCard.dataset.productId;

    if (productId) {
      fetch('/shopping_lists/' + productId, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ purchased: true })
      }).then(function(response) {
      }).catch(function(error) {
        console.error('Error:', error);
      });
    } else {
      console.error('Product ID is undefined');
    }
  }
});
