<template>
  <layout id="directory">
    <h2>Directory</h2>
    <router-view></router-view>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";

export default {
  name: "Directory",
  components: {
    Layout
  }
};
</script>
