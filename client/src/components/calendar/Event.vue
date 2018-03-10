<template>
  <div id="event">
    <h3>Event: {{ event.attributes.title }}</h3>

    <p v-if="event.attributes.properties">{{ event.attributes.properties }}</p>
    <p v-else><em>No properties available.</em></p>

    <p v-if="event.attributes.body">{{ event.attributes.body }}</p>
    <p v-else><em>No body available.</em></p>

    <p>created: {{ created_at }}</p>
    <p>updated: {{ updated_at }}</p>

    <nav class="controls">
      <router-link :to="{
          name: 'eventEdit',
          params: {
            event_id: this.$route.params['event_id']
          }}">Edit Event</router-link>
      <router-link :to="{name: 'calendar'}">Browse Events</router-link>
    </nav>
  </div>
</template>

<script>
import moment from "moment";
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
      }
    };
  },
  computed: {
    created_at() {
      return moment(this.event.attributes.created_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    },
    updated_at() {
      return moment(this.event.attributes.updated_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    }
  },
  async created() {
    const event_id = this.$route.params["event_id"];
    this.event = await this.nodeRead("event", event_id);
  }
};
</script>
