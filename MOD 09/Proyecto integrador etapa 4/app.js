/* Fintech - Proyecto Integrador (Etapa 4)
   Sistema completo de gestión financiera con enrutamiento y componentes modernos.
   Incluye:
     - Sistema de enrutamiento SPA
     - Componentes de Login, Registro, Dashboard, Cuentas, Transferencias, etc.
     - Integración completa con el modelo de negocios
     - Interfaz moderna y responsive
*/

// El modelo de negocios se carga desde archivos separados:
// - Cliente.js, Cuenta.js, Movimiento.js, Tarjeta.js, Prestamo.js, SistemaFintech.js

/* ---------- INICIALIZACIÓN DEL SISTEMA ---------- */

const fintech = new SistemaFintech();
let usuarioActivo = null;

// Elementos DOM principales
const authArea = document.getElementById('auth-area');
const mainNavigation = document.getElementById('main-navigation');

// Referencias a formularios
const formLogin = document.getElementById('form-login');
const formRegister = document.getElementById('form-register');
const btnLogout = document.getElementById('btn-logout');

/* ---------- UTILIDADES UI ---------- */

function showMessage(message, type = 'info') {
  // Crear un toast moderno en lugar de alert
  const toast = document.createElement('div');
  toast.className = `toast toast-${type}`;
  toast.innerHTML = `
    <div class="toast-content">
      <i class="fas fa-${type === 'success' ? 'check-circle' : type === 'error' ? 'exclamation-circle' : 'info-circle'}"></i>
      <span>${message}</span>
    </div>
  `;
  
  document.body.appendChild(toast);
  
  // Animar entrada
  setTimeout(() => toast.classList.add('show'), 100);
  
  // Remover después de 3 segundos
  setTimeout(() => {
    toast.classList.remove('show');
    setTimeout(() => document.body.removeChild(toast), 300);
  }, 3000);
}

function showLoading(element, show = true) {
  if (show) {
    element.disabled = true;
    element.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Procesando...';
  } else {
    element.disabled = false;
    // Restaurar texto original (se debe pasar como parámetro)
  }
}

/* ---------- GESTIÓN DE AUTENTICACIÓN ---------- */

function login(email, password) {
  try {
    const cliente = fintech.login(email, password);
    usuarioActivo = cliente;
    fintech.usuarioActivo = cliente;
    
    // Actualizar UI
    updateAuthUI();
    showMessage('¡Bienvenido!', 'success');
    
    // Navegar al dashboard
    navigateTo('dashboard');
    
    return true;
  } catch (error) {
    showMessage(error.message, 'error');
    return false;
  }
}

function register(formData) {
  try {
    const cliente = fintech.crearCliente(
      formData.nombre,
      formData.apellido,
      formData.dni,
      formData.email,
      formData.password
    );
    
    showMessage('¡Cuenta creada exitosamente!', 'success');
    navigateTo('login');
    
    return true;
  } catch (error) {
    showMessage(error.message, 'error');
    return false;
  }
}

function logout() {
  usuarioActivo = null;
  fintech.logout();
  updateAuthUI();
  navigateTo('login');
  showMessage('Sesión cerrada', 'info');
}

function updateAuthUI() {
  if (usuarioActivo) {
    authArea.innerHTML = `
      <div class="user-info">
        <i class="fas fa-user-circle"></i>
        <span>${usuarioActivo.email}</span>
      </div>
    `;
    mainNavigation.classList.remove('hidden');
  } else {
    authArea.innerHTML = '';
    mainNavigation.classList.add('hidden');
  }
}

/* ---------- EVENTOS DE FORMULARIOS ---------- */

// Evento de login
formLogin?.addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const email = document.getElementById('login-email').value.trim();
  const password = document.getElementById('login-pass').value;
  const submitBtn = e.target.querySelector('button[type="submit"]');
  
  if (!email || !password) {
    showMessage('Por favor completa todos los campos', 'error');
    return;
  }
  
  showLoading(submitBtn, true);
  
  // Simular delay de red
  setTimeout(() => {
    login(email, password);
    showLoading(submitBtn, false);
    submitBtn.innerHTML = '<i class="fas fa-sign-in-alt"></i> Ingresar';
    formLogin.reset();
  }, 1000);
});

