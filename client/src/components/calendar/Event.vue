<template>
  <layout id="event">
    <router-link :to="{name: 'calendar'}">back to calendar</router-link>
    <h2>Event: {{ event.attributes.title }}</h2>
    <p v-if="event.attributes.body">{{ event.attributes.body }}</p>
    <p v-else><em>No body available.</em></p>

    <p>created: {{ created_at }}</p>
    <p>updated: {{ updated_at }}</p>
  </layout>
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

<style scoped>
</style>
