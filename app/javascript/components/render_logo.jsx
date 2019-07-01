import React, { Component } from 'react';
import renderInitiale from "./render_initiales"

export default function renderLogo(financer){
  if(financer.logo != null ||
    financer.avatar != null ||
    typeof financer.avatar === "object" && financer.avatar && financer.avatar.url != null){
    let url = ""
    if(financer.logo){
      url = financer.logo
    }else if( typeof financer.avatar === "object"){
      url = financer.avatar.url
    }else if(financer.avatar){
      url = financer.avatar
    }
    return(
      <div
        className={`${financer.name ? "logo-financeur" : "navbar-avatar no-margin" } margin-right-15`}
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
    }else if( typeof financer === "string" ) {
      name = financer
    }else{
      name = "Adrien Euphrasie"
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
