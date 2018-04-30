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
  'Otras Categorías'
]

coordenates = [
  {
    lat: 11.7000583,
    long: -70.2054399
  },
  {
    lat: 11.6908227,
    long: -70.1890812
  },
  {
    lat: 11.6840798,
    long: -70.1811031
  },
  {
    lat: 11.6580284,
    long: -70.2076755
  },
  {
    lat: 11.6903822,
    long: -70.211555
  },
  {
    lat: 11.6905949,
    long: -70.1944855
  },
  {
    lat: 11.6627642,
    long: -70.2221431
  },
  {
    lat: 11.6567257,
    long: -70.1990896
  },
]

categories.each_with_index do |category, i|
  categoria = Category.create(name: category)
  # Subcategory.create(name: "Sub-#{i}", category: categoria)
end

# Recorrido para crear Usuarios, Profiles y Productos
10.times do |i|

  # Creacion de un Usuario
  user = User.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.free_email,
    password: 12345678,
    password_confirmation: 12345678,
    nickname: Faker::Internet.unique.user_name
  )
  puts user.email
  # Fin Creacion de un Usuario

  # Creacion de un 2 Pyme y 2 Independent a un usuario
  2.times do |i|

    # Pyme
    pyme = Profile.create(
      type_profile: 'pyme',
      title: Faker::SiliconValley.company,
      name: Faker::SiliconValley.character,
      email: Faker::SiliconValley.email,
      photo: Faker::Company.logo,
      phone: Faker::Company.duns_number,
      url: Faker::SiliconValley.url,
      address: Faker::Address.city,
      category_ids: [Faker::Number.between(1, 29),Faker::Number.between(1, 29)],
      user: user
    )
    # Location to pyme
    coord = Faker::Number.between(0, 7)
    location = Location.create(
      latitude: coordenates[coord][:lat],
      longitude: coordenates[coord][:long],
      locatable: pyme
    )
    puts pyme.title
    # 3 Productos a un Pyme
    3.times do
      product = Product.create(
        name: Faker::SiliconValley.invention,
        productable: pyme
      )
    end

    # Independent
    independent = Profile.create(
      type_profile: 'independent',
      title: Faker::Job.unique.title,
      name: Faker::Name.name,
      email: Faker::Internet.safe_email,
      photo: Faker::Company.logo,
      phone: Faker::PhoneNumber.cell_phone,
      url: Faker::Internet.url,
      address: Faker::Address.state,
      category_ids: [Faker::Number.between(1, 29),Faker::Number.between(1, 29)],
      user: user
    )
    coord = Faker::Number.between(0, 7)
    location = Location.create(
      latitude: coordenates[coord][:lat],
      longitude: coordenates[coord][:long],
      locatable: independent
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

  # Creacion de 1 Usuario Seller
  seller = Profile.create(
    type_profile: 'seller',
    title: Faker::SiliconValley.unique.app,
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    photo: Faker::Company.logo,
    phone: Faker::PhoneNumber.cell_phone,
    url: Faker::Internet.url,
    address: Faker::Address.state,
    category_ids: [Faker::Number.between(1, 29),Faker::Number.between(1, 29)],
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
