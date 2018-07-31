# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


categories = [
  {
    name: "Vehículos",
    subcategories: [
      "Aceites, líquidos y lubricantes",
      "Automobilia, coleccionistas",
      "Aviones: recambios y acces.",
      "Barcos: recambios y accesorios",
      "Buggies: accesorios",
      "Coche: Hi-Fi, GPS y tecnología",
      "Coches de época: piezas",
      "Coches: accesorios",
      "Coches: llantas y neumáticos",
      "Coches: recambios",
      "Coches: tuning y styling",
      "Motos de colección:acc. y rec.",
      "Motos: accesorios",
      "Motos: recambios",
      "Motos: ruedas y neumáticos",
      "Motos: tuning y styling",
      "Quads y karting: acc. y recam.",
      "Revistas, manuales, catálogos",
      "Scooters: recambios y acces.",
      "Taller: equipos y herramientas",
      "Trial y motocross: acc. y rec.",
      "Vehíc. comerc.: acc y recamb.",
      "Vestimenta y protección",
      "Aviones",
      "Barcos",
      "Buggies",
      "Caravanas y remolques",
      "Coches",
      "Coches para desguace",
      "Minimotos y pocket bikes",
      "Motos",
      "Motos para desguace",
      "Quads y karting",
      "Scooters",
      "Veh.industriales y comerciales"
    ]
  },
  {
    name: "Inmuebles",
    subcategories: [
      "Agrícolas",
      "Bodegas",
      "Casas",
      "Departamentos",
      "Estacionamientos",
      "Industriales",
      "Locales",
      "Loteos",
      "Lotes de Cementerio",
      "Oficinas",
      "Parcelas",
      "Sitios",
      "Terrenos",
      "Tiempo Compartido",
      "Otros Inmuebles"
    ]
  },
  {
    name: "Servicios",
    subcategories: [
      "Belleza",
      "Clases,Cursos y Capacitaciones",
      "Fiestas y Eventos",
      "Hogar",
      "Mantenimiento de Vehículos",
      "Profesionales",
      "Recreación y Ocio",
      "Servicio Técnico",
      "Servicios de Traslado",
      "Viajes y Turismo"
    ]
  },
  {
    name: "Tecnología",
    subcategories: [
      "Accesorios y almacenaje",
      "Cine",
      "Cintas de VHS",
      "LaserDiscs",
      "Lotes de cine, DVD y películas",
      "Otros formatos",
      "Películas en DVD y Blu-ray",
      "Películas UMD",
      "Accesorios",
      "Cajas de juegos originales",
      "Consolas",
      "Guías de juegos y trucos",
      "Manuales, portadas e insertos",
      "Merchandising de juegos",
      "Máquinas recreativas",
      "Tarjetas de acceso",
      "Videojuegos",
      "Accesorios cámaras/fotografía",
      "Cámaras de vídeo",
      "Cámaras digitales",
      "Drones con cámara",
      "Drones con cámara: rec. y acc.",
      "Flashes y accesorios",
      "Fotografía analógica",
      "Fotografía vintage",
      "Iluminación y estudio",
      "Manuales y guías",
      "Marcos digitales",
      "Objetivos y filtros",
      "Recambios y herramientas",
      "Telescopios y prismáticos",
      "Trípodes y soportes",
      "Accesorios reproductores MP3",
      "Accesorios TV y Home Audio",
      "Auriculares",
      "Baterías multiuso/electricidad",
      "Dispositivos electrónicos",
      "DVD, Blu-ray y Home Cinema",
      "Equipos de DJ y espectáculos",
      "Equipos Home Audio y HiFi",
      "Gafas inteligentes",
      "Manuales y documentación",
      "Realidad virtual",
      "Recambios para TV y Home Audio",
      "Recepción y decodificadores TV",
      "Reproduct. portátiles y radios",
      "Reproductores de MP3",
      "Televisores",
      "Vintage",
      "Accesorios para ordenadores",
      "Accesorios, tablets e eBooks",
      "Artículos de oficina y papelería",
      "Cables y conectores",
      "Componentes/piezas ordenador",
      "Conexión de redes",
      "Impresión 3D",
      "Impresoras, tintas y escáneres",
      "Informática vintage",
      "Manuales y recursos",
      "Monitores/proyectores/accesorios",
      "Portátiles y netbooks",
      "Protección/distrib./electricid",
      "Redes de empresa y servidores",
      "Software",
      "Tablets e eBooks: piezas",
      "Teclados, ratones y punteros",
      "Unidades de almacenamiento",
      "Sobremesas y monitores",
      "Componentes",
      "Accesorios de informática",
      "Juegos para PC",
      "Todo en Informática",
      "Bolígrafos y material de escritura",
      "Electrónica de oficina",
      "Acces. relojes inteligentes",
      "Accesorios para móviles y PDAs",
      "Equipos de radio",
      "Móviles con contrato",
      "Móviles de prepago",
      "Móviles ficticios de expositor",
      "Móviles libres",
      "PDAs",
      "Relojes inteligentes",
      "Tarjetas y lectores SIM",
      "Telefónos fijos vintage",
      "Teléfonos fijos y accesorios",
      "Teléfonos móviles vintage",
      "Teléfonos móviles: recambios",
      "Tonos, logos y software"
    ]
  },
  {
    name: "Hogar",
    subcategories: [
      "Alfombras y moquetas",
      "Artesanía y manualidades",
      "Artículos para animales",
      "Baño",
      "Chimeneas y accesorios",
      "Cocina, comedor y bar",
      "Cortinas y estores",
      "Decoración para bodas",
      "Decoración para el hogar",
      "Fiestas y ocasiones especiales",
      "Herramientas de bricolaje",
      "Iluminación de interiores",
      "Materiales de bricolaje",
      "Muebles",
      "Muebles y decoración infantil",
      "Relojes y despertadores",
      "Ropa de cama",
      "Saunas y spa",
      "Seguridad del hogar",
      "Soluciones de almacenamiento",
      "Terraza y jardín",
      "Aspiración y limpieza",
      "Cafeteras",
      "Calefacción y climatización",
      "Cocina: electrodomésticos peq.",
      "Cuidado personal y belleza",
      "Frigoríficos y congeladores",
      "Lavadoras y secadoras",
      "Lavavajillas",
      "Lavavajillas: accesorios",
      "Placas, hornos y campanas",
      "Planchado"
    ]
  },
  {
    name: "Deportes y salud",
    subcategories: [
      "Afeitado y depilación",
      "Baño y cuidado corporal",
      "Bronceado y protección solar",
      "Cuidado de la salud",
      "Cuidado de la vista, óptica",
      "Cuidado del cabello",
      "Cuidado del rostro",
      "Cuidado e higiene bucodental",
      "Manicura y pedicura",
      "Maquillaje",
      "Masajes",
      "Movilidad y minusvalía",
      "Perfumes",
      "Productos profesionales",
      "Tatuajes y arte corporal",
      "Terapias alternativas",
      "Vitaminas y suplem. dietarios",
      "Acampada y senderismo",
      "Baloncesto",
      "Béisbol",
      "Caza",
      "Ciclismo",
      "Deportes acuáticos",
      "Escalada y trekking",
      "Fitness, running y yoga",
      "Fórmula 1 y motociclismo",
      "Fútbol",
      "Gimnasia deportiva y rítmica",
      "Golf",
      "Juegos recreativos",
      "Montaña y esquí",
      "Otros deportes",
      "Paintball",
      "Patinaje",
      "Pesca",
      "Protección en el deporte",
      "Pádel y tenis",
      "Submarinismo",
      "Tiro con arco",
      "Trofeos"
    ]
  },
  {
    name: "Bebés y niños",
    subcategories: [
      "Accesorios para baño",
      "Alimentación del bebé",
      "Andadores y correpasillos",
      "Carritos y paseo",
      "Cunas, minicunas y capazos",
      "Juguetes y juegos",
      "Libros de bebé y premamá",
      "Maternidad y premamá",
      "Mobiliario y decoración bebés",
      "Mochilas portabebés",
      "Pañales y limpieza",
      "Ropa de cuna",
      "Ropa, calzado y complementos",
      "Seguridad",
      "Sillas de coche",
      "Automodelismo y aeromodelismo",
      "Casas de muñecas y miniaturas",
      "Catálogos de juguetes",
      "Figuras de acción",
      "Juegos",
      "Juegos al aire libre",
      "Juegos de rol y estrategia",
      "Juegos educativos",
      "Juguetes antiguos",
      "Juguetes de cine y TV",
      "Lego",
      "Marionetas",
      "Modelismo ferroviario",
      "Muñecas y accesorios",
      "Peluches",
      "Playmobil y Airgamboys",
      "Puzles y rompecabezas",
      "Radiocontrol y juguetes",
      "Scalextric y Slot Car",
      "Star Wars",
      "Tente"
    ]
  },
  {
    name: "Ropa, calzado y complementos",
    subcategories: [
      "Bodas y ceremonias",
      "Bolsos de mujer",
      "Calzado de hombre",
      "Calzado de mujer",
      "Complementos de hombre",
      "Complementos de mujer",
      "Disfraces y ropa de época",
      "Ropa de danza y complementos",
      "Ropa de hombre",
      "Ropa de mujer",
      "Ropa de trabajo",
      "Ropa erótica",
      "Ropa niños, calzado y complem.",
      "Ropa tradicional y del mundo",
      "Ropa y complementos vintage"
    ]
  },
  {
    name: "Gastronomía",
    subcategories: [
      "Aceites y aliños",
      "Cocina internacional",
      "Dulces, chocolate, café y té",
      "Embutidos",
      "Jamón y conservas",
      "Licores y whiskys",
      "Vinos"
    ]
  },
  {
    name: "Otras Categorías",
    subcategories: [
      "Antigüedades rústicas",
      "Aparatos y máquinas antiguas",
      "Arqueología y fósiles",
      "Arte digital y foto artística",
      "Arte étnico/Artesanía de mundo",
      "Artículos religiosos",
      "Cerámica y porcelana",
      "Directamente del artista",
      "Esculturas y tallas",
      "Forjados: hierro, bronce...",
      "Litografías y grabados",
      "Material de bellas artes",
      "Muebles antiguos y decoración",
      "Objetos antiguos y juguetes",
      "Pinturas",
      "Entradas para Eventos",
      "Equipamiento y maquinaria",
      "Accesorios y equipos",
      "Guitarras y bajos",
      "Instrumentos de cuerda",
      "Instrumentos de viento madera",
      "Instrumentos de viento metal",
      "Instrumentos vintage",
      "Libros, métodos de aprendizaje",
      "Partituras y libretos",
      "Percusión y baterías",
      "Sonido profesional",
      "Teclados y pianos",
      "Audiolibros",
      "Calendarios",
      "Colecciones y lotes",
      "Cómics",
      "Libros antiguos y de colección",
      "Libros de cocina y gastronomía",
      "Libros de texto y formación",
      "Libros infantiles y juveniles",
      "Libros prácticos y de consulta",
      "Literatura y narrativa",
      "Revistas",
      "CDs",
      "Cintas y cassettes",
      "Coleccionismo musical",
      "Conciertos en DVD",
      "Descargas digitales de música",
      "Lotes de música, CD y vinilos",
      "Ropa y merchandising",
      "Vinilos",
      "Bisutería",
      "Cuentas sueltas",
      "Diamantes y gemas sueltas",
      "Joyas para el cuerpo",
      "Joyeros y material joyería",
      "Joyería",
      "Joyería artesanal",
      "Joyería para hombre",
      "Otros",
      "Relojes, recambios y acces.",
      "Vintage y joyería antigua",
      "Actividades",
      "Alquiler de coches",
      "Cruceros",
      "Equipaje y accesorios de viaje",
      "Hoteles",
      "Paquetes vacacionales",
      "Tren y autobús",
      "Turismo rural",
      "Vuelos",
      "Adultos ",
      "Alimentos y Bebidas ",
      "Cotillón y Fiestas ",
      "Cuentas y Membresías ",
      "Esoterismo ",
      "Kms Aéreos ",
      "Seguros de Viaje ",
      "Sepulturas ",
      "Tatuajes ",
      "Otros"
    ]
  }
]

categories.each_with_index do |category, i|
  categoria = Category.create(name: category[:name])
  category[:subcategories].each_with_index do |subcat, i|
    Subcategory.create(name: subcat, category: categoria)
  end
end

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

options_products = [
  {
    name: 'Tallas',
    values: ['S', 'M', 'L', 'XL']
  },
  {
    name: 'Colores',
    values: ['Rojo', 'Verde', 'Azul', 'XL']
  }
]


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
    pyme = Pyme.create(
      # type_profile: 'pyme',
      title: Faker::SiliconValley.company,
      name: Faker::SiliconValley.character,
      email: Faker::SiliconValley.email,
      photo: Faker::Company.logo,
      phone: Faker::Company.duns_number,
      url: Faker::SiliconValley.url,
      address: Faker::Address.city,
      category_ids: [Faker::Number.between(1, 10),Faker::Number.between(1, 10)].uniq,
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
        cover: Rails.root.join('spec/support/product_cover.jpg').open,
        productable: pyme,
        price: Faker::Number.between(100, 10000),
        subcategory_ids: [Faker::Number.between(1, 356), Faker::Number.between(1, 356), Faker::Number.between(1, 356)].uniq,
      )

      CustomField.create(
        name: 'Garantía',
        value: "#{product.id} meses por fallas eléctricas",
        product_ids: product.id,
        customizable: pyme
      )

      options_products.each do |option|
        Option.create(
          name: option[:name],
          values: option[:values],
          product_ids: product.id,
          optionable: pyme
        )
      end

    end

    # Independent
    independent = Independent.create(
      # type_profile: 'independent',
      title: Faker::Job.unique.title,
      name: Faker::Name.name,
      email: Faker::Internet.safe_email,
      photo: Faker::Company.logo,
      phone: Faker::PhoneNumber.cell_phone,
      url: Faker::Internet.url,
      address: Faker::Address.state,
      category_ids: [Faker::Number.between(1, 10),Faker::Number.between(1, 10)].uniq,
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
        cover: Rails.root.join('spec/support/product_cover.jpg').open,
        productable: independent,
        price: Faker::Number.between(100, 10000),
        subcategory_ids: [Faker::Number.between(1, 356), Faker::Number.between(1, 356), Faker::Number.between(1, 356)].uniq,
      )

      CustomField.create(
        name: 'Garantía',
        value: "#{product.id} meses por fallas eléctricas",
        product_ids: product.id,
        customizable: independent
      )

      options_products.each do |option|
        Option.create(
          name: option[:name],
          values: option[:values],
          product_ids: product.id,
          optionable: independent
        )
      end

    end
  end

  # Creacion de 1 Usuario Seller
  seller = Seller.create(
    # type_profile: 'seller',
    title: Faker::SiliconValley.unique.app,
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    photo: Faker::Company.logo,
    phone: Faker::PhoneNumber.cell_phone,
    url: Faker::Internet.url,
    address: Faker::Address.state,
    category_ids: [Faker::Number.between(1, 10),Faker::Number.between(1, 10)].uniq,
    user: user
  )
  # Location to pyme
  coord = Faker::Number.between(0, 7)
  location = Location.create(
    latitude: coordenates[coord][:lat],
    longitude: coordenates[coord][:long],
    locatable: seller
  )
  puts seller.title

  # 3 Productos a un Seller
  3.times do
    product = Product.create(
      name: Faker::Job.field,
      cover: Rails.root.join('spec/support/product_cover.jpg').open,
      productable: seller,
      price: Faker::Number.between(100, 10000),
      subcategory_ids: [Faker::Number.between(1, 356), Faker::Number.between(1, 356), Faker::Number.between(1, 356)].uniq,

    )

    CustomField.create(
      name: 'Garantía',
      value: "#{product.id} meses por fallas eléctricas",
      product_ids: product.id,
      customizable: seller
    )

    options_products.each do |option|
      Option.create(
        name: option[:name],
        values: option[:values],
        product_ids: product.id,
        optionable: seller
      )
    end

  end
  puts "-------------\n"

end
superadmin = User.create(
  name: 'Bigwave Superadmin',
  email: 'bigwave.admin@gmail.com',
  password: '+12345678+',
  password_confirmation: '+12345678+',
  nickname: 'admin'
)
superadmin.add_role :superadmin
puts "Superadmin created"

# Profile.all.map{|profile| profile.create_locations}
