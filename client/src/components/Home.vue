<template>
  <layout id="home">
    <h1 class="display-1 mb-2">Today</h1>
    <p>
      <router-link :to="{name: 'eventAdd'}" class="mb-5">Add Event</router-link>
    </p>
    <node-media :label="'event'"></node-media>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import NodeMedia from "./partials/NodeMedia.vue";

export default {
  name: "Home",
  components: {
    Layout,
    NodeMedia
  }
};
</script>

<style scoped>
</style>
