<template>
  <layout id="event">
    <router-link :to="{name: 'calendar'}">back to calendar</router-link>
    <h2>Event: {{ event.attributes.title }}</h2>
    <p v-if="event.attributes.body">{{ event.attributes.body }}</p>
    <p v-else><em>No body available.</em></p>
  </layout>
</template>

<script>
import Layout from "../layouts/Default";
import nodecrud from "../../mixins/nodecrud";

export default {
  name: "Event",
  components: {
    Layout
  },
  mixins: [nodecrud],
  data() {
    return {
      event: {
        attributes: {}
      },
    }
  },
  async created() {
    const event_id = this.$route.params['event_id'];
    this.event = await this.nodeGet('event', event_id)
  },
};
</script>

<style scoped>
</style>
