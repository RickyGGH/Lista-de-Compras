// app/assets/javascripts/shopping_list.js
document.addEventListener("click", function(event) {
  if (event.target.matches('.product-card input[type="checkbox"]')) {
    var checkbox = event.target;
    var productCard = checkbox.closest('.product-card');
    productCard.style.display = 'none'; // Ocultar el producto cuando se marca el checkbox "Purchased"

    // Obtener el ID del producto
    var productId = productCard.dataset.productId;

    // Verificar si el ID del producto es válido
    if (productId) {
      // Realizar una solicitud AJAX para marcar el producto como comprado
      fetch('/shopping_lists/' + productId, { // Cambiar a la ruta correcta
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ purchased: true })
      }).then(function(response) {
        // Manejar la respuesta según sea necesario
      }).catch(function(error) {
        console.error('Error:', error);
      });
    } else {
      console.error('Product ID is undefined');
    }
  }
});
