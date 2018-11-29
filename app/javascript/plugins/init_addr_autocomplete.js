import places from 'places.js';

const initAddrAutocomplete = () => {
  const addressInput = document.getElementById('location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAddrAutocomplete };
