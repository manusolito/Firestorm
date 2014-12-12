Usuario.create!(nombre:  "ModoDios",
             email: "administrador@administrador.com",
             password:              "probando123",
             password_confirmation: "probando123",
			 tarjeta: "9876578945345987",
			 dni: "87654321",
			 url: "http://thumbs.media.smithsonianmag.com//filer/6d/20/6d207ae8-0c3c-455a-8ff2-8d3a7cf37ce0/smithsonian-photo-contest-winner-2012-crop.jpg__800x600_q85_crop.jpg",
             admin: true)
d=Date.new(2014,11,10).to_date
Usuario.create!(nombre: "Encatador de Perros",
                email: "mail@mail.com",
				tarjeta: "1234567890749267",
				password: 			   "probando123",
				password_confirmation: "probando123",
				dni: "12345678",
				url: "http://www.clker.com/cliparts/e/0/3/7/11971228763200152FunDraw_dot_com_Pipe_Smoking_Man.svg.hi.png",
				admin: false)
Usuario.create!(nombre: "El pillo",
                email: "pillo@pillin.com",
				tarjeta: "7483927584758693",
				password: 			   "probando123",
				password_confirmation: "probando123",
				dni: "23456789",
				url: "http://www.desarrollowebavanzado.com/imagenes/Man-DBrown-icon.png",
				admin: false)
Usuario.create!(nombre: "Le man",
                email: "man@manoso.com",
				tarjeta: "7483729047584392",
				password: 			   "probando123",
				password_confirmation: "probando123",
				dni: "34567890",
				url: "http://questiones.info/Curiosidades/ChistesImages/Miscelaneos/Thief.jpg",
				admin: false)
Categoria.create!(nombre: "Mascotas")
Producto.create!(nombre: "Perro",
               descripcion: "Ladra Mucho",
			   categoria: "Mascotas",
			   prourl: "http://www.fondosescritorio.net/wallpapers/Naturaleza/Animales/Perro-Cahorro.jpg",
			   usuario: Usuario.find_by(dni: "12345678"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
Oferta.create!(motivo: "Me gusta como ladra",
               monto: "50",
			   usuario: Usuario.find_by(nombre: "El pillo"),
			   producto: Producto.find_by(nombre: "Perro"))
Oferta.create!(motivo: "Super tiernis",
               monto: "100",
			   usuario: Usuario.find_by(nombre: "Le man"),
			   producto: Producto.find_by(nombre: "Perro"))
Producto.create!(nombre: "Perro dos",
               descripcion: "Ladra mas que el otro",
			   categoria: "Mascotas",
			   prourl: "http://www.fondosescritorio.net/wallpapers/Naturaleza/Animales/Perro-Cahorro.jpg",
			   usuario: Usuario.find_by(dni: "12345678"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
Oferta.create!(motivo: "Ni idea",
               monto: "12",
			   usuario: Usuario.find_by(nombre: "El pillo"),
			   producto: Producto.find_by(nombre: "Perro dos"))
Producto.create!(nombre: "Gato",
               descripcion: "Es Mudo",
			   categoria: "Mascotas",
			   prourl: "http://fotos0.mundofotos.net/2009/30_04_2009/sumari1241063254/gato-blanco.jpg",
			   usuario: Usuario.find_by(dni: "12345678"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
Oferta.create!(motivo: "No se, me ceba",
               monto: "12",
			   usuario: Usuario.find_by(nombre: "El pillo"),
			   producto: Producto.find_by(nombre: "Gato"))
Oferta.create!(motivo: "Es blanco como mis canas",
               monto: "32",
			   usuario: Usuario.find_by(nombre: "Le man"),
			   producto: Producto.find_by(nombre: "Gato"))
o=Producto.find_by(nombre: "Gato")
o.ofertagano_id=Oferta.find_by(motivo: "Es blanco como mis canas").id
o.diaventa = Date.new(2014,12,8).to_date
o.save

o=Producto.find_by(nombre: "Perro dos")
o.ofertagano_id=Oferta.find_by(motivo: "Ni idea").id
o.diaventa = Date.new(2014,12,8).to_date
o.save

Usuario.create!(nombre: "El Mostro",
                email: "email@email.com",
				tarjeta: "1244567890719267",
				password: 			   "probando123",
				password_confirmation: "probando123",
				dni: "7654321",
				url: "http://images6.fanpop.com/image/photos/36000000/Monsters-university-Halloween-monsters-inc-36001120-960-960.jpg",
				admin: false)

Producto.create!(nombre: "Bichin",
               descripcion: "No muerde...mucho",
			   categoria: "Mascotas",
			   prourl: "http://www.fotonat.org/data/media/3/2009-11---Campo-Ramon-Chacra-Mariposa---Bicho1---13x18x300_filtered.jpg",
			   usuario: Usuario.find_by(dni: "7654321"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
Oferta.create!(motivo: "Me caben los chobis",
               monto: "5",
			   usuario: Usuario.find_by(nombre: "Le man"),
			   producto: Producto.find_by(nombre: "Bichin"))
d=Date.new(2014,12,30).to_date
Producto.create!(nombre: "Spider-pig",
               descripcion: "Camina por el techo",
			   categoria: "Mascotas",
			   prourl: "http://imgs.tuts.dragoart.com/how-to-draw-spider-pig_1_000000003520_3.jpg",
			   usuario: Usuario.find_by(dni: "7654321"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
Oferta.create!(motivo: "Mi mujer limpia el techo",
               monto: "1000",
			   usuario: Usuario.find_by(nombre: "Le man"),
			   producto: Producto.find_by(nombre: "Spider-pig"))
Producto.create!(nombre: "Coco",
               descripcion: "Esta en la casa",
			   categoria: "Mascotas",
			   prourl: "http://fromperu.galeon.com/zoologico/fotos/cocodrilo.jpg",
			   usuario: Usuario.find_by(dni: "7654321"),
			   categoria: Categoria.find_by(nombre: "Mascotas"),
			   vencimiento: d)
			   
o=Producto.find_by(nombre: "Bichin")
o.ofertagano_id=Oferta.find_by(motivo: "Me caben los chobis").id
o.diaventa = Date.new(2014,11,17).to_date
o.save
			   

			   
			   
