import React, { Component } from 'react';
import renderInitiale from "./render_initiales"

export default function renderLogo(financer){
  if(financer.logo != null || financer.avatar && financer.avatar.url != null){
    let url = ""
    if(financer.logo){
      url = financer.logo
    }else if(financer.avatar.url){
      url = financer.avatar.url
    }
    return(
      <div
        className="logo-financeur margin-right-15"
        style={{ minHeight: "35px", minWidth: "35px", backgroundImage: `url(${url})`}}
        >
      </div>
    )
  }else{
    let name = ""
    if(financer.name){
      name = financer.name
    }else if(financer.first_name){
      name = `${financer.first_name}${financer.last_name ? ` ${financer.last_name}` : ""}`
    }
    return(
      <div
        className={`${financer.name ? "logo-financeur" : "navbar-avatar no-margin" } margin-right-15`}
        style={{ height: "35px", width: "35px"}}
        >{renderInitiale(`${name}`)}
      </div>
    )
  }
}
