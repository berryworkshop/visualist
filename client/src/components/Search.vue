<template>
  <layout id="login">
    <h1 class="display-4">Search</h1>
    <node-list :label="'Node'"></node-list>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import NodeList from "./partials/NodeList";

export default {
  name: "Search",
  components: {
    Layout,
    NodeList
  }
};
</script>

<style scoped>
</style>
