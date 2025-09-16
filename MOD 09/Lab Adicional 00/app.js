/**
 * Archivo principal de la aplicación
 * Inicializa y conecta el componente de registro
 */

// Esperar a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
    console.log('🚀 Aplicación iniciada');
    
    // Obtener el contenedor donde se renderizará el componente
    const container = document.getElementById('registro-container');
    
    if (!container) {
        console.error('❌ No se encontró el contenedor con id "registro-container"');
        return;
    }
    
    // Crear instancia del componente de registro
    const registroComponent = new RegistroComponent(container);
    
    // Configurar callback para cuando se registre una persona
    registroComponent.setOnPersonaRegistrada(function(persona) {
        console.log('✅ Nueva persona registrada:', persona.toString());
        console.log('📊 Datos JSON:', persona.toJSON());
        
        // Aquí podrías agregar más lógica, como:
        // - Enviar datos a un servidor
        // - Guardar en localStorage
        // - Actualizar una lista de personas
        // - Mostrar estadísticas
        
        // Ejemplo: Guardar en localStorage
        const personasRegistradas = JSON.parse(localStorage.getItem('personas') || '[]');
        personasRegistradas.push(persona.toJSON());
        localStorage.setItem('personas', JSON.stringify(personasRegistradas));
        
        console.log(`📈 Total de personas registradas: ${personasRegistradas.length}`);
    });
    
    // Renderizar el componente
    registroComponent.render();
    
    console.log('✅ Componente de registro inicializado correctamente');
    
    // Mostrar estadísticas si hay personas registradas previamente
    mostrarEstadisticas();
});

/**
 * Muestra estadísticas de personas registradas
 */
function mostrarEstadisticas() {
    const personasRegistradas = JSON.parse(localStorage.getItem('personas') || '[]');
    
    if (personasRegistradas.length > 0) {
        console.log(`📊 Estadísticas:`);
        console.log(`   - Total de personas registradas: ${personasRegistradas.length}`);
        
        const edades = personasRegistradas.map(p => p.edad);
        const edadPromedio = edades.reduce((sum, edad) => sum + edad, 0) / edades.length;
        
        console.log(`   - Edad promedio: ${edadPromedio.toFixed(1)} años`);
        console.log(`   - Edad mínima: ${Math.min(...edades)} años`);
        console.log(`   - Edad máxima: ${Math.max(...edades)} años`);
    }
}

/**
 * Función de utilidad para limpiar todos los datos almacenados
 * (Útil para testing)
 */
function limpiarDatos() {
    localStorage.removeItem('personas');
    console.log('🧹 Datos limpiados');
    location.reload();
}

// Hacer la función disponible globalmente para testing
window.limpiarDatos = limpiarDatos;
