<template>
  <div id="node">
    <h3>{{ type.toTitleCase() }}: {{ node.attributes.title }}</h3>

    <p v-if="node.attributes.properties">{{ node.attributes.properties }}</p>
    <p v-else><em>No properties available.</em></p>

    <p v-if="node.attributes.body">{{ node.attributes.body }}</p>
    <p v-else><em>No body available.</em></p>

    <p>created: {{ created_at }}</p>
    <p>updated: {{ updated_at }}</p>

    <nav class="controls">
      <router-link :to="{
          name: `${type}Edit`,
          params: {
            node_id: this.$route.params['node_id']
          }}">Edit Node</router-link>
      <!-- <router-link :to="{name: 'calendar'}">Browse Events</router-link> -->
    </nav>
  </div>
</template>

<script>
import moment from "moment";
import Layout from "../layouts/Default";
import nodecrud from "../../mixins/nodecrud";
// eslint-disable-next-line
import utility from "../../utility";

export default {
  name: "Node",
  components: {
    Layout
  },
  mixins: [nodecrud],
  props: {
    type: String
  },
  data() {
    return {
      node: {
        attributes: {}
      }
    };
  },
  computed: {
    created_at() {
      return moment(this.node.attributes.created_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    },
    updated_at() {
      return moment(this.node.attributes.updated_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    }
  },
  async created() {
    const node_id = this.$route.params["node_id"];
    this.node = await this.nodeRead("node", node_id);
  }
};
</script>
