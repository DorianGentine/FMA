import React from 'react';

const AppNavbar = (props) => {
  return (
    <div className="app-navbar">
      <a href="/home"><div className="logo-app"></div></a>
      <div className="btn-app-navbar margin-top-60 active">
        <i className="far fa-file-alt"></i>
        <p>Projet</p>
      </div>
      <div className="btn-app-navbar margin-top-30">
        <i className="far fa-user"></i>
        <p>Compte</p>
      </div>
      <div className="btn-app-navbar margin-top-30">
        <i className="far fa-bell"></i>
        <p>Alertes</p>
      </div>
      <div className="btn-app-navbar navbar-quit margin-top-30">
        <i className="fas fa-door-open"></i>
        <p>Quitter</p>
      </div>
    </div>
  );
};

export default AppNavbar;