// Evento de registro
formRegister?.addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const formData = {
    nombre: document.getElementById('reg-nombre').value.trim(),
    apellido: document.getElementById('reg-apellido').value.trim(),
    dni: document.getElementById('reg-dni').value.trim(),
    email: document.getElementById('reg-email').value.trim(),
    password: document.getElementById('reg-pass').value
  };
  
  const submitBtn = e.target.querySelector('button[type="submit"]');
  
  // Validaciones básicas
  if (!formData.nombre || !formData.apellido || !formData.dni || !formData.email || !formData.password) {
    showMessage('Por favor completa todos los campos', 'error');
    return;
  }
  
  if (formData.password.length < 6) {
    showMessage('La contraseña debe tener al menos 6 caracteres', 'error');
    return;
  }
  
  showLoading(submitBtn, true);
  
  // Simular delay de red
  setTimeout(() => {
    register(formData);
    showLoading(submitBtn, false);
    submitBtn.innerHTML = '<i class="fas fa-user-plus"></i> Crear Cuenta';
    formRegister.reset();
  }, 1000);
});

// Evento de logout
btnLogout?.addEventListener('click', logout);

/* ---------- FUNCIONES DE RENDERIZADO DE VISTAS ---------- */

function renderDashboard() {
  if (!usuarioActivo) return;
  
  // Actualizar información del usuario
  const userEmailSpan = document.getElementById('user-email');
  const userAccountsCount = document.getElementById('user-accounts-count');
  const userTotalBalance = document.getElementById('user-total-balance');
  
  if (userEmailSpan) userEmailSpan.textContent = usuarioActivo.email;
  
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  if (userAccountsCount) userAccountsCount.textContent = cuentas.length;
  
  const saldoTotal = cuentas.reduce((sum, cuenta) => sum + cuenta.obtenerSaldo(), 0);
  if (userTotalBalance) userTotalBalance.textContent = `$${saldoTotal.toFixed(2)}`;
  
  // Renderizar actividad reciente
  renderRecentActivity();
}

function renderRecentActivity() {
  const recentMovementsContainer = document.getElementById('recent-movements');
  if (!recentMovementsContainer) return;
  
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  const todosLosMovimientos = [];
  
  cuentas.forEach(cuenta => {
    cuenta.obtenerMovimientos().forEach(movimiento => {
      todosLosMovimientos.push({
        ...movimiento,
        cuentaCodigo: cuenta.codigo
      });
    });
  });
  
  // Ordenar por fecha descendente y tomar los últimos 5
  const movimientosRecientes = todosLosMovimientos
    .sort((a, b) => new Date(b.fecha) - new Date(a.fecha))
    .slice(0, 5);
  
  if (movimientosRecientes.length === 0) {
    recentMovementsContainer.innerHTML = '<p class="no-data">No hay movimientos recientes</p>';
    return;
  }
  
  recentMovementsContainer.innerHTML = movimientosRecientes.map(mov => `
    <div class="movement">
      <div class="movement-info">
        <div class="movement-amount ${mov.esDeposito() ? 'text-success' : 'text-danger'}">
          ${mov.obtenerMontoFormateado()}
        </div>
        <div class="movement-date">${mov.obtenerFechaFormateada()}</div>
      </div>
      <div class="movement-description">
        ${mov.descripcion || mov.obtenerTipoFormateado()} - ${mov.cuentaCodigo}
      </div>
    </div>
  `).join('');
}

function renderProfile() {
  const profileContent = document.getElementById('profile-content');
  if (!profileContent || !usuarioActivo) return;
  
  profileContent.innerHTML = `
    <div class="profile-section">
      <h3><i class="fas fa-user"></i> Información Personal</h3>
      <div class="profile-info">
        <div class="info-item">
          <label>Nombre completo:</label>
          <span>${usuarioActivo.obtenerNombreCompleto()}</span>
        </div>
        <div class="info-item">
          <label>Email:</label>
          <span>${usuarioActivo.email}</span>
        </div>
        <div class="info-item">
          <label>DNI:</label>
          <span>${usuarioActivo.dni}</span>
        </div>
        <div class="info-item">
          <label>Fecha de registro:</label>
          <span>${new Date(usuarioActivo.fechaRegistro).toLocaleDateString()}</span>
        </div>
        <div class="info-item">
          <label>Días como cliente:</label>
          <span>${usuarioActivo.obtenerDiasDesdeRegistro()} días</span>
        </div>
      </div>
    </div>
    
    <div class="profile-section">
      <h3><i class="fas fa-chart-line"></i> Resumen Financiero</h3>
      <div class="financial-summary">
        ${renderFinancialSummary()}
      </div>
    </div>
  `;
}

