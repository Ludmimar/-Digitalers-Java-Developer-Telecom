# API REST Echo Service

Una API REST simple desarrollada con Flask que implementa un servicio echo para facilitar la interacción entre frontend y backend.

## Descripción

Este proyecto implementa un servicio GET que recibe un mensaje como parámetro y lo devuelve como respuesta JSON. Es ideal para aprender sobre APIs REST y el protocolo HTTP.

## Características

- ✅ Servicio echo que devuelve el mensaje recibido
- ✅ Validación de parámetros
- ✅ Respuestas en formato JSON
- ✅ Manejo de errores
- ✅ Endpoint de salud del servicio
- ✅ Documentación automática en la página de inicio

## Instalación

1. **Clonar o descargar el proyecto**

2. **Instalar las dependencias:**
   ```bash
   pip install -r requirements.txt
   ```

## Uso

### 1. Ejecutar la aplicación

```bash
python app.py
```

La aplicación se ejecutará en `http://localhost:5000`

### 2. Probar el servicio echo

**Desde el navegador:**
- Visita: `http://localhost:5000/echo?mensaje=Hola`
- Deberías ver una respuesta JSON como:
  ```json
  {
    "mensaje_recibido": "Hola",
    "mensaje_devuelto": "Hola",
    "status": "success",
    "timestamp": "HTTP/1.1"
  }
  ```

**Ejemplos de URLs para probar:**
- `http://localhost:5000/echo?mensaje=Hola Mundo`
- `http://localhost:5000/echo?mensaje=Probando la API`
- `http://localhost:5000/echo?mensaje=123`

### 3. Otros endpoints disponibles

**Página de inicio:**
- `http://localhost:5000/` - Información sobre la API

**Health check:**
- `http://localhost:5000/health` - Estado del servicio

## Endpoints de la API

### GET /echo
Recibe un mensaje como parámetro y lo devuelve como respuesta.

**Parámetros:**
- `mensaje` (string, requerido): El mensaje que se quiere hacer echo

**Respuesta exitosa (200):**
```json
{
  "mensaje_recibido": "Hola",
  "mensaje_devuelto": "Hola",
  "status": "success",
  "timestamp": "HTTP/1.1"
}
```

**Respuesta de error (400):**
```json
{
  "error": "Parámetro mensaje es requerido",
  "ejemplo": "http://localhost:5000/echo?mensaje=Hola"
}
```

### GET /
Página de inicio con información sobre la API.

### GET /health
Verificación del estado del servicio.

## Tecnologías utilizadas

- **Python 3.x**
- **Flask 2.3.3** - Framework web ligero
- **Werkzeug 2.3.7** - WSGI toolkit

## Conceptos aprendidos

- **API REST**: Arquitectura de servicios web
- **Protocolo HTTP**: Métodos GET, códigos de estado
- **Flask**: Framework web de Python
- **JSON**: Formato de intercambio de datos
- **Parámetros de URL**: Query parameters
- **Validación de datos**: Manejo de errores

## Estructura del proyecto

```
Desafio/
├── app.py              # Aplicación principal Flask
├── requirements.txt    # Dependencias del proyecto
└── README.md          # Este archivo
```

## Próximos pasos

Para extender esta API, podrías agregar:

1. **Integración con ChatGPT**: Usar la API de OpenAI para generar respuestas
2. **Base de datos**: Almacenar mensajes y respuestas
3. **Autenticación**: Proteger endpoints con tokens
4. **Frontend**: Crear una interfaz web para interactuar con la API
5. **Más endpoints**: Implementar CRUD completo
6. **Tests**: Agregar pruebas unitarias
7. **Documentación**: Usar Swagger/OpenAPI

## Solución de problemas

**Error: "ModuleNotFoundError: No module named 'flask'"**
- Ejecuta: `pip install -r requirements.txt`

**Error: "Address already in use"**
- Cambia el puerto en `app.py`: `app.run(port=5001)`

**El navegador no muestra JSON**
- Asegúrate de usar una extensión como "JSON Viewer" o ver el código fuente de la página
