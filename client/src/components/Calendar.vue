<template>
  <layout id="calendar">
    <h2>Calendar</h2>
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