function renderFinancialSummary() {
  const resumen = fintech.obtenerResumenFinanciero(usuarioActivo.id);
  
  return `
    <div class="summary-grid">
      <div class="summary-item">
        <div class="summary-label">Cuentas activas</div>
        <div class="summary-value">${resumen.cuentas.cantidad}</div>
      </div>
      <div class="summary-item">
        <div class="summary-label">Saldo total</div>
        <div class="summary-value">$${resumen.cuentas.saldoTotal.toFixed(2)}</div>
      </div>
      <div class="summary-item">
        <div class="summary-label">Tarjetas</div>
        <div class="summary-value">${resumen.tarjetas.cantidad}</div>
      </div>
      <div class="summary-item">
        <div class="summary-label">Préstamos activos</div>
        <div class="summary-value">${resumen.prestamos.prestamosActivos}</div>
      </div>
    </div>
  `;
}

function renderAccounts() {
  const accountsContent = document.getElementById('accounts-content');
  if (!accountsContent || !usuarioActivo) return;
  
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  
  accountsContent.innerHTML = `
    <div class="accounts-header">
      <h3><i class="fas fa-wallet"></i> Mis Cuentas</h3>
      <button class="btn-primary" onclick="showCreateAccountModal()">
        <i class="fas fa-plus"></i> Nueva Cuenta
      </button>
    </div>
    
    <div class="accounts-grid">
      ${cuentas.length === 0 ? 
        '<div class="no-data">No tienes cuentas. Crea una nueva cuenta para comenzar.</div>' :
        cuentas.map(cuenta => renderAccountCard(cuenta)).join('')
      }
    </div>
  `;
}

function renderAccountCard(cuenta) {
  return `
    <div class="account-card">
      <div class="account-header">
        <h4>${cuenta.codigo}</h4>
        <span class="account-type">${cuenta.tipoCuenta}</span>
      </div>
      <div class="account-balance">
        <span class="balance-amount">$${cuenta.obtenerSaldo().toFixed(2)}</span>
      </div>
      <div class="account-info">
        <div class="info-item">
          <span class="label">Movimientos:</span>
          <span class="value">${cuenta.obtenerMovimientos().length}</span>
        </div>
        <div class="info-item">
          <span class="label">Límite diario:</span>
          <span class="value">$${cuenta.limiteRetiroDiario.toFixed(2)}</span>
        </div>
      </div>
      <div class="account-actions">
        <button class="btn-secondary" onclick="viewAccountDetails('${cuenta.codigo}')">
          <i class="fas fa-eye"></i> Ver Detalles
        </button>
      </div>
    </div>
  `;
}

function renderTransfers() {
  const transfersContent = document.getElementById('transfers-content');
  if (!transfersContent || !usuarioActivo) return;
  
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  
  transfersContent.innerHTML = `
    <div class="transfer-form">
      <h3><i class="fas fa-exchange-alt"></i> Transferir entre Cuentas</h3>
      <form id="transfer-form" class="form">
        <div class="form-row">
          <div class="form-group">
            <label for="transfer-from">Cuenta origen</label>
            <select id="transfer-from" required>
              <option value="">Seleccionar cuenta origen</option>
              ${cuentas.map(c => `<option value="${c.codigo}">${c.codigo} - $${c.obtenerSaldo().toFixed(2)}</option>`).join('')}
            </select>
          </div>
          <div class="form-group">
            <label for="transfer-to">Cuenta destino</label>
            <select id="transfer-to" required>
              <option value="">Seleccionar cuenta destino</option>
              ${cuentas.map(c => `<option value="${c.codigo}">${c.codigo} - $${c.obtenerSaldo().toFixed(2)}</option>`).join('')}
            </select>
          </div>
        </div>
        
        <div class="form-group">
          <label for="transfer-amount">Monto</label>
          <input type="number" id="transfer-amount" min="0.01" step="0.01" required placeholder="0.00">
        </div>
        
        <div class="form-group">
          <label for="transfer-description">Descripción (opcional)</label>
          <input type="text" id="transfer-description" placeholder="Motivo de la transferencia">
        </div>
        
        <button type="submit" class="btn-primary">
          <i class="fas fa-exchange-alt"></i> Transferir
        </button>
      </form>
    </div>
  `;
  
  // Agregar evento al formulario de transferencia
  document.getElementById('transfer-form')?.addEventListener('submit', handleTransfer);
}

