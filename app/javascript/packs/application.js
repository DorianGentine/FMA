import "bootstrap";

import "../financerMonAutonomie_react";

import "../components/dynamicNavbar";

import "../components/get_solutions";

// import { fetchFormulary } from "../components/formularies/new";
// fetchFormulary();

import { fetchFormulary } from "../components/formularies/chatbot";
fetchFormulary();

import { currencyFormatDE } from "../components/currency";
currencyFormatDE()

import { initSelect2, initSelectize } from '../components/init_select2';
initSelect2();
initSelectize();
