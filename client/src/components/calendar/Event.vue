<template>
  <layout id="event">
    <h2>Event</h2>
  </layout>
</template>

<script>
import Layout from "../layouts/Default";
import nodecrud from "../../mixins/nodecrud"

export default {
  name: "Event",
  components: {
    Layout
  },
  mixins: [nodecrud],
  data() {
    return {
      event: {}
    }
  },
  created() {
    // this.nodeDelete('event', )
  }
};
</script>

<style scoped>
</style>