function renderDeposits() {
  const depositsContent = document.getElementById('deposits-content');
  if (!depositsContent || !usuarioActivo) return;
  
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  
  depositsContent.innerHTML = `
    <div class="deposits-section">
      <h3><i class="fas fa-plus-circle"></i> Simular Depósito</h3>
      <p class="text-muted">Simula diferentes tipos de ingresos de dinero a tus cuentas</p>
      
      <div class="deposit-methods">
        <div class="method-card" onclick="showDepositModal('salary')">
          <i class="fas fa-briefcase"></i>
          <h4>Salario</h4>
          <p>Simular ingreso de salario</p>
        </div>
        
        <div class="method-card" onclick="showDepositModal('bonus')">
          <i class="fas fa-gift"></i>
          <h4>Bono</h4>
          <p>Simular ingreso de bono</p>
        </div>
        
        <div class="method-card" onclick="showDepositModal('investment')">
          <i class="fas fa-chart-line"></i>
          <h4>Inversión</h4>
          <p>Simular retorno de inversión</p>
        </div>
        
        <div class="method-card" onclick="showDepositModal('other')">
          <i class="fas fa-plus"></i>
          <h4>Otro</h4>
          <p>Simular otro tipo de ingreso</p>
        </div>
      </div>
    </div>
    
    <div class="recent-deposits">
      <h3><i class="fas fa-history"></i> Depósitos Recientes</h3>
      <div id="recent-deposits-list">
        ${renderRecentDeposits()}
      </div>
    </div>
  `;
}

function renderCards() {
  const cardsContent = document.getElementById('cards-content');
  if (!cardsContent || !usuarioActivo) return;
  
  const tarjetas = fintech.getTarjetasDeCliente(usuarioActivo.id);
  
  cardsContent.innerHTML = `
    <div class="cards-header">
      <h3><i class="fas fa-credit-card"></i> Mis Tarjetas</h3>
      <button class="btn-primary" onclick="showCreateCardModal()">
        <i class="fas fa-plus"></i> Nueva Tarjeta
      </button>
    </div>
    
    <div class="cards-grid">
      ${tarjetas.length === 0 ? 
        '<div class="no-data">No tienes tarjetas. Solicita una nueva tarjeta para comenzar.</div>' :
        tarjetas.map(tarjeta => renderCardCard(tarjeta)).join('')
      }
    </div>
  `;
}

function renderLoans() {
  const loansContent = document.getElementById('loans-content');
  if (!loansContent || !usuarioActivo) return;
  
  const prestamos = fintech.getPrestamosDeCliente(usuarioActivo.id);
  
  loansContent.innerHTML = `
    <div class="loans-header">
      <h3><i class="fas fa-hand-holding-usd"></i> Mis Préstamos</h3>
      <button class="btn-primary" onclick="showCreateLoanModal()">
        <i class="fas fa-plus"></i> Solicitar Préstamo
      </button>
    </div>
    
    <div class="loans-grid">
      ${prestamos.length === 0 ? 
        '<div class="no-data">No tienes préstamos. Solicita un préstamo si necesitas financiamiento.</div>' :
        prestamos.map(prestamo => renderLoanCard(prestamo)).join('')
      }
    </div>
  `;
}

/* ---------- FUNCIONES DE MANEJO DE EVENTOS ---------- */

