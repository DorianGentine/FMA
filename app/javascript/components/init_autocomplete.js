import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    places({
      language: 'fr',
      countries: ['fr'],
      // type: 'city',
      container: addressInput
    });
  }

  // addressInput.addEventListener('change', e => console.log(e.highlight))
};


export { initAutocomplete };
