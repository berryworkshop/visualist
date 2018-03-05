<template>
  <layout id="calendar">
    <h2>Calendar</h2>
    <ul v-if="events && events.length > 0">
      <li v-for="e in events"
          :key="e.attributes.slug">{{ e.attributes.title }}</li>
    </ul>
    <p v-else>No events are available.</p>
    <event-add></event-add>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import EventAdd from "./forms/EventAdd";

export default {
  name: "Calendar",
  components: {
    Layout,
    EventAdd
  },
  created() {
    this.$store.dispatch("nodesFetch", {type: "event"});
  },
  computed: {
    events() {
      return this.$store.state.events;
    }
  }
};
</script>

<style scoped>
</style>
