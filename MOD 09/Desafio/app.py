from flask import Flask, request, jsonify

# Crear la aplicación Flask
app = Flask(__name__)

@app.route('/echo', methods=['GET'])
def echo_service():
    """
    Servicio echo que recibe un mensaje como parámetro y lo devuelve como respuesta.
    
    Parámetros:
        mensaje (str): El mensaje que se quiere hacer echo
    
    Retorna:
        JSON con el mensaje recibido y información adicional
    """
    # Obtener el parámetro 'mensaje' de la URL
    mensaje = request.args.get('mensaje')
    
    # Verificar si se proporcionó el parámetro mensaje
    if mensaje is None:
        return jsonify({
            'error': 'Parámetro mensaje es requerido',
            'ejemplo': 'http://localhost:5000/echo?mensaje=Hola'
        }), 400
    
    # Si el mensaje está vacío
    if mensaje.strip() == '':
        return jsonify({
            'error': 'El mensaje no puede estar vacío',
            'ejemplo': 'http://localhost:5000/echo?mensaje=Hola'
        }), 400
    
    # Devolver el mensaje como respuesta
    return jsonify({
        'mensaje_recibido': mensaje,
        'mensaje_devuelto': mensaje,
        'status': 'success',
        'timestamp': request.environ.get('SERVER_PROTOCOL', 'HTTP/1.1')
    })

@app.route('/', methods=['GET'])
def home():
    """
    Página de inicio con información sobre la API
    """
    return jsonify({
        'mensaje': 'API Echo Service',
        'descripcion': 'Servicio que devuelve el mismo mensaje que recibe',
        'endpoints': {
            'echo': {
                'url': '/echo',
                'metodo': 'GET',
                'parametros': 'mensaje (requerido)',
                'ejemplo': 'http://localhost:5000/echo?mensaje=Hola'
            }
        },
        'instrucciones': 'Agrega ?mensaje=tu_mensaje_aqui a la URL para probar el servicio'
    })

@app.route('/health', methods=['GET'])
def health_check():
    """
    Endpoint para verificar el estado del servicio
    """
    return jsonify({
        'status': 'healthy',
        'service': 'Echo API',
        'version': '1.0.0'
    })

if __name__ == '__main__':
    # Ejecutar la aplicación en modo debug
    app.run(debug=True, host='0.0.0.0', port=5000)
