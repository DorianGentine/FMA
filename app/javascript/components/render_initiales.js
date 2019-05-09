const renderInitiale = (prenom, nom) => {
  const initiales = prenom.substring(0,1) + nom.substring(0,1)
  return initiales
};

export default renderInitiale;