function handleTransfer(e) {
  e.preventDefault();
  
  const fromAccount = document.getElementById('transfer-from').value;
  const toAccount = document.getElementById('transfer-to').value;
  const amount = parseFloat(document.getElementById('transfer-amount').value);
  const description = document.getElementById('transfer-description').value || 'Transferencia entre cuentas';
  
  if (!fromAccount || !toAccount || !amount) {
    showMessage('Por favor completa todos los campos', 'error');
    return;
  }
  
  if (fromAccount === toAccount) {
    showMessage('No puedes transferir a la misma cuenta', 'error');
    return;
  }
  
  if (amount <= 0) {
    showMessage('El monto debe ser mayor a 0', 'error');
    return;
  }
  
  try {
    // Realizar retiro de cuenta origen
    fintech.realizarRetiro(fromAccount, amount, `Transferencia a ${toAccount}`);
    
    // Realizar depósito en cuenta destino
    fintech.realizarDeposito(toAccount, amount, `Transferencia desde ${fromAccount}`);
    
    showMessage('Transferencia realizada exitosamente', 'success');
    document.getElementById('transfer-form').reset();
    
    // Actualizar vistas si están activas
    if (getCurrentRoute() === 'transfers') {
      renderTransfers();
    }
    if (getCurrentRoute() === 'dashboard') {
      renderDashboard();
    }
    
  } catch (error) {
    showMessage(error.message, 'error');
  }
}

/* ---------- INICIALIZACIÓN ---------- */

function initializeApp() {
  // Crear usuarios de prueba si no existen
  if (!fintech.data.clientes.length) {
    createTestUsers();
  }
  
  // Configurar estado inicial
  updateAuthUI();
  
  // Inicializar el router si no se ha inicializado aún
  if (typeof initializeRouter === 'function') {
    initializeRouter();
  }
  
  console.log('Fintech App inicializada correctamente');
}

function createTestUsers() {
  try {
    // Usuario demo principal
    const demo = fintech.crearCliente('Demo', 'Usuario', '12345678', 'demo@fintech.test', 'demo123');
    fintech.crearCuentaParaCliente(demo.id, 1000);
    fintech.crearCuentaParaCliente(demo.id, 2500);
    
    // Usuario adicional para pruebas
    const test = fintech.crearCliente('Test', 'User', '87654321', 'test@fintech.test', 'test123');
    fintech.crearCuentaParaCliente(test.id, 500);
    
    console.log('Usuarios de prueba creados');
  } catch (error) {
    console.log('Usuarios de prueba ya existen');
  }
}

function renderCardCard(tarjeta) {
  return `
    <div class="card-item">
      <div class="card-header">
        <div class="card-number">${tarjeta.obtenerNumeroEnmascarado()}</div>
        <div class="card-type ${tarjeta.tipoTarjeta}">${tarjeta.tipoTarjeta.toUpperCase()}</div>
      </div>
      <div class="card-info">
        <div class="card-balance">
          <span class="label">Saldo disponible:</span>
          <span class="value">$${tarjeta.saldoDisponible.toFixed(2)}</span>
        </div>
        <div class="card-limit">
          <span class="label">Límite:</span>
          <span class="value">$${tarjeta.limiteCredito.toFixed(2)}</span>
        </div>
        <div class="card-expiry">
          <span class="label">Vence:</span>
          <span class="value">${tarjeta.obtenerFechaVencimientoFormateada()}</span>
        </div>
      </div>
      <div class="card-actions">
        <button class="btn-secondary" onclick="viewCardDetails('${tarjeta.id}')">
          <i class="fas fa-eye"></i> Ver Detalles
        </button>
        <button class="btn-secondary" onclick="toggleCardStatus('${tarjeta.id}')">
          <i class="fas fa-${tarjeta.activa ? 'pause' : 'play'}"></i> 
          ${tarjeta.activa ? 'Desactivar' : 'Activar'}
        </button>
      </div>
    </div>
  `;
}

function renderLoanCard(prestamo) {
  const estadoColor = {
    'solicitado': 'warning',
    'aprobado': 'success',
    'rechazado': 'danger',
    'desembolsado': 'accent'
  };
  
  return `
    <div class="loan-item">
      <div class="loan-header">
        <div class="loan-number">${prestamo.numeroPrestamo}</div>
        <div class="loan-status ${estadoColor[prestamo.estado]}">${prestamo.obtenerEstadoFormateado()}</div>
      </div>
      <div class="loan-info">
        <div class="loan-amount">
          <span class="label">Monto:</span>
          <span class="value">$${prestamo.montoAprobado.toFixed(2)}</span>
        </div>
        <div class="loan-cuota">
          <span class="label">Cuota mensual:</span>
          <span class="value">$${prestamo.cuotaMensual.toFixed(2)}</span>
        </div>
        <div class="loan-progress">
          <span class="label">Progreso:</span>
          <span class="value">${prestamo.cuotasPagadas}/${prestamo.plazoMeses} cuotas</span>
        </div>
        <div class="loan-saldo">
          <span class="label">Saldo pendiente:</span>
          <span class="value">$${prestamo.saldoPendiente.toFixed(2)}</span>
        </div>
      </div>
      <div class="loan-actions">
        <button class="btn-secondary" onclick="viewLoanDetails('${prestamo.id}')">
          <i class="fas fa-eye"></i> Ver Detalles
        </button>
        ${prestamo.estado === 'desembolsado' ? `
          <button class="btn-primary" onclick="showPaymentModal('${prestamo.id}')">
            <i class="fas fa-credit-card"></i> Pagar
          </button>
        ` : ''}
      </div>
    </div>
  `;
}

