<template>
  <layout id="directory">
    <!-- <h1>Directory</h1> -->
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
