# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


categories = [
  'Arte y antigüedades',
  'Bebés',
  'Belleza y salud',
  'Casa, jardín y bricolaje',
  'Cine, DVD y películas',
  'Coches, motos y otros vehíc.',
  'Coleccionismo',
  'Consolas y videojuegos',
  'Cámaras y fotografía',
  'Deportes',
  'Electrodomésticos',
  'Entradas para Eventos',
  'Equipamiento y maquinaria',
  'Imagen y sonido',
  'Informática y Oficina',
  'Instrumentos musicales',
  'Juguetes',
  'Libros, revistas y cómics',
  'Monedas y billetes',
  'Motor: recambios y accesorios',
  'Móviles y telefonía',
  'Música, CDs y vinilos',
  'Relojes y joyas',
  'Ropa, calzado y complementos',
  'Sellos',
  'Servicios',
  'Viajes',
  'Vinos y gastronomía',
  'Otras Categorías '
]

categories.each_with_index do |category, i|
  categoria = Category.create(name: category)
  # Subcategory.create(name: "Sub-#{i}", category: categoria)
end

#Recorrido para crear Usuarios, Profiles y Productos
10.times do |i|

  #Creacion de un Usuario
  user = User.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.free_email,
    password: 12345678,
    password_confirmation: 12345678,
    nickname: Faker::Internet.unique.user_name
  )
  puts user.email
  #Fin Creacion de un Usuario

  #Creacion de un 2 Pyme y 2 Independent a un usuario
  2.times do |i|

    #Pyme
    pyme = Pyme.create(
      type_profile: 'pyme',
      title: Faker::SiliconValley.company,
      name: Faker::SiliconValley.character,
      email: Faker::SiliconValley.email,
      photo: Faker::Company.logo,
      phone: Faker::Company.duns_number,
      url: Faker::SiliconValley.url,
      address: Faker::Address.city,
      user: user
    )
    puts pyme.title

    # 3 Productos a un Pyme
    3.times do
      product = Product.create(
        name: Faker::SiliconValley.invention,
        productable: pyme
      )
    end

    #Independent
    independent = Independent.create(
      type_profile: 'independent',
      title: Faker::Job.unique.title,
      name: Faker::Name.name,
      email: Faker::Internet.safe_email,
      photo: Faker::Company.logo,
      phone: Faker::PhoneNumber.cell_phone,
      url: Faker::Internet.url,
      address: Faker::Address.state,
      user: user
    )
    puts independent.title

    # 3 Productos a un Independent
    3.times do
      product = Product.create(
        name: Faker::Job.field,
        productable: independent
      )
    end

  end

  #Creacion de 1 Usuario Seller
  seller = Seller.create(
    type_profile: 'seller',
    title: Faker::SiliconValley.unique.app,
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    photo: Faker::Company.logo,
    phone: Faker::PhoneNumber.cell_phone,
    url: Faker::Internet.url,
    address: Faker::Address.state,
    user: user
  )
  puts seller.title

  # 3 Productos a un Seller
  3.times do
    product = Product.create(
      name: Faker::Job.field,
      productable: seller
    )
  end

  puts "-------------\n"

end
