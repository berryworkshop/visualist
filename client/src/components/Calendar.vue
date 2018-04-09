<template>
  <layout id="calendar">
    <!-- <h1>Calendar</h1> -->
    <router-view></router-view>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";

export default {
  name: "calendar",
  components: {
    Layout
  }
};
</script>
