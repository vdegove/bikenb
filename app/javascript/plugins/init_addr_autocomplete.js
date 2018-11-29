import places from 'places.js';

const initAddrAutocomplete = () => {
  const addressInput = document.getElementById('query2');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAddrAutocomplete };
