import React from 'react';

import Conseiller from "../containers/conseiller"

const Volet = (props) => {
  // console.log(props.conseiller);
  return (
    <div className="menu-principal">
      <Conseiller conseiller={props.conseiller} />
    </div>
  );
};

export default Volet;
