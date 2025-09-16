/**
 * Componente de Registro desarrollado como clase ES6
 * Maneja el formulario para ingresar datos de una Persona
 */
class RegistroComponent {
    /**
     * Constructor que recibe el elemento padre donde se va a renderizar
     * @param {HTMLElement} parentElement - Elemento padre donde se renderizará el componente
     */
    constructor(parentElement) {
        this.parentElement = parentElement;
        this.persona = null;
        this.onPersonaRegistrada = null; // Callback para cuando se registra una persona
    }

    /**
     * Método render que muestra el componente dentro del padre
     * Usa innerHTML con strings interpolados de varias líneas con backtick
     */
    render() {
        this.parentElement.innerHTML = `
            <form id="formulario-registro" class="registro-form">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required 
                           placeholder="Ingrese su nombre">
                </div>
                
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required 
                           placeholder="Ingrese su apellido">
                </div>
                
                <div class="form-group">
                    <label for="documento">Documento:</label>
                    <input type="text" id="documento" name="documento" required 
                           placeholder="Ingrese su número de documento">
                </div>
                
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                
                <button type="submit">Registrar Persona</button>
            </form>
            
            <div id="resultado-registro" class="result" style="display: none;"></div>
        `;

        // Agregar event listener al formulario
        this.attachEventListeners();
    }

    /**
     * Adjunta los event listeners al formulario
     */
    attachEventListeners() {
        const formulario = this.parentElement.querySelector('#formulario-registro');
        const resultadoDiv = this.parentElement.querySelector('#resultado-registro');

        formulario.addEventListener('submit', (event) => {
            event.preventDefault();
            this.procesarFormulario();
        });

        // Validación en tiempo real
        const inputs = formulario.querySelectorAll('input[required]');
        inputs.forEach(input => {
            input.addEventListener('blur', () => {
                this.validarCampo(input);
            });
        });
    }

    /**
     * Procesa el formulario cuando se envía
     */
    procesarFormulario() {
        const formulario = this.parentElement.querySelector('#formulario-registro');
        const resultadoDiv = this.parentElement.querySelector('#resultado-registro');

        // Obtener valores del formulario
        const nombre = formulario.querySelector('#nombre').value.trim();
        const apellido = formulario.querySelector('#apellido').value.trim();
        const documento = formulario.querySelector('#documento').value.trim();
        const fechaNacimiento = formulario.querySelector('#fechaNacimiento').value;

        // Crear instancia de Persona
        this.persona = new Persona(nombre, apellido, documento, fechaNacimiento);

        // Validar datos
        if (this.persona.esValida()) {
            this.mostrarResultadoExitoso();
            
            // Llamar callback si existe
            if (this.onPersonaRegistrada && typeof this.onPersonaRegistrada === 'function') {
                this.onPersonaRegistrada(this.persona);
            }
        } else {
            this.mostrarResultadoError();
        }
    }

    /**
     * Muestra resultado exitoso del registro
     */
    mostrarResultadoExitoso() {
        const resultadoDiv = this.parentElement.querySelector('#resultado-registro');
        
        resultadoDiv.innerHTML = `
            <h3>✅ Persona registrada exitosamente</h3>
            <p><strong>Nombre completo:</strong> ${this.persona.nombre} ${this.persona.apellido}</p>
            <p><strong>Documento:</strong> ${this.persona.documento}</p>
            <p><strong>Fecha de nacimiento:</strong> ${this.persona.fechaNacimiento}</p>
            <p><strong>Edad:</strong> ${this.persona.obtenerEdad()} años</p>
            <p><strong>Datos JSON:</strong></p>
            <pre>${JSON.stringify(this.persona.toJSON(), null, 2)}</pre>
        `;
        
        resultadoDiv.className = 'result';
        resultadoDiv.style.display = 'block';
        
        // Limpiar formulario
        this.limpiarFormulario();
    }

    /**
     * Muestra resultado de error en el registro
     */
    mostrarResultadoError() {
        const resultadoDiv = this.parentElement.querySelector('#resultado-registro');
        
        resultadoDiv.innerHTML = `
            <h3>❌ Error en el registro</h3>
            <p>Por favor, complete todos los campos requeridos:</p>
            <ul>
                ${this.persona.nombre.trim() === '' ? '<li>Nombre es requerido</li>' : ''}
                ${this.persona.apellido.trim() === '' ? '<li>Apellido es requerido</li>' : ''}
                ${this.persona.documento.trim() === '' ? '<li>Documento es requerido</li>' : ''}
                ${this.persona.fechaNacimiento === '' ? '<li>Fecha de nacimiento es requerida</li>' : ''}
            </ul>
        `;
        
        resultadoDiv.className = 'result error';
        resultadoDiv.style.display = 'block';
    }

    /**
     * Valida un campo individual
     * @param {HTMLInputElement} input - Campo a validar
     */
    validarCampo(input) {
        const valor = input.value.trim();
        
        if (valor === '') {
            input.style.borderColor = '#f44336';
            input.style.backgroundColor = '#ffe8e8';
        } else {
            input.style.borderColor = '#4CAF50';
            input.style.backgroundColor = '#e8f5e8';
        }
    }

    /**
     * Limpia el formulario después de un registro exitoso
     */
    limpiarFormulario() {
        const formulario = this.parentElement.querySelector('#formulario-registro');
        formulario.reset();
        
        // Resetear estilos de validación
        const inputs = formulario.querySelectorAll('input');
        inputs.forEach(input => {
            input.style.borderColor = '#ddd';
            input.style.backgroundColor = 'white';
        });
    }

    /**
     * Establece un callback para cuando se registra una persona
     * @param {Function} callback - Función a ejecutar cuando se registra una persona
     */
    setOnPersonaRegistrada(callback) {
        this.onPersonaRegistrada = callback;
    }

    /**
     * Obtiene la última persona registrada
     * @returns {Persona|null} Última persona registrada o null si no hay ninguna
     */
    getUltimaPersonaRegistrada() {
        return this.persona;
    }
}