function renderRecentDeposits() {
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  const depositos = [];
  
  cuentas.forEach(cuenta => {
    cuenta.obtenerMovimientos().forEach(movimiento => {
      if (movimiento.esDeposito()) {
        depositos.push({
          ...movimiento,
          cuentaCodigo: cuenta.codigo
        });
      }
    });
  });
  
  const depositosRecientes = depositos
    .sort((a, b) => new Date(b.fecha) - new Date(a.fecha))
    .slice(0, 5);
  
  if (depositosRecientes.length === 0) {
    return '<p class="no-data">No hay depósitos recientes</p>';
  }
  
  return depositosRecientes.map(dep => `
    <div class="movement">
      <div class="movement-info">
        <div class="movement-amount text-success">
          ${dep.obtenerMontoFormateado()}
        </div>
        <div class="movement-date">${dep.obtenerFechaFormateada()}</div>
      </div>
      <div class="movement-description">
        ${dep.descripcion || 'Depósito'} - ${dep.cuentaCodigo}
      </div>
    </div>
  `).join('');
}

/* ---------- FUNCIONES DE MODALES Y ACCIONES ---------- */

function showCreateAccountModal() {
  const modal = createModal('Nueva Cuenta', `
    <form id="create-account-form" class="form">
      <div class="form-group">
        <label for="account-type">Tipo de cuenta</label>
        <select id="account-type" required>
          <option value="corriente">Corriente</option>
          <option value="ahorro">Ahorro</option>
          <option value="empresarial">Empresarial</option>
          <option value="premium">Premium</option>
        </select>
      </div>
      
      <div class="form-group">
        <label for="initial-balance">Saldo inicial</label>
        <input type="number" id="initial-balance" min="0" step="0.01" value="0" placeholder="0.00">
      </div>
      
      <div class="modal-actions">
        <button type="button" class="btn-secondary" onclick="closeModal()">Cancelar</button>
        <button type="submit" class="btn-primary">
          <i class="fas fa-plus"></i> Crear Cuenta
        </button>
      </div>
    </form>
  `);
  
  document.getElementById('create-account-form').addEventListener('submit', (e) => {
  e.preventDefault();
    
    const tipoCuenta = document.getElementById('account-type').value;
    const saldoInicial = parseFloat(document.getElementById('initial-balance').value) || 0;
    
    try {
      const cuenta = fintech.crearCuentaParaCliente(usuarioActivo.id, saldoInicial, tipoCuenta);
      showMessage(`Cuenta ${cuenta.codigo} creada exitosamente`, 'success');
      closeModal();
    renderAccounts();
      renderDashboard();
    } catch (error) {
      showMessage(error.message, 'error');
    }
  });
}

