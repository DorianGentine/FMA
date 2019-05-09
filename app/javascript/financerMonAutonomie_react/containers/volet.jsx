import React from 'react';

import Conseiller from "../containers/conseiller"
import Etapes from "../containers/etapes"
import RdvTel from "../containers/rdv_tel"
import ApercuProjet from "../components/apercu_projet"
import Evaluation from "../containers/evaluation"

const Volet = (props) => {
  // console.log(props.project);
  return (
    <div className="menu-principal">
      <Conseiller />
      <Etapes />
      <RdvTel />
      <ApercuProjet />
      <Evaluation />
    </div>
  );
};

export default Volet;
