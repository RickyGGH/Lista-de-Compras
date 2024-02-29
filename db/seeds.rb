StoreSection.create(name: "Carnes")
StoreSection.create(name: "Lácteos")
StoreSection.create(name: "Panificados")
StoreSection.create(name: "Verduras")
StoreSection.create(name: "Librería")
StoreSection.create(name: "Electrónica")
StoreSection.create(name: "Comestibles")
StoreSection.create(name: "Limpieza")
StoreSection.create(name: "Bebidas")

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