function showCreateCardModal() {
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  
  if (cuentas.length === 0) {
    showMessage('Necesitas tener al menos una cuenta para crear una tarjeta', 'error');
    return;
  }
  
  const modal = createModal('Nueva Tarjeta', `
    <form id="create-card-form" class="form">
      <div class="form-group">
        <label for="card-account">Cuenta asociada</label>
        <select id="card-account" required>
          <option value="">Seleccionar cuenta</option>
          ${cuentas.map(c => `<option value="${c.id}">${c.codigo} - $${c.obtenerSaldo().toFixed(2)}</option>`).join('')}
        </select>
      </div>
      
      <div class="form-group">
        <label for="card-type">Tipo de tarjeta</label>
        <select id="card-type" required>
          <option value="debito">Débito</option>
          <option value="credito">Crédito</option>
        </select>
      </div>
      
      <div class="form-group">
        <label for="card-brand">Marca</label>
        <select id="card-brand" required>
          <option value="visa">Visa</option>
          <option value="mastercard">Mastercard</option>
          <option value="amex">American Express</option>
        </select>
      </div>
      
      <div class="form-group" id="credit-limit-group" style="display: none;">
        <label for="credit-limit">Límite de crédito</label>
        <input type="number" id="credit-limit" min="0" step="0.01" placeholder="0.00">
      </div>
      
      <div class="modal-actions">
        <button type="button" class="btn-secondary" onclick="closeModal()">Cancelar</button>
        <button type="submit" class="btn-primary">
          <i class="fas fa-plus"></i> Crear Tarjeta
        </button>
      </div>
    </form>
  `);
  
  // Mostrar/ocultar límite de crédito según tipo
  document.getElementById('card-type').addEventListener('change', (e) => {
    const creditLimitGroup = document.getElementById('credit-limit-group');
    creditLimitGroup.style.display = e.target.value === 'credito' ? 'block' : 'none';
  });
  
  document.getElementById('create-card-form').addEventListener('submit', (e) => {
    e.preventDefault();
    
    const cuentaId = document.getElementById('card-account').value;
    const tipoTarjeta = document.getElementById('card-type').value;
    const marca = document.getElementById('card-brand').value;
    const limiteCredito = tipoTarjeta === 'credito' ? 
      parseFloat(document.getElementById('credit-limit').value) || 0 : 0;
    
    try {
      const tarjeta = fintech.crearTarjetaParaCliente(usuarioActivo.id, cuentaId, tipoTarjeta, marca, limiteCredito);
      showMessage(`Tarjeta ${tarjeta.obtenerNumeroEnmascarado()} creada exitosamente`, 'success');
      closeModal();
      renderCards();
    } catch (error) {
      showMessage(error.message, 'error');
    }
  });
}

function showCreateLoanModal() {
  const modal = createModal('Solicitar Préstamo', `
    <form id="create-loan-form" class="form">
      <div class="form-group">
        <label for="loan-amount">Monto solicitado</label>
        <input type="number" id="loan-amount" min="1000" max="5000000" step="100" required placeholder="10000">
      </div>
      
      <div class="form-group">
        <label for="loan-term">Plazo (meses)</label>
        <select id="loan-term" required>
          <option value="12">12 meses</option>
          <option value="24">24 meses</option>
          <option value="36">36 meses</option>
          <option value="48">48 meses</option>
          <option value="60">60 meses</option>
        </select>
      </div>
      
      <div class="form-group">
        <label for="loan-type">Tipo de préstamo</label>
        <select id="loan-type" required>
          <option value="personal">Personal</option>
          <option value="hipotecario">Hipotecario</option>
          <option value="automotriz">Automotriz</option>
          <option value="empresarial">Empresarial</option>
          <option value="educativo">Educativo</option>
        </select>
      </div>
      
      <div class="form-group">
        <label for="loan-purpose">Propósito (opcional)</label>
        <textarea id="loan-purpose" placeholder="Describe el propósito del préstamo"></textarea>
      </div>
      
      <div class="modal-actions">
        <button type="button" class="btn-secondary" onclick="closeModal()">Cancelar</button>
        <button type="submit" class="btn-primary">
          <i class="fas fa-hand-holding-usd"></i> Solicitar Préstamo
        </button>
      </div>
    </form>
  `);
  
  document.getElementById('create-loan-form').addEventListener('submit', (e) => {
    e.preventDefault();
    
    const montoSolicitado = parseFloat(document.getElementById('loan-amount').value);
    const plazoMeses = parseInt(document.getElementById('loan-term').value);
    const tipoPrestamo = document.getElementById('loan-type').value;
    const proposito = document.getElementById('loan-purpose').value;
    
    // Calcular tasa de interés según tipo
    const tasasInteres = {
      'personal': 15,
      'hipotecario': 8,
      'automotriz': 12,
      'empresarial': 18,
      'educativo': 6
    };
    
    const tasaInteres = tasasInteres[tipoPrestamo];
    
    try {
      const prestamo = fintech.crearPrestamoParaCliente(
        usuarioActivo.id, 
        montoSolicitado, 
        plazoMeses, 
        tasaInteres, 
        tipoPrestamo, 
        proposito
      );
      
      showMessage(`Préstamo ${prestamo.numeroPrestamo} solicitado exitosamente`, 'success');
      closeModal();
      renderLoans();
    } catch (error) {
      showMessage(error.message, 'error');
    }
  });
}

