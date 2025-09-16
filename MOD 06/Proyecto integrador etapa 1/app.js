/* Fintech - Proyecto Integrador (Etapa 1)
   Clases POO y lógica para frontend sencillo con localStorage.
   Incluye:
     - Cliente, Cuenta, Movimiento, SistemaFintech
     - Registro/Login, Crear cuenta bancaria, Depósito, Retiro
     - Persistencia en localStorage
     - Form hiding after action, validación de saldo
*/

/* ---------- MODELO (POO) ---------- */

class Movimiento {
  constructor(tipo, monto, fecha = null, descripcion = '') {
    this.id = Movimiento.generarId();
    this.tipo = tipo; // 'depósito' o 'retiro'
    this.monto = Number(monto);
    this.fecha = fecha || new Date().toISOString();
    this.descripcion = descripcion;
    this.hashPrev = null; // para opción blockchain (opcional)
  }

  static generarId() {
    return 'mov-' + Math.random().toString(36).slice(2, 10);
  }
}

class Cuenta {
  constructor(clienteId, saldoInicial = 0) {
    this.codigo = Cuenta.generarCodigo(); // único
    this.clienteId = clienteId;
    this.saldo = Number(saldoInicial);
    this.movimientos = [];
  }

  depositar(monto) {
    monto = Number(monto);
    if (monto <= 0) throw new Error('El monto debe ser mayor a 0');
    this.saldo += monto;
    const m = new Movimiento('depósito', monto);
    this.agregarMovimiento(m);
    return m;
  }

  retirar(monto) {
    monto = Number(monto);
    if (monto <= 0) throw new Error('El monto debe ser mayor a 0');
    if (monto > this.saldo) throw new Error('Saldo insuficiente');
    this.saldo -= monto;
    const m = new Movimiento('retiro', monto);
    this.agregarMovimiento(m);
    return m;
  }

  agregarMovimiento(mov) {
    // opcional: enlazar hashPrev para simulación de blockchain
    if (this.movimientos.length) {
      mov.hashPrev = this.movimientos[this.movimientos.length - 1].id;
    }
    this.movimientos.push(mov);
  }

  static generarCodigo() {
    // formato: C-YYYYMMDD-XXXX (simple y único)
    const date = new Date();
    const part = date.toISOString().slice(0,10).replace(/-/g,'');
    const random = Math.floor(1000 + Math.random() * 9000);
    return `C-${part}-${random}`;
  }
}

class Cliente {
  constructor(nombre, apellido, dni, email, password) {
    this.id = Cliente.generarId();
    this.nombre = nombre;
    this.apellido = apellido;
    this.dni = dni;
    this.email = email.toLowerCase();
    this.password = password; // en proyecto real: hash
    this.cuentas = []; // lista de códigos de cuentas
  }

  static generarId() {
    return 'cli-' + Math.random().toString(36).slice(2, 10);
  }
}

class SistemaFintech {
  constructor(storageKey = 'fintech_data_v1') {
    this.storageKey = storageKey;
    this.data = { clientes: [], cuentas: [] };
    this.cargar();
  }

  guardar() {
    localStorage.setItem(this.storageKey, JSON.stringify(this.data));
  }

  cargar() {
    const raw = localStorage.getItem(this.storageKey);
    if (raw) {
      const parsed = JSON.parse(raw);
      // reconstruir objetos
      this.data.clientes = (parsed.clientes || []).map(c => Object.assign(new Cliente(), c));
      this.data.cuentas = (parsed.cuentas || []).map(ct => {
        const c = Object.assign(new Cuenta(), ct);
        // asegurar métodos y movimientos siguen siendo objetos Movimiento
        c.movimientos = (ct.movimientos || []).map(m => Object.assign(new Movimiento(), m));
        return c;
      });
    }
  }

  crearCliente(nombre, apellido, dni, email, pass) {
    if (this.getClientePorEmail(email)) throw new Error('Email ya registrado');
    const cliente = new Cliente(nombre, apellido, dni, email, pass);
    this.data.clientes.push(cliente);
    this.guardar();
    return cliente;
  }

