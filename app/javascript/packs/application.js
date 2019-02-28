import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
// import $ from 'jquery-3.3.1';
// <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initCarousel } from '../components/carousel';
import { showMore } from '../components/showMore';
import { initMapbox } from '../plugins/init_mapbox';
// import { initValidate } from '../plugins/initValidate'

initCarousel();
initMapbox();

// initValidate();
// document.getElementById('new_order').enableClientSideValidations();


const myBtn = document.querySelector('.myBtn');
myBtn.addEventListener('click', showMore)

