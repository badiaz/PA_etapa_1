# Proyecto de Tarjetas Etapa 1 Reto Pragma Academy

Este proyecto implementa un sistema de gestión de tarjetas en Flutter utilizando una arquitectura límpia haciendo uso del patrón Bloc. El proyecto está dividido en tres capas principales, la capa de presentación donde encontramos (UI, Blocs, Screens, Utils, Widgets), La lógica de negocio está desacoplada en **casos de uso** y la obtención de datos se simula a través de una capa de infrastructura donde tenemos el repositorio que simulará la obtención de una lista de tarjetas a una Api como data incial. Este enfoque facilita la extensión futura del proyecto, como la integración con una API real.

## Descripción del Proyecto

El proyecto permite la gestión de tarjetas (`CardEntity`) que contienen un título, descripción y un índice de color, (con este indice podemos obtener el color de la tarjeta que se encuentra mapeado en el archivos maps.dart en la carpeta utils). La aplicación utiliza el patrón **Bloc** para gestionar el estado y la lógica de negocio, manteniendo la UI y la lógica separadas, dado que no se utilizó ningun paquete externo se hizo uso de streams para tener una ui reactiva.

### Funcionalidades principales:

- Agregar nuevas tarjetas.
- Actualizar las tarjetas existentes.
- Eliminar tarjetas.
- Simular la obtención de tarjetas desde un repositorio.
- Manejo del estado con un **Bloc**.

## Estructura del Proyecto

La estructura del proyecto sigue una arquitectura limpia, dividiendo la lógica de negocio, la obtención de datos y la UI.

### Capas:

1. **Entidad (`CardEntity`)**: 
   - Modelo que define las propiedades de una tarjeta: `id`, `title`, `description`, y `colorIndex`.

2. **Bloc**: 
   - Gestiona el estado de las tarjetas y coordina la interacción entre la UI y los casos de uso. El Bloc maneja las operaciones principales como agregar, actualizar y eliminar tarjetas.
   
3. **Casos de Uso**: 
   - Los casos de uso (como obtener todas las tarjetas) encapsulan las reglas de negocio de la aplicación. Estos se comunican con el repositorio para obtener los datos y enviarlos al Bloc.
   
4. **Repositorio**: 
   - Simula la obtención de datos desde una API o base de datos. Se encarga de proporcionar los datos a los casos de uso. La implementación actual utiliza una lista en memoria para simular una API.

## Clases Principales

### 1. `CardEntity`
Define las propiedades de una tarjeta:
- **id**: Identificador único de la tarjeta.
- **title**: Título de la tarjeta.
- **description**: Descripción de la tarjeta.
- **colorIndex**: Índice que representa el color de la tarjeta.

### 2. `CardsBloc`
El Bloc maneja el estado de las tarjetas y se comunica con los casos de uso. Proporciona un `Stream` para emitir el estado actual de las tarjetas a la UI. Las principales funciones son:

- **addCard**: Añade una nueva tarjeta al estado.
- **updateCard**: Actualiza los detalles de una tarjeta existente.
- **deleteCard**: Elimina una tarjeta del estado.
- **getCards**: Llama al caso de uso para obtener las tarjetas desde el repositorio.
- **updateColorSelection**: Actualiza la selección de colores.
- **updateTitleCardToSaveEdit**: Carga al estado el valor del formfield del titulo.
- **updateDescriptionCardToSaveEdit**: Carga al estado el valor del formfield de la descripcion.
- **updateCardToEdit**: Carga al estado la card actual que se está editando.

### 3. `CardsState`
Representa el estado de las tarjetas en la aplicación. Contiene:

- **cards**: Lista de tarjetas en el estado actual.
- **selectedColorIndex**: Índice del color seleccionado.
- **titlecardToEditSaveText**: Título de la tarjeta que se está editando o guardando.
- **descriptioncardToEditSaveText**: Descripción de la tarjeta que se está editando o guardando.
- **cardToEdit**: La tarjeta que está siendo editada.

### 4. `CardsRepository`
Define las operaciones que se pueden realizar sobre las tarjetas (simulando una API). Los métodos principales son:

- **getCards**: Obtiene todas las tarjetas.

### 5. `GetCardsUseCase`
Este caso de uso encapsula la lógica para obtener las tarjetas desde el repositorio y devolverlas al Bloc.


## Cómo Ejecutar el Proyecto

### Instalación

1. Clona el repositorio:
   
   git clone https://github.com/badiaz/PA_etapa_1.git

   flutter clean 
   flutter pub get
   - Para modo release:
   flutter run --release 
   - Para modo debug: 
   flutter run 
