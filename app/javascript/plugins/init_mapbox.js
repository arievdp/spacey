import mapboxgl from 'mapbox-gl';

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   bounds.extend([ markers.lng, markers.lat ]);
//   map.fitBounds(bounds, {padding: 20, maxZoom: 15, duration: 5000 });
//   console.log(bounds)
// };

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const markers = JSON.parse(mapElement.dataset.markers);
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/rithvik/ckb0ayc9r0kpd1ilgsod48oym',
      center: [markers['lng'], markers['lat']],
      zoom: 7
    });
    const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${markers.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '40px';
    element.style.height = '40px';

    new mapboxgl.Marker(element)
    .setLngLat([markers.lng, markers.lat])
    .setPopup(popup)
    .addTo(map);

    }

}



  // Pass the element as an argument to the new marker



export { initMapbox };
