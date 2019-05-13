const renderInitiale = (string) => {
  const names = string.split(" ")
  let initiales = ""
  for (var i = 0; i < names.length; i++) {
    initiales = initiales + names[i].substring(0,1)
  }
  return initiales
};

export default renderInitiale;
