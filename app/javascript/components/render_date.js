export function renderDate(date, format){
  let dateToRender
  if(date === undefined){
    dateToRender = new Date();
  }else{
    dateToRender = new Date(date);
  }

  let weekday = new Array(7);
  weekday[0] = "dimanche";
  weekday[1] = "lundi";
  weekday[2] = "mardi";
  weekday[3] = "mercredi";
  weekday[4] = "jeudi";
  weekday[5] = "vendredi";
  weekday[6] = "samedi";
  let jour = weekday[dateToRender.getDay()];

  let dd = String(dateToRender.getDate()).padStart(2, '0');
  let mm = String(dateToRender.getMonth() + 1).padStart(2, '0'); //January is 0!
  let yyyy = dateToRender.getFullYear();
  let hour = dateToRender.getHours()
  let min = String(dateToRender.getMinutes()).padStart(2, '0')

  if(format === undefined){
    dateToRender = dd + '/' + mm + '/' + yyyy;
  }else if(format === "dd_mmm"){
    mm = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][dateToRender.getMonth()];
    dateToRender = dd + ' ' + mm;
  }else if(format === "ddd_mmm_hhhh"){
    mm = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"][dateToRender.getMonth()];
    dateToRender = `le ${jour} ${dd} ${mm} à ${hour}h${min}`;
  }

  return dateToRender
}

export function diffDays(d1, d2) {
  var t2 = d2.getTime();
  var t1 = d1.getTime();

  return parseInt((t2-t1)/(24*3600*1000));
}
