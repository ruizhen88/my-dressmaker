import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initCarousel } from '../components/carousel';
import { showMore } from '../components/showMore';
import { initMapbox } from '../plugins/init_mapbox';

initCarousel();
initMapbox();


const myBtn = document.querySelector('.myBtn');

myBtn.addEventListener('click', showMore)