  login(email, pass) {
    const c = this.getClientePorEmail(email);
    if (!c) throw new Error('Usuario no encontrado');
    if (c.password !== pass) throw new Error('Contraseña incorrecta');
    return c;
  }

  getClientePorEmail(email) {
    return this.data.clientes.find(x => x.email === (email || '').toLowerCase());
  }

  crearCuentaParaCliente(clienteId, saldoInicial = 0) {
    const cliente = this.data.clientes.find(c => c.id === clienteId);
    if (!cliente) throw new Error('Cliente no encontrado');
    const cuenta = new Cuenta(clienteId, saldoInicial);
    // si saldo inicial > 0, crear movimiento de depósito
    if (saldoInicial > 0) {
      cuenta.agregarMovimiento(new Movimiento('depósito', saldoInicial, new Date().toISOString(), 'Saldo inicial'));
    }
    this.data.cuentas.push(cuenta);
    cliente.cuentas.push(cuenta.codigo);
    this.guardar();
    return cuenta;
  }

  getCuentasDeCliente(clienteId) {
    return this.data.cuentas.filter(c => c.clienteId === clienteId);
  }

  getCuentaPorCodigo(codigo) {
    return this.data.cuentas.find(c => c.codigo === codigo);
  }

  realizarDeposito(codigoCuenta, monto) {
    const cuenta = this.getCuentaPorCodigo(codigoCuenta);
    if (!cuenta) throw new Error('Cuenta no encontrada');
    const mov = cuenta.depositar(monto);
    this.guardar();
    return mov;
  }

  realizarRetiro(codigoCuenta, monto) {
    const cuenta = this.getCuentaPorCodigo(codigoCuenta);
    if (!cuenta) throw new Error('Cuenta no encontrada');
    const mov = cuenta.retirar(monto);
    this.guardar();
    return mov;
  }
}

/* ---------- LÓGICA DE INTERFAZ ---------- */

const fintech = new SistemaFintech();
let usuarioActivo = null; // Cliente object

// elementos DOM
const authArea = document.getElementById('auth-area');
const authForms = document.getElementById('auth-forms');
const dashboard = document.getElementById('dashboard');

const tabLogin = document.getElementById('tab-login');
const tabRegister = document.getElementById('tab-register');
const formLogin = document.getElementById('form-login');
const formRegister = document.getElementById('form-register');

const loginEmail = document.getElementById('login-email');
const loginPass = document.getElementById('login-pass');

const regNombre = document.getElementById('reg-nombre');
const regApellido = document.getElementById('reg-apellido');
const regDni = document.getElementById('reg-dni');
const regEmail = document.getElementById('reg-email');
const regPass = document.getElementById('reg-pass');

const userEmailSpan = document.getElementById('user-email');
const userAccountsCount = document.getElementById('user-accounts-count');
const userTotalBalance = document.getElementById('user-total-balance');
const btnLogout = document.getElementById('btn-logout');

const accountsList = document.getElementById('accounts-list');
const formCreateAccount = document.getElementById('form-create-account');
const createInitial = document.getElementById('create-initial');

const selectAccount = document.getElementById('select-account');
const btnShowDeposit = document.getElementById('btn-show-deposit');
const btnShowWithdraw = document.getElementById('btn-show-withdraw');
const formDeposit = document.getElementById('form-deposit');
const formWithdraw = document.getElementById('form-withdraw');
const depositAmount = document.getElementById('deposit-amount');
const withdrawAmount = document.getElementById('withdraw-amount');
const movementsList = document.getElementById('movements-list');

/* ---------- Utilidades UI ---------- */

function showMessage(msg) {
  alert(msg); // simple; en proyecto real usar un toast
}

function toggleTab(loginActive) {
  if (loginActive) {
    tabLogin.classList.add('active');
    tabRegister.classList.remove('active');
    formLogin.classList.remove('hidden');
    formRegister.classList.add('hidden');
  } else {
    tabLogin.classList.remove('active');
    tabRegister.classList.add('active');
    formLogin.classList.add('hidden');
    formRegister.classList.remove('hidden');
  }
}

