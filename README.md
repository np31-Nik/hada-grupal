		
Juan Carlos Sánchez González 77953880A

Juan Ramón Morales Gómez 48732239T

Robert Kazaryan Y4256793J

Serhii Vidernikov Y4459773H

Nikita Polyanskiy P550048833 (Coordinador)


● Descripción: 
Implementaremos una aplicación web de compra/alquiler de propiedades inmobiliarias y coches, donde cada usuario registrado podrá publicar su propio anuncio, y cualquier visitante de la página podrá buscar todos los anuncios publicados a partir de criterios como ciudad,precio, tipo de operación, etc, y podrá ver sus fotos, detalles, comentarios y el contacto del propietario.

● Parte pública: 
El usuario que no esté registrado podrá acceder a:

--La página principal, en la cual aparecerán:

	---Los anuncios cuyos propietarios son clientes premium.
	
	---La opción de registro / iniciar sesión.
	
	---La búsqueda de todos los anuncios de la BD, en la cual se podrá poner criterios de búsqueda como ciudad, precio, tipo de operación (venta/alquiler), y tipo de artículo(inmobiliaria/coches).
	
	
--Acceder a la página de cada artículo donde se podrá ver:

	---Fotos, descripción del artículo y el contacto del propietario.
	
	---Opciones de hipoteca.
	
	---Artículos similares.
	
	---Comentarios de otros usuarios.
	

● Listado EN Pública: 

ENAnuncio (Serhii): Se almacena la informacion sobre el anuncio + la informacion sobre el coche/propiedad.

ENCoche (Serhii): Se almacena la informacion sobre el coche.

ENPropiedad (Serhii): Se almacena informacion sobre la propiedad.

ENComentario (Nikita): Se almacena y se recogen los comentarios de los anuncios.

ENUsuario (Robert): Se registran los usuarios y se verifican al iniciar sesion, tambien se verifica si es admin.

ENHipoteca (Juan Carlos): Se almacena la informacion sobre la solicitud de hipoteca.


● Parte privada: 

El usuario registrado, además de tener las mismas funcionalidades que el usuario sin registrar, podrá:

--Publicar sus propios artículos desde la página principal, introduciendo una descripción, algunos detalles (tipo de artículo , tipo de propiedad, precio, tipo de operación, nº de dormitorios y baños…etc)

--Acceder a su perfil, donde podrá ver sus artículos publicados y editarlos.

--Solicitar ser cliente premium.

--Dejar comentarios sobre un anuncio.



Además, habrá otro tipo de usuarios, los administradores, que podrán dirigir la aplicación web para su mejor rendimiento como por ejemplo, tener la potestad de poder dar de baja algún usuario malicioso, además de poder añadir más bancos para hipoteca, dar de baja cierto banco en la BD, etc. 

● Listado EN Privada: 

ENFoto (Robert): Se almacenan las fotos.

ENBanco (Juan Carlos): Se almacena la informacion sobre los bancos.

ENTipoAnuncio (Robert): Se almacenan los tipos de anuncio (venta/alquiler...).

ENTipoPropiedad (Nikita): Se almacenan los tipos de propiedad (piso/chalet/adosado...).

ENMarcaCoche (Juan Ramon): Se almacenan las marcas de los coches.

ENTipoCoche (Juan Ramon): Se almacena el tipo de coche (familiar/furgoneta...).




● Posibles mejoras: 

--Alquileres vacacionales (por días).

--Servicios de viaje y transporte.


● Esquema E-R de la BD:
Se encuentra en el directorio raíz con nombre 'EER.png'.
