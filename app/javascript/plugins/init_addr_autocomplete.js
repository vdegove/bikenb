import places from 'places.js';

const initAddrAutocomplete = () => {
  const addressInput = document.getElementById('address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAddrAutocomplete };
