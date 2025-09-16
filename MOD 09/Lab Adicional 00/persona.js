/**
 * Clase Persona que representa los datos de una persona
 */
class Persona {
    constructor(nombre, apellido, documento, fechaNacimiento) {
        this.nombre = nombre || '';
        this.apellido = apellido || '';
        this.documento = documento || '';
        this.fechaNacimiento = fechaNacimiento || '';
    }

    /**
     * Valida que todos los campos requeridos estén completos
     * @returns {boolean} true si todos los campos son válidos
     */
    esValida() {
        return this.nombre.trim() !== '' && 
               this.apellido.trim() !== '' && 
               this.documento.trim() !== '' && 
               this.fechaNacimiento !== '';
    }

    /**
     * Obtiene la edad de la persona basada en la fecha de nacimiento
     * @returns {number} edad en años
     */
    obtenerEdad() {
        if (!this.fechaNacimiento) return 0;
        
        const hoy = new Date();
        const nacimiento = new Date(this.fechaNacimiento);
        let edad = hoy.getFullYear() - nacimiento.getFullYear();
        
        const mesActual = hoy.getMonth();
        const mesNacimiento = nacimiento.getMonth();
        
        if (mesActual < mesNacimiento || 
            (mesActual === mesNacimiento && hoy.getDate() < nacimiento.getDate())) {
            edad--;
        }
        
        return edad;
    }

    /**
     * Convierte la persona a un objeto JSON
     * @returns {Object} objeto JSON con los datos de la persona
     */
    toJSON() {
        return {
            nombre: this.nombre,
            apellido: this.apellido,
            documento: this.documento,
            fechaNacimiento: this.fechaNacimiento,
            edad: this.obtenerEdad()
        };
    }

    /**
     * Convierte la persona a una representación de string
     * @returns {string} string con los datos de la persona
     */
    toString() {
        return `${this.nombre} ${this.apellido} - Documento: ${this.documento} - Edad: ${this.obtenerEdad()} años`;
    }
}
