<template>
  <div>
    <h3>Browse Events</h3>
    <node-list type="event"></node-list>

    <nav class="controls">
      <router-link :to="{name: `eventAdd`}">Add Event</router-link>
    </nav>
  </div>
</template>

<script>
// eslint-disable-next-line
import utility from "../../utility";
import NodeList from "../partials/NodeList";

export default {
  name: "node-browse",
  components: {
    NodeList
  },
};
</script>
