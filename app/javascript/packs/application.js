import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
// import $ from 'jquery-3.3.1';
// <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initCarousel } from '../components/carousel';
import { showMore } from '../components/show_more';
import { initMapbox } from '../plugins/init_mapbox';
import { editOrder } from '../components/edit_order';
// import { initValidate } from '../plugins/initValidate'

initCarousel();
initMapbox();
editOrder();

// initValidate();
// document.getElementById('new_order').enableClientSideValidations();


const myBtn = document.querySelector('.myBtn');
myBtn.addEventListener('click', showMore)

