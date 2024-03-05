Shopping List Application

Este es un proyecto de una aplicación de lista de compras desarrollada con Ruby on Rails.


Requisitos del Sistema

Ruby 3.2.3

Rails 7.1.3

SQLite


Instalación

1- Clona este repositorio en tu máquina local: git clone https://github.com/RickyGGH/Lista-de-Compras


2- Instala las dependencias del proyecto ejecutando: bundle install

3- Crea la base de datos, ejecuta las migraciones e inserta datos necesarios para el correcto funcionamiento: "rails db:create", luego "rails db:migrate" y finalmente "rails db:seed"


Ejecución

Para ejecutar la aplicación, simplemente corre el servidor de Rails: rails server

La aplicación estará disponible en http://localhost:3000.


Uso

1- Abre tu navegador web y ve a http://localhost:3000.

2- Puedes ver la lista de productos pendientes de compra agrupados por fecha.

3- Puedes agregar nuevos productos haciendo clic en el botón "Add Product".

4- Marca los productos como comprados haciendo clic en el checkbox correspondiente.

5- Los productos marcados como comprados se eliminarán automáticamente de la lista.
