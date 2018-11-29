import "bootstrap";
import { initAddrAutocomplete } from '../plugins/init_addr_autocomplete';
// import "../components/aos";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

initAddrAutocomplete();
initMapbox();
