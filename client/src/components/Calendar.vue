<template>
  <layout id="calendar">
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
