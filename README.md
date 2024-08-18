Este proyecto es una aplicación iOS creada en Swift que utiliza Firebase para autenticación y Firestore para almacenar datos.

# 🚀 Tecnologías Utilizadas
- Framework: [UIKit/Swift]
- Lenguaje: [Swift]
- Librerías: [Firebase/Alamofire]
- Herramientas: [Xcode/CocoaPods/Git]

# 📋 Requisitos
- Xcode: 12 o superior
- Swift: iOS 13.0 o superior
- CocoaPods: [1.15.2]

# 🛠 Instalación
### 1. Clonar el repositorio:
````ruby
git clone https://github.com/Gimabelle7/GimaStore.git/
Branch: main
 ````
## 2. Instala las dependencias utilizando CocoaPods.
  ````ruby
pod install
 ````
## Configuración de Pods en el proyecto.
  ````ruby
 platform :ios, '13.0'
use_modular_headers!
target 'PruebaTecnica' do
  use_frameworks!
  # Pods for PruebaTecnica

  pod 'Alamofire', '~> 5.4'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

end
 ````
# 💻 Uso
### 1. Ejecución:
- Abre el proyecto en Xcode.
- Selecciona el simulador o dispositivo real.
- Presiona el botón Run o usa Cmd + R para ejecutar la aplicación.
  
 ````ruby
Cmd + r
 ````

## 2. Características

