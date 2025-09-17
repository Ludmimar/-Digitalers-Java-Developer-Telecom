# WWWapas - Marketing Digital y Redes Sociales

## 📋 Descripción del Proyecto

**WWWapas** es una página web corporativa para una agencia de marketing digital especializada en gestión de redes sociales y creación de contenido. El sitio web presenta los servicios de Sofi & Julia, dos social media managers que ofrecen estrategias personalizadas para empresas y marcas.

## 🎯 Características Principales

- **Diseño Responsivo**: Interfaz adaptada para diferentes dispositivos
- **Formulario de Contacto**: Sistema de contacto funcional con procesamiento PHP
- **Sección de Servicios**: Lista detallada de servicios ofrecidos
- **Integración con Redes Sociales**: Enlaces a plataformas sociales
- **Diseño Moderno**: Estética profesional con tipografías Google Fonts

## 🛠️ Tecnologías Utilizadas

- **Frontend**:
  - HTML5
  - CSS3
  - Google Fonts (Roboto, Coiny)
  
- **Backend**:
  - PHP (procesamiento de formularios)
  
- **Recursos**:
  - Imágenes PNG optimizadas
  - Iconos de redes sociales

## 📁 Estructura del Proyecto

```
Proyecto Integrador Etapa 4/
├── css/
│   └── estilos.css          # Estilos principales del sitio
├── img/
│   ├── dribbble-icon.png    # Icono de Dribbble
│   ├── facebook-icon.png    # Icono de Facebook
│   ├── foto.png            # Foto principal de las fundadoras
│   ├── img-servicios.png   # Imagen de servicios
│   ├── instagram-icon.png  # Icono de Instagram
│   └── linkedin-icon.png   # Icono de LinkedIn
├── php/
│   └── codigo.php          # Script de procesamiento de formulario
├── index.html              # Página principal
├── Etapa 4.pdf            # Documentación del proyecto
└── README.md              # Este archivo
```

## 🚀 Instalación y Configuración

### Requisitos Previos
- Servidor web (Apache, Nginx, etc.)
- PHP 7.0 o superior
- Navegador web moderno

### Pasos de Instalación

1. **Clonar o descargar el proyecto**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   ```

2. **Configurar el servidor web**
   - Colocar los archivos en el directorio raíz del servidor web
   - Asegurar que PHP esté habilitado

3. **Configurar el formulario de contacto**
   - Editar `php/codigo.php`
   - Cambiar la línea 2: `$to = "tu-email@ejemplo.com";`
   - Reemplazar con tu dirección de email

4. **Acceder al sitio**
   - Abrir el navegador
   - Navegar a `http://localhost/[nombre-del-proyecto]/`

## 📧 Configuración del Formulario de Contacto

Para que el formulario de contacto funcione correctamente:

1. Abrir `php/codigo.php`
2. Modificar la línea 2:
   ```php
   $to = "tu-email@ejemplo.com";
   ```
3. Asegurar que el servidor tenga configurado el envío de emails

## 🎨 Personalización

### Colores Principales
- **Amarillo**: `rgb(252, 238, 33)` - Color principal de marca
- **Gris**: `#F2F2F2` - Fondo principal
- **Negro**: `#000000` - Texto y elementos de contraste
- **Rojo**: `#C1272D` - Elementos de énfasis

### Tipografías
- **Roboto**: Fuente principal (400, 700, 900)
- **Coiny**: Fuente para títulos y marca (cursiva)

## 📱 Secciones del Sitio

1. **Header**: Presentación de la empresa y equipo
2. **Servicios**: Lista detallada de servicios ofrecidos
3. **Contacto**: Formulario de contacto funcional
4. **Redes Sociales**: Enlaces a plataformas sociales
5. **Footer**: Información de contacto y marca

## 🔧 Servicios Ofrecidos

- Análisis de perfil (Benchmarking)
- Revisión y activación de canales
- Gestión, creación y diseño de contenido
- Respuestas a mensajes y consultas
- Segmentación de promociones
- Calendario de contenido personalizado
- Comunicación estratégica


## 🐛 Solución de Problemas

### El formulario no envía emails
- Verificar configuración PHP del servidor
- Comprobar que el email de destino esté configurado correctamente
- Revisar logs del servidor para errores

### Problemas de visualización
- Limpiar caché del navegador
- Verificar que todos los archivos CSS estén cargando correctamente
- Comprobar rutas de imágenes

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---


*Proyecto desarrollado como parte del programa de formación en desarrollo web.*
