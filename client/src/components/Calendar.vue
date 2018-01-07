<template>
  <layout id="calendar">
    <h2>Calendar</h2>
    <event-add></event-add>
    <ul>
      <li v-for="e in events">{{ e.attributes.name }}</li>
    </ul>
  </layout>
</template>

<script>
import Layout from './layouts/Default';
import EventAdd from './forms/EventAdd';

export default {
  name: 'Calendar',
  components: {
    Layout,
    EventAdd,
  },
  created() {
    this.$store.dispatch('eventsFetch');
  },
  computed: {
    events() {
      return this.$store.state.events;
    },
  },
};
</script>

<style scoped>
</style>
