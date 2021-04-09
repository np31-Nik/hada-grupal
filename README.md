		
Juan Carlos Sánchez González 77953880A

Juan Ramón Morales Gómez 48732239T

Robert Kazaryan Y4256793J

Serhii Vidernikov Y4459773H

Nikita Polyanskiy P550048833 (Coordinador)


● Descripción: 
Implementaremos una aplicación web de compra/alquiler de propiedades inmobiliarias, donde cada usuario registrado podrá publicar su propia propiedad, y cualquier visitante de la página podrá buscar a todas las propiedades publicadas a partir de criterios como ciudad,precio, tipo de propiedad, tipo de operación, etc, y podrá ver sus fotos, detalles, comentarios y el contacto del propietario.

● Parte pública: 
El usuario que no esté registrado podrá acceder a:

--La página principal, en la cual aparecerán:

	---Las propiedades cuyos propietarios son clientes premium.
	
	---La opción de registro / iniciar sesión.
	
	---La búsqueda de todas las propiedades de la BD, en la cual se podrá poner criterios de búsqueda como ciudad, precio, tipo de operación (venta/alquiler), y tipo de artículo(inmobiliaria/coches).
	
	---En caso de búsqueda de coches, se introducirán los días.
	
--Acceder a la página de cada artículo donde se podrá ver:

	---Fotos, descripción del artículo y el contacto del propietario.
	
	---Opciones de hipoteca.
	
	---Artículos similares.
	

● Listado EN Pública: 

ENArticulo: Se obtiene la informacion y fotos sobre el articulo.

ENComentario: Se almacenan y se obtienen los comentarios del articulo.

ENHipoteca: Se obtiene la informacion y opciones de la hipoteca para el articulo.

ENUsuario: Se comprueba si el usuario esta registrado o si es admin.

ENServicioPremium: Se obtienen los articulos premium y sus fotos.

ENBusqueda: Se obtienen los articulos segun los criterios de busqueda.

ENSimilares: Se obtienen varios articulos similares al actual.

ENIniciarSesion: Se almacena al nuevo usuario registrado o se comprueba si intenta iniciar sesion.

● Parte privada: 
El usuario registrado, además de tener las mismas funcionalidades que el usuario sin registrar, podrá:

--Publicar sus propios artículos desde la página principal, introduciendo una descripción, algunos detalles (tipo de artículo , tipo de propiedad, precio, tipo de operación, nº de dormitorios y baños…etc)

--Acceder a su perfil, donde podrá ver sus artículos publicados y editarlos.

--Solicitar ser cliente premium (se deberá introducir un método de pago).

--Dejar comentarios sobre una propiedad.



Además, habrá otro tipo de usuarios, los administradores, que podrán dirigir la aplicación web para su mejor rendimiento como por ejemplo, tener la potestad de poder dar de baja algún usuario malicioso, además de poder añadir más bancos para hipoteca, dar de baja cierto banco en la BD, etc. 

● Listado EN Privada: 
ENPublicar: Se almacena el articulo en la BD.



● Posibles mejoras: 

--Alquileres vacacionales (por días).

--Servicios de viaje y transporte.