function showDepositModal(type) {
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  
  if (cuentas.length === 0) {
    showMessage('Necesitas tener al menos una cuenta para realizar depósitos', 'error');
    return;
  }
  
  const tiposDeposito = {
    'salary': { nombre: 'Salario', icono: 'briefcase', montoDefault: 50000 },
    'bonus': { nombre: 'Bono', icono: 'gift', montoDefault: 10000 },
    'investment': { nombre: 'Inversión', icono: 'chart-line', montoDefault: 25000 },
    'other': { nombre: 'Otro', icono: 'plus', montoDefault: 5000 }
  };
  
  const tipo = tiposDeposito[type];
  
  const modal = createModal(`Simular ${tipo.nombre}`, `
    <form id="deposit-form" class="form">
      <div class="form-group">
        <label for="deposit-account">Cuenta destino</label>
        <select id="deposit-account" required>
          <option value="">Seleccionar cuenta</option>
          ${cuentas.map(c => `<option value="${c.codigo}">${c.codigo} - $${c.obtenerSaldo().toFixed(2)}</option>`).join('')}
        </select>
      </div>
      
      <div class="form-group">
        <label for="deposit-amount">Monto</label>
        <input type="number" id="deposit-amount" min="0.01" step="0.01" 
               value="${tipo.montoDefault}" required placeholder="0.00">
      </div>
      
      <div class="form-group">
        <label for="deposit-description">Descripción</label>
        <input type="text" id="deposit-description" 
               value="Simulación de ${tipo.nombre.toLowerCase()}" placeholder="Descripción del depósito">
      </div>
      
      <div class="modal-actions">
        <button type="button" class="btn-secondary" onclick="closeModal()">Cancelar</button>
        <button type="submit" class="btn-primary">
          <i class="fas fa-plus-circle"></i> Simular Depósito
        </button>
      </div>
    </form>
  `);
  
  document.getElementById('deposit-form').addEventListener('submit', (e) => {
    e.preventDefault();
    
    const cuentaCodigo = document.getElementById('deposit-account').value;
    const monto = parseFloat(document.getElementById('deposit-amount').value);
    const descripcion = document.getElementById('deposit-description').value;
    
    try {
      fintech.realizarDeposito(cuentaCodigo, monto, descripcion);
      showMessage(`Depósito de $${monto.toFixed(2)} realizado exitosamente`, 'success');
      closeModal();
      renderDeposits();
      renderDashboard();
    } catch (error) {
      showMessage(error.message, 'error');
    }
  });
}

function createModal(title, content) {
  const modal = document.createElement('div');
  modal.className = 'modal-overlay';
  modal.innerHTML = `
    <div class="modal">
      <div class="modal-header">
        <h3>${title}</h3>
        <button class="modal-close" onclick="closeModal()">
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="modal-content">
        ${content}
      </div>
    </div>
  `;
  
  document.body.appendChild(modal);
  
  // Animar entrada
  setTimeout(() => modal.classList.add('show'), 100);
  
  return modal;
}

function closeModal() {
  const modal = document.querySelector('.modal-overlay');
  if (modal) {
    modal.classList.remove('show');
    setTimeout(() => document.body.removeChild(modal), 300);
  }
}

// Funciones placeholder para acciones futuras
function viewAccountDetails(codigo) {
  showMessage(`Ver detalles de cuenta ${codigo} - Funcionalidad en desarrollo`, 'info');
}

function viewCardDetails(id) {
  showMessage(`Ver detalles de tarjeta ${id} - Funcionalidad en desarrollo`, 'info');
}

function toggleCardStatus(id) {
  showMessage(`Cambiar estado de tarjeta ${id} - Funcionalidad en desarrollo`, 'info');
}

function viewLoanDetails(id) {
  showMessage(`Ver detalles de préstamo ${id} - Funcionalidad en desarrollo`, 'info');
}

function showPaymentModal(id) {
  showMessage(`Realizar pago de préstamo ${id} - Funcionalidad en desarrollo`, 'info');
}

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', initializeApp);