| Característica              | Imagen                                                                                                                                      | Descripción                                                                                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 🔐 **Login**                | ![Login](https://github.com/user-attachments/assets/19bf9666-ce0e-49cb-93c5-9b1129c1b767)                                                | El sistema de login permite a los usuarios autenticarse en la aplicación de manera segura mediante el uso de credenciales. Se implementa un proceso de autenticación robusto que asegura que solo los usuarios válidos puedan acceder a las funcionalidades de la aplicación. |
| 📝 **Registro**             | ![Registro](https://github.com/user-attachments/assets/14738f84-29dc-4209-a384-68c4da0ab7fd)                                             | Los nuevos usuarios tienen la opción de crear una cuenta en la aplicación mediante un proceso de registro sencillo. Este proceso les permite acceder a todas las funcionalidades de la aplicación una vez que se complete el registro.                     |
| ✏️ **Editar Perfil**        | ![Editar Perfil](https://github.com/user-attachments/assets/fe7b409b-a18c-4149-9c73-34bd31315bff)                                        | Los usuarios pueden actualizar su información personal, como nombre, correo electrónico y foto de perfil, a través de la función de edición de perfil. Esta funcionalidad permite a los usuarios mantener su información actualizada.                       |
| 🔒 **Cambio de Contraseña** | ![Cambio de Contraseña](https://github.com/user-attachments/assets/e737fc8c-3622-4733-83d6-6ddffb552dfb)                              | Los usuarios pueden cambiar su contraseña para mantener la seguridad de su cuenta. Este proceso asegura que solo el usuario que conoce la contraseña actual pueda realizar cambios.                                                               |
| 👤 **Perfil**               | ![Perfil](https://github.com/user-attachments/assets/cae24ccd-9d15-420e-9a12-29a549ae58ce)                                                | La vista del perfil permite a los usuarios visualizar su información personal y acceder a opciones de personalización. Esta sección proporciona un resumen de la cuenta del usuario y permite acceder a funciones relacionadas con la gestión del perfil.   |
| 🛍️ **Productos**           | ![Productos](https://github.com/user-attachments/assets/a52d13ed-cf7a-40aa-8eae-d139debb3444)                                           | Descripción pendiente.                                                                                                                                         |
| ➕ **Creación de productos** | ![Creación de productos](https://github.com/user-attachments/assets/96b0d779-da25-4bca-ade6-ec60fe23ee5d)                              | Descripción pendiente.                                                                                                                                         |
| 📦 **Detalle de productos** | ![Detalle de productos](https://github.com/user-attachments/assets/dac192ef-9897-4c7e-9c4c-49697a6d1965)                              | Descripción pendiente.                                                                                                                                         |
| 📝 **Actualizar producto**  | ![Actualizar producto](https://github.com/user-attachments/assets/8adcc088-244a-487c-90aa-fa8c91370fa2)                               | Descripción pendiente.                                                                                                                                         |

# 🔍 Arquitectura del Código

El proyecto sigue una arquitectura **MVVM (Model-View-ViewModel)** y está organizado en varios módulos y carpetas para mantener un código limpio y modular. A continuación, se detalla la estructura del proyecto y la responsabilidad de cada carpeta:
### 1. **Services**
   - Contiene servicios que manejan la lógica de negocio, como la autenticación, almacenamiento de datos, y cualquier interacción con APIs externas.

### 2. **Shared**
   - Esta carpeta agrupa componentes compartidos entre varias vistas o módulos del proyecto, como utilidades comunes, configuraciones, o estilos.

### 3. **Views**
   - **Perfil, Menu, Login**: Estas subcarpetas contienen los `ViewControllers` asociados a cada funcionalidad principal de la aplicación. 
     - **Perfil**: Maneja las vistas relacionadas con la visualización y edición del perfil del usuario.
     - **Menu**: Contiene las vistas del menú principal.
     - **Login**: Incluye las vistas de inicio de sesión y registro de usuarios.
   - **WelcomeVC y SplashVC**: `ViewControllers` que manejan la pantalla de bienvenida y la pantalla de splash respectivamente.

### 4. **ViewModels**
   - **Menu, LoginVM, RegisterVM**: Esta carpeta contiene los ViewModels que conectan la lógica de negocio de los servicios con las vistas. 
     - **Menu**: Maneja la lógica relacionada con las opciones del menú.
     - **LoginVM**: Gestiona la lógica de inicio de sesión.
     - **RegisterVM**: Se encarga de la lógica para el registro de nuevos usuarios.

### 5. **Utils**
   - **Network**: Contiene las utilidades relacionadas con la red, como las configuraciones y funciones auxiliares para manejar las peticiones HTTP.
   - **Storage**: Incluye las utilidades para el manejo de almacenamiento local.
   - **Helpers**: Agrupa funciones y extensiones de utilidad general que son utilizadas a lo largo de la aplicación.
   - **Extensions**: Extensiones útiles para diferentes componentes de la UI y para facilitar la manipulación de datos (`NSObject+Dictionary`, `Extensions+Alert`, `Extensions+UIButton`.).
   - **Strings validations**: Validaciones y gestión de strings para asegurarse de que los inputs del usuario cumplan con ciertos criterios.
   - **AlertUtils**: Manejo y personalización de alertas en la aplicación.

### 6. **Models**
   - Contiene los modelos de datos utilizados en la aplicación, definiendo las estructuras y tipos de datos que se manejan en la lógica de negocio.

---

# 📚 Documentación Adicional

- **Estructura en Firebase**:  
  A continuación, se detalla cómo se gestionan los productos en la aplicación:

1. **Consultas de Productos**:  
   Los productos se obtienen tanto del servicio de FakeApi como de los registros almacenados en FireStore. Según las categorías seleccionadas, se mostrarán los productos correspondientes.

2. **Identificadores en FireStore**:  
   Cada producto almacenado en FireStore cuenta con un identificador único, lo que permite determinar si sus datos pueden ser editados.

3. **Actualización de Productos**:  
   Los productos provenientes de FakeApi pueden ser actualizados, creados y eliminados. Sin embargo, estas acciones funcionan en un modo de prueba, lo que asegura que los cambios no afecten la integridad de los datos en el entorno de producción.

| ![ImgUser](https://github.com/user-attachments/assets/1b6ba5e7-2a67-44f7-a71d-1278a05b0323) | ![ImgProducts](https://github.com/user-attachments/assets/8b42f543-babc-48bc-ac17-5f58c129387f) |
|-----------------------------------------------------------|---------------------------------------------------------------|
| **Imagen de Usuario**                                      | **Imagen de Productos**                                       |

4. **Creación y Gestión desde Firebase**:  
   La creación, modificación y eliminación de un producto a través de FakeApi es un proceso lógico que interactúa con las respectivas APIs para obtener las respuestas necesarias. Cualquier mejora implementada en este proceso debe pasar pruebas rigurosas para garantizar su correcto funcionamiento en un entorno de prueba antes de ser aplicada en producción.

## 🔧 Guía de Configuración de Firebase

Para configurar Firebase en este proyecto, sigue los pasos a continuación:

1. **Crear un Proyecto en Firebase**:  
   - Visita [Firebase Console](https://console.firebase.google.com/).
   - Haz clic en "Añadir proyecto" y sigue las instrucciones para crear un nuevo proyecto.

2. **Registrar la Aplicación**:  
   - En la sección "Overview" del proyecto, selecciona "Agregar una aplicación" (iOS, Android o Web).
   - Sigue los pasos para registrar tu aplicación y descargar el archivo `google-services.json` (Android) o `GoogleService-Info.plist` (iOS).

3. **Agregar el archivo de Configuración a tu Proyecto**:  
   - Android: Mueve el archivo `google-services.json` a la carpeta `app` en tu proyecto Android.
   - iOS: Agrega el archivo `GoogleService-Info.plist` a la raíz de tu proyecto Xcode.

4. **Configurar Firebase SDK**:  
   - Sigue las instrucciones para añadir el SDK de Firebase a tu proyecto:
     - Android: Modifica los archivos `build.gradle` según las instrucciones.
     - iOS: Usa CocoaPods para integrar el SDK.

5. **Pruebas y Verificación**:  
   - Una vez configurado, prueba la integración lanzando la aplicación y verificando que Firebase esté correctamente inicializado.

**Recursos Adicionales**:  
- Documentación oficial de [Firebase](https://firebase.google.com/docs).

  ## Documentación de API.

  Se utilizo FaKeAPiStore como mocks de APIS para el CRUD de la prueba tecnica, en el siguiente enlace se encuentra la documentacion oficial: https://fakestoreapi.com/docs
  Obtener el listado de todos los productos.
  GET: https://fakestoreapi.com/products
  
    ````ruby
  [{
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
      "rate": 3.9,
      "count": 120
    }]
  ````
     Crear un nuevo producto.
     POST: https://fakestoreapi.com/products
    ````ruby
  {
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    }
  ````
     Actualizar un producto.
     UPDATE: https://fakestoreapi.com/products/2
    ````ruby
  {
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  }
  ````
     Eliminar un producto
     UPDATE: https://fakestoreapi.com/products/2


📞 Contacto
Para cualquier duda o comentario, Puedes contactarme a traves de gimabelle01@hotmail.com
