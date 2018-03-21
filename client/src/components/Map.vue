<template>
  <layout id="map">
    <h2>Map</h2>
    <router-view></router-view>

  </layout>
</template>

<script>
import Layout from "./layouts/Default";

export default {
  name: "Map",
  components: {
    Layout
  }
};
</script>

<style scoped>
</style>
