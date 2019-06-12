export function renderDate(date, format){
  let dateToRender
  if(date === undefined){
    dateToRender = new Date();
  }else{
    dateToRender = new Date(date);
  }
  let dd = String(dateToRender.getDate()).padStart(2, '0');
  let mm = String(dateToRender.getMonth() + 1).padStart(2, '0'); //January is 0!
  let yyyy = dateToRender.getFullYear();

  if(format === undefined){
    dateToRender = dd + '/' + mm + '/' + yyyy;
  }else if(format === "dd_mmm"){
    mm = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][dateToRender.getMonth()];
    dateToRender = dd + ' ' + mm;
  }

  return dateToRender
}

export function diffDays(d1, d2) {
  var t2 = d2.getTime();
  var t1 = d1.getTime();

  return parseInt((t2-t1)/(24*3600*1000));
}
