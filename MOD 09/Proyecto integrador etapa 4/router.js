/**
 * Sistema de Enrutamiento - Fintech App
 * Maneja la navegación entre diferentes vistas de la aplicación
 */
class Router {
  constructor() {
    this.routes = new Map();
    this.currentRoute = null;
    this.defaultRoute = 'login';
    this.init();
  }

  /**
   * Inicializa el router
   */
  init() {
    // Definir todas las rutas disponibles
    this.defineRoutes();
    
    // Configurar el listener para cambios de hash
    window.addEventListener('hashchange', () => this.handleRouteChange());
    
    // Manejar la ruta inicial
    this.handleRouteChange();
  }

  /**
   * Define todas las rutas de la aplicación
   */
  defineRoutes() {
    this.routes.set('login', {
      path: '#/login',
      component: 'login-view',
      title: 'Iniciar Sesión',
      requiresAuth: false
    });

    this.routes.set('register', {
      path: '#/register',
      component: 'register-view',
      title: 'Registrarse',
      requiresAuth: false
    });

    this.routes.set('dashboard', {
      path: '#/dashboard',
      component: 'dashboard-view',
      title: 'Dashboard',
      requiresAuth: true
    });

    this.routes.set('profile', {
      path: '#/profile',
      component: 'profile-view',
      title: 'Mi Perfil',
      requiresAuth: true
    });

    this.routes.set('accounts', {
      path: '#/accounts',
      component: 'accounts-view',
      title: 'Mis Cuentas',
      requiresAuth: true
    });

    this.routes.set('transfers', {
      path: '#/transfers',
      component: 'transfers-view',
      title: 'Transferencias',
      requiresAuth: true
    });

    this.routes.set('deposits', {
      path: '#/deposits',
      component: 'deposits-view',
      title: 'Depósitos',
      requiresAuth: true
    });

    this.routes.set('cards', {
      path: '#/cards',
      component: 'cards-view',
      title: 'Mis Tarjetas',
      requiresAuth: true
    });

    this.routes.set('loans', {
      path: '#/loans',
      component: 'loans-view',
      title: 'Préstamos',
      requiresAuth: true
    });
  }

  /**
   * Maneja el cambio de ruta
   */
  handleRouteChange() {
    const hash = window.location.hash || '#/login';
    const routeName = this.getRouteNameFromHash(hash);
    
    if (routeName && this.routes.has(routeName)) {
      const route = this.routes.get(routeName);
      
      // Verificar autenticación si es requerida
      if (route.requiresAuth && !this.isUserAuthenticated()) {
        this.navigateTo('login');
        return;
      }
      
      this.navigateToRoute(routeName);
    } else {
      // Ruta no encontrada, redirigir al default
      this.navigateTo(this.defaultRoute);
    }
  }

  /**
   * Extrae el nombre de la ruta del hash
   */
  getRouteNameFromHash(hash) {
    const match = hash.match(/#\/(.+)/);
    return match ? match[1] : null;
  }

  /**
   * Navega a una ruta específica
   */
  navigateTo(routeName) {
    if (this.routes.has(routeName)) {
      const route = this.routes.get(routeName);
      window.location.hash = route.path;
    }
  }

  /**
   * Ejecuta la navegación a una ruta
   */
  navigateToRoute(routeName) {
    const route = this.routes.get(routeName);
    this.currentRoute = routeName;
    
    // Ocultar todas las vistas
    this.hideAllViews();
    
    // Mostrar la vista correspondiente
    this.showView(route.component);
    
    // Actualizar el título de la página
    document.title = `${route.title} - Fintech`;
    
    // Actualizar la navegación activa
    this.updateActiveNavigation(routeName);
    
    // Ejecutar la lógica específica de la vista
    this.executeViewLogic(routeName);
  }

  /**
   * Oculta todas las vistas
   */
  hideAllViews() {
    const views = document.querySelectorAll('[data-view]');
    views.forEach(view => {
      view.classList.add('hidden');
    });
  }

  /**
   * Muestra una vista específica
   */
  showView(componentName) {
    const view = document.querySelector(`[data-view="${componentName}"]`);
    if (view) {
      view.classList.remove('hidden');
    }
  }

  /**
   * Actualiza la navegación activa
   */
  updateActiveNavigation(routeName) {
    // Remover clase activa de todos los elementos de navegación
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => {
      item.classList.remove('active');
    });
    
    // Agregar clase activa al elemento correspondiente
    const activeNavItem = document.querySelector(`[data-route="${routeName}"]`);
    if (activeNavItem) {
      activeNavItem.classList.add('active');
    }
  }

  /**
   * Ejecuta la lógica específica de cada vista
   */
  executeViewLogic(routeName) {
    switch (routeName) {
      case 'dashboard':
        if (typeof renderDashboard === 'function') {
          renderDashboard();
        }
        break;
      case 'profile':
        if (typeof renderProfile === 'function') {
          renderProfile();
        }
        break;
      case 'accounts':
        if (typeof renderAccounts === 'function') {
          renderAccounts();
        }
        break;
      case 'transfers':
        if (typeof renderTransfers === 'function') {
          renderTransfers();
        }
        break;
      case 'deposits':
        if (typeof renderDeposits === 'function') {
          renderDeposits();
        }
        break;
      case 'cards':
        if (typeof renderCards === 'function') {
          renderCards();
        }
        break;
      case 'loans':
        if (typeof renderLoans === 'function') {
          renderLoans();
        }
        break;
    }
  }

  /**
   * Verifica si el usuario está autenticado
   */
  isUserAuthenticated() {
    return typeof fintech !== 'undefined' && fintech && fintech.hayUsuarioActivo();
  }

  /**
   * Obtiene la ruta actual
   */
  getCurrentRoute() {
    return this.currentRoute;
  }

  /**
   * Obtiene información de una ruta
   */
  getRouteInfo(routeName) {
    return this.routes.get(routeName);
  }

  /**
   * Obtiene todas las rutas disponibles
   */
  getAllRoutes() {
    return Array.from(this.routes.keys());
  }

  /**
   * Obtiene las rutas que requieren autenticación
   */
  getAuthenticatedRoutes() {
    const authenticatedRoutes = [];
    this.routes.forEach((route, name) => {
      if (route.requiresAuth) {
        authenticatedRoutes.push(name);
      }
    });
    return authenticatedRoutes;
  }

  /**
   * Obtiene las rutas públicas
   */
  getPublicRoutes() {
    const publicRoutes = [];
    this.routes.forEach((route, name) => {
      if (!route.requiresAuth) {
        publicRoutes.push(name);
      }
    });
    return publicRoutes;
  }
}

// Crear instancia global del router
let router;

// Funciones de navegación globales para uso en la aplicación
function navigateTo(routeName) {
  if (router) {
    router.navigateTo(routeName);
  }
}

function getCurrentRoute() {
  return router ? router.getCurrentRoute() : '/';
}

function isAuthenticated() {
  return router ? router.isUserAuthenticated() : false;
}

// Inicializar el router cuando el DOM esté listo y fintech esté disponible
function initializeRouter() {
  if (typeof fintech !== 'undefined' && fintech) {
    router = new Router();
    router.init();
  } else {
    // Reintentar después de un breve delay
    setTimeout(initializeRouter, 100);
  }
}

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', initializeRouter);

// Exportar para uso en otros módulos
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Router;
}
