<template>
  <layout id="map">
    <!-- <h1>Map</h1> -->
    <div id="mapid"></div>
    <router-view></router-view>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import L from "leaflet";

export default {
  name: "Map",
  components: {
    Layout
  },
  mounted() {
    const token = process.env.VUE_APP_MAPBOX_ACCESS_TOKEN;
    let mymap = L.map("mapid").setView([41.8781, -87.6298], 10);
    L.tileLayer(
      `https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=${token}`,
      {
        attribution:
          'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: "mapbox.streets",
        accessToken: token
      }
    ).addTo(mymap);
  }
};
</script>

<style scoped>
#mapid {
  height: 20rem;
  border: 1px solid silver;
}
</style>
