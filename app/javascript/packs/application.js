import "bootstrap";

import "../financerMonAutonomie_react";

import "../components/dynamicNavbar";

import { fetchFormulary } from "../components/formularies/new";
fetchFormulary();


import { initSelect2, initSelectize } from '../components/init_select2';
initSelect2();
initSelectize();