tabLogin.addEventListener('click', () => toggleTab(true));
tabRegister.addEventListener('click', () => toggleTab(false));

/* ---------- Eventos Auth ---------- */

formRegister.addEventListener('submit', (e) => {
  e.preventDefault();
  try {
    const cliente = fintech.crearCliente(
      regNombre.value.trim(),
      regApellido.value.trim(),
      regDni.value.trim(),
      regEmail.value.trim(),
      regPass.value
    );
    showMessage('Usuario creado. Iniciá sesión.');
    toggleTab(true);
    formRegister.reset();
  } catch (err) {
    showMessage(err.message);
  }
});

formLogin.addEventListener('submit', (e) => {
  e.preventDefault();
  try {
    const c = fintech.login(loginEmail.value.trim(), loginPass.value);
    usuarioActivo = c;
    renderAfterLogin();
    formLogin.reset();
  } catch (err) {
    showMessage(err.message);
  }
});

btnLogout.addEventListener('click', () => {
  usuarioActivo = null;
  renderAfterLogout();
});

/* ---------- Renderizar UI ---------- */

function renderAfterLogin() {
  authForms.classList.add('hidden');
  dashboard.classList.remove('hidden');
  authArea.innerHTML = `<div style="font-size:14px;color:var(--muted)">Conectado: ${usuarioActivo.email}</div>`;
  updateSummary();
  renderAccounts();
  populateAccountSelect();
  hideAllMovementForms();
  renderMovements();
}

function renderAfterLogout() {
  authForms.classList.remove('hidden');
  dashboard.classList.add('hidden');
  authArea.innerHTML = '';
}

/* ---------- Cuentas ---------- */

formCreateAccount.addEventListener('submit', (e) => {
  e.preventDefault();
  try {
    const saldo = Number(createInitial.value) || 0;
    const cuenta = fintech.crearCuentaParaCliente(usuarioActivo.id, saldo);
    // refrescar datos del cliente (cargar nuevamente desde storage)
    usuarioActivo = fintech.getClientePorEmail(usuarioActivo.email);
    updateSummary();
    renderAccounts();
    populateAccountSelect();
    formCreateAccount.reset();
    showMessage('Cuenta creada: ' + cuenta.codigo);
  } catch (err) {
    showMessage(err.message);
  }
});

function renderAccounts() {
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  accountsList.innerHTML = '';
  if (!cuentas.length) {
    accountsList.innerHTML = '<p class="account-meta">No hay cuentas. Creá una.</p>';
    return;
  }
  cuentas.forEach(c => {
    const div = document.createElement('div');
    div.className = 'account-card';
    const left = document.createElement('div');
    left.innerHTML = `<div><strong>${c.codigo}</strong></div><div class="account-meta">Saldo: $${c.saldo.toFixed(2)}</div>`;
    const right = document.createElement('div');
    right.innerHTML = `<button data-codigo="${c.codigo}" class="btn-view">Ver</button>`;
    div.appendChild(left);
    div.appendChild(right);
    accountsList.appendChild(div);
  });

  // botones ver
  document.querySelectorAll('.btn-view').forEach(b => {
    b.addEventListener('click', () => {
      const codigo = b.getAttribute('data-codigo');
      selectAccount.value = codigo;
      renderMovements();
    });
  });
}

function populateAccountSelect() {
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  selectAccount.innerHTML = '';
  const empty = document.createElement('option');
  empty.value = '';
  empty.textContent = '-- Seleccioná cuenta --';
  selectAccount.appendChild(empty);
  cuentas.forEach(c => {
    const opt = document.createElement('option');
    opt.value = c.codigo;
    opt.textContent = `${c.codigo} — $${c.saldo.toFixed(2)}`;
    selectAccount.appendChild(opt);
  });
}

/* ---------- Movimientos (formularios) ---------- */

btnShowDeposit.addEventListener('click', () => {
  formDeposit.classList.toggle('hidden');
  formWithdraw.classList.add('hidden');
});

btnShowWithdraw.addEventListener('click', () => {
  formWithdraw.classList.toggle('hidden');
  formDeposit.classList.add('hidden');
});

