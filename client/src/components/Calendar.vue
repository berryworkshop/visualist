<template>
  <layout id="calendar">
    <h2>Calendar</h2>
    <ul v-if="events && events.length > 0">
      <li v-for="e in events"
          :key="e.attributes.slug">
        <button name="delete" :value="e"
            v-on:click="deleteEvent(e)">Delete</button>
        <router-link :to="{name: 'event', params: { event_id: e.id }}">{{ e.id }} - {{ e.attributes.title }}</router-link></li>
    </ul>
    <p v-else>No events are available.</p>

    <event-add v-on:updateEvents="update"></event-add>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import EventAdd from "./forms/EventAdd";
import nodecrud from "../mixins/nodecrud";

export default {
  name: "Calendar",
  components: {
    Layout,
    EventAdd
  },
  mixins: [nodecrud],
  computed: {
    events() {
      return this.$store.state.events;
    }
  },
  methods: {
    async deleteEvent(event) {
      await this.nodeDelete("event", event);
      this.update();
    },
    async update() {
      const json = await this.nodesGet("event");
      this.$store.dispatch("storeNodes", {
        type: "event",
        nodes: json
      });
    }
  },
  created() {
    this.update();
  }
};
</script>

<style scoped>
</style>
