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
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [markers['lng'], markers['lat']],
      zoom: 4
    });
    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .addTo(map);
    // fitMapToMarkers(map, markers);
    }
}

export { initMapbox };