function hideAllMovementForms() {
  formDeposit.classList.add('hidden');
  formWithdraw.classList.add('hidden');
}

formDeposit.addEventListener('submit', (e) => {
  e.preventDefault();
  const codigo = selectAccount.value;
  if (!codigo) { showMessage('Seleccioná una cuenta'); return; }
  try {
    const monto = Number(depositAmount.value);
    fintech.realizarDeposito(codigo, monto);
    // after action: hide form and update UI and show resumen email + ultimos movimientos
    hideAllMovementForms();
    depositAmount.value = '';
    // refresh data
    usuarioActivo = fintech.getClientePorEmail(usuarioActivo.email);
    updateSummary();
    renderAccounts();
    populateAccountSelect();
    renderMovements();
    showMessage('Depósito realizado');
  } catch (err) {
    showMessage(err.message);
  }
});

formWithdraw.addEventListener('submit', (e) => {
  e.preventDefault();
  const codigo = selectAccount.value;
  if (!codigo) { showMessage('Seleccioná una cuenta'); return; }
  try {
    const monto = Number(withdrawAmount.value);
    fintech.realizarRetiro(codigo, monto);
    hideAllMovementForms();
    withdrawAmount.value = '';
    usuarioActivo = fintech.getClientePorEmail(usuarioActivo.email);
    updateSummary();
    renderAccounts();
    populateAccountSelect();
    renderMovements();
    showMessage('Retiro realizado');
  } catch (err) {
    showMessage(err.message);
  }
});

selectAccount.addEventListener('change', () => {
  renderMovements();
});

/* ---------- Mostrar Movimientos y Resumen ---------- */

function renderMovements() {
  movementsList.innerHTML = '';
  const codigo = selectAccount.value;
  if (!codigo) {
    movementsList.innerHTML = '<li class="movement">Seleccioná una cuenta para ver movimientos</li>';
    return;
  }
  const cuenta = fintech.getCuentaPorCodigo(codigo);
  if (!cuenta) {
    movementsList.innerHTML = '<li class="movement">Cuenta no encontrada</li>';
    return;
  }
  // mostrar últimos 10 movimientos en orden descendente
  const list = [...cuenta.movimientos].reverse().slice(0, 10);
  if (!list.length) {
    movementsList.innerHTML = '<li class="movement">No hay movimientos</li>';
    return;
  }
  list.forEach(m => {
    const li = document.createElement('li');
    li.className = 'movement';
    const left = document.createElement('div');
    left.innerHTML = `<strong>${m.tipo === 'depósito' ? '+' : '-'} $${m.monto.toFixed(2)}</strong><div class="account-meta">${new Date(m.fecha).toLocaleString()}</div>`;
    const right = document.createElement('div');
    right.innerHTML = `<small>${m.descripcion || ''}</small>`;
    li.appendChild(left);
    li.appendChild(right);
    movementsList.appendChild(li);
  });
}

function updateSummary() {
  userEmailSpan.textContent = usuarioActivo.email;
  const cuentas = fintech.getCuentasDeCliente(usuarioActivo.id);
  userAccountsCount.textContent = cuentas.length;
  const total = cuentas.reduce((s, c) => s + Number(c.saldo), 0);
  userTotalBalance.textContent = total.toFixed(2);
}

/* ---------- Inicio: si hay usuario en sessionStorage (opcional) ---------- */

// Si querés mantener sesión entre recargas, podés guardar el email en sessionStorage.
// Aquí no lo hacemos por defecto: comenzamos en pantalla de login.
// Sin embargo, si detectamos que hay al menos un cliente y ningún login, mostramos auth.

(function init() {
  // Si no hay clientes, crear un demo rápido
  if (!fintech.data.clientes.length) {
    // crear demo para facilitar pruebas
    try {
      const demo = fintech.crearCliente('Demo','Usuario','00000000','demo@fintech.test','demo123');
      fintech.crearCuentaParaCliente(demo.id, 500);
      fintech.crearCuentaParaCliente(demo.id, 1500);
    } catch(e){/*ignore*/}
  }
  renderAfterLogout();
})();
