const app = document.getElementById('app');
const shopTitle = document.getElementById('shop-title');
const cashAmount = document.getElementById('cash-amount');
const bankAmount = document.getElementById('bank-amount');
const searchInput = document.getElementById('search');
const vehicleList = document.getElementById('vehicle-list');
const resultCount = document.getElementById('result-count');
const detailEmpty = document.getElementById('detail-empty');
const detailCard = document.getElementById('detail-card');
const detailBrand = document.getElementById('detail-brand');
const detailName = document.getElementById('detail-name');
const detailCategory = document.getElementById('detail-category');
const detailPrice = document.getElementById('detail-price');
const btnClose = document.getElementById('btn-close');
const btnBuyCash = document.getElementById('btn-buy-cash');
const btnBuyBank = document.getElementById('btn-buy-bank');

const SORT_OPTIONS = [
    { value: 'name', label: 'İsme göre' },
    { value: 'price-asc', label: 'Fiyat (artan)' },
    { value: 'price-desc', label: 'Fiyat (azalan)' },
];

const filterState = {
    category: { value: '', label: 'Tüm kategoriler' },
    brand: { value: '', label: 'Tüm markalar' },
    sort: { value: 'name', label: 'İsme göre' },
};

const filterUi = {
    category: {
        trigger: document.getElementById('filter-category-trigger'),
        menu: document.getElementById('filter-category-menu'),
        wrap: document.querySelector('[data-filter="category"]'),
    },
    brand: {
        trigger: document.getElementById('filter-brand-trigger'),
        menu: document.getElementById('filter-brand-menu'),
        wrap: document.querySelector('[data-filter="brand"]'),
    },
    sort: {
        trigger: document.getElementById('filter-sort-trigger'),
        menu: document.getElementById('filter-sort-menu'),
        wrap: document.querySelector('[data-filter="sort"]'),
    },
};

let allVehicles = [];
let selectedModel = null;
let buying = false;

function formatMoney(value) {
    return '$' + Number(value || 0).toLocaleString('en-US');
}

function post(name, data) {
    return fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data || {}),
    }).then((r) => r.json());
}

function closeUi() {
    closeAllMenus();
    app.classList.add('hidden');
    selectedModel = null;
    buying = false;
    post('close');
}

function closeAllMenus() {
    Object.values(filterUi).forEach((ui) => {
        ui.menu.classList.add('hidden');
        ui.wrap.classList.remove('open');
    });
}

function setFilter(key, value, label) {
    filterState[key].value = value;
    filterState[key].label = label;
    filterUi[key].trigger.querySelector('span').textContent = label;
    filterUi[key].menu.querySelectorAll('.filter-option').forEach((btn) => {
        btn.classList.toggle('active', btn.dataset.value === value);
    });
    renderList();
}

function buildMenu(key, options) {
    const menu = filterUi[key].menu;
    menu.innerHTML = '';
    options.forEach((opt) => {
        const btn = document.createElement('button');
        btn.type = 'button';
        btn.className = 'filter-option';
        btn.dataset.value = opt.value;
        btn.textContent = opt.label;
        if (filterState[key].value === opt.value) {
            btn.classList.add('active');
        }
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            setFilter(key, opt.value, opt.label);
            closeAllMenus();
        });
        menu.appendChild(btn);
    });
}

function setupFilterToggle(key) {
    const ui = filterUi[key];
    ui.trigger.addEventListener('click', (e) => {
        e.stopPropagation();
        const willOpen = ui.menu.classList.contains('hidden');
        closeAllMenus();
        if (willOpen) {
            ui.menu.classList.remove('hidden');
            ui.wrap.classList.add('open');
        }
    });
}

function populateFilters(categories, brands) {
    const categoryOptions = [{ value: '', label: 'Tüm kategoriler' }].concat(
        categories.map((cat) => ({ value: cat.id, label: cat.label }))
    );
    const brandOptions = [{ value: '', label: 'Tüm markalar' }].concat(
        brands.map((brand) => ({ value: brand, label: brand }))
    );

    filterState.category = { value: '', label: 'Tüm kategoriler' };
    filterState.brand = { value: '', label: 'Tüm markalar' };
    filterState.sort = { value: 'name', label: 'İsme göre' };

    filterUi.category.trigger.querySelector('span').textContent = filterState.category.label;
    filterUi.brand.trigger.querySelector('span').textContent = filterState.brand.label;
    filterUi.sort.trigger.querySelector('span').textContent = filterState.sort.label;

    buildMenu('category', categoryOptions);
    buildMenu('brand', brandOptions);
    buildMenu('sort', SORT_OPTIONS);
}

function getFilteredVehicles() {
    const query = searchInput.value.trim().toLowerCase();
    const cat = filterState.category.value;
    const brand = filterState.brand.value;
    const sort = filterState.sort.value;

    let list = allVehicles.filter((v) => {
        if (cat && v.category !== cat) return false;
        if (brand && v.brand !== brand) return false;
        if (!query) return true;
        return (
            v.name.toLowerCase().includes(query) ||
            v.brand.toLowerCase().includes(query) ||
            v.model.toLowerCase().includes(query)
        );
    });

    if (sort === 'price-asc') {
        list.sort((a, b) => a.price - b.price);
    } else if (sort === 'price-desc') {
        list.sort((a, b) => b.price - a.price);
    } else {
        list.sort((a, b) => {
            if (a.brand === b.brand) return a.name.localeCompare(b.name);
            return a.brand.localeCompare(b.brand);
        });
    }

    return list;
}

function selectVehicle(vehicle) {
    selectedModel = vehicle.model;
    detailEmpty.classList.add('hidden');
    detailCard.classList.remove('hidden');
    detailBrand.textContent = vehicle.brand;
    detailName.textContent = vehicle.name;
    detailCategory.textContent = vehicle.categoryLabel;
    detailPrice.textContent = formatMoney(vehicle.price);

    document.querySelectorAll('.vehicle-item').forEach((el) => {
        el.classList.toggle('active', el.dataset.model === vehicle.model);
    });
}

function renderList() {
    const list = getFilteredVehicles();
    vehicleList.innerHTML = '';
    resultCount.textContent = list.length + ' araç';

    if (!list.length) {
        vehicleList.innerHTML = '<div class="detail-empty"><p>Eşleşen araç bulunamadı.</p></div>';
        detailEmpty.classList.remove('hidden');
        detailCard.classList.add('hidden');
        selectedModel = null;
        return;
    }

    list.forEach((vehicle) => {
        const item = document.createElement('div');
        item.className = 'vehicle-item' + (selectedModel === vehicle.model ? ' active' : '');
        item.dataset.model = vehicle.model;
        item.innerHTML =
            '<div><div class="name">' +
            vehicle.name +
            '</div><div class="meta">' +
            vehicle.brand +
            ' · ' +
            vehicle.categoryLabel +
            '</div></div><div class="price">' +
            formatMoney(vehicle.price) +
            '</div>';
        item.addEventListener('click', () => selectVehicle(vehicle));
        vehicleList.appendChild(item);
    });

    if (selectedModel) {
        const stillThere = list.find((v) => v.model === selectedModel);
        if (!stillThere) {
            selectedModel = null;
            detailEmpty.classList.remove('hidden');
            detailCard.classList.add('hidden');
        }
    }
}

function buy(payType) {
    if (!selectedModel || buying) return;
    buying = true;
    post('buy', { model: selectedModel, payType }).finally(() => {
        buying = false;
        post('refreshMoney').then((money) => {
            if (money) {
                cashAmount.textContent = formatMoney(money.cash);
                bankAmount.textContent = formatMoney(money.bank);
            }
        });
    });
}

function openDealership(data) {
    allVehicles = data.vehicles || [];
    shopTitle.textContent = data.label || 'Galeri';
    cashAmount.textContent = formatMoney(data.cash);
    bankAmount.textContent = formatMoney(data.bank);
    searchInput.value = '';
    selectedModel = null;
    detailEmpty.classList.remove('hidden');
    detailCard.classList.add('hidden');
    populateFilters(data.categories || [], data.brands || []);
    renderList();
    closeAllMenus();
    app.classList.remove('hidden');
}

setupFilterToggle('category');
setupFilterToggle('brand');
setupFilterToggle('sort');

document.addEventListener('click', closeAllMenus);

searchInput.addEventListener('input', renderList);
btnClose.addEventListener('click', closeUi);
btnBuyCash.addEventListener('click', () => buy('cash'));
btnBuyBank.addEventListener('click', () => buy('bank'));

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        if (![...Object.values(filterUi)].some((ui) => !ui.menu.classList.contains('hidden'))) {
            closeUi();
        } else {
            closeAllMenus();
        }
    }
});

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'open') {
        openDealership(data.dealership);
    } else if (data.action === 'close') {
        app.classList.add('hidden');
    }
});
