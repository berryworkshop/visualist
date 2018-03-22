<template>
  <div id="node">
    <h3>{{ label }}: {{ node.attributes.title }}</h3>

    <!-- <p v-if="node.attributes.properties">{{ node.attributes.properties }}</p>
    <p v-else><em>No properties available.</em></p> -->

    <p v-if="node.attributes.body">{{ node.attributes.body }}</p>
    <p v-else><em>No body available.</em></p>

    <div>
      <ul v-if="node.attributes.properties.websites">
        <li v-for="(s, index) in node.attributes.properties.websites"
            :key="index">
          <a :href="s.url">{{ s.url }}</a>
        </li>
      </ul>
    </div>

    <div>
      <p>created: {{ created_at }}</p>
      <p>updated: {{ updated_at }}</p>
    </div>

    <nav class="controls">
      <router-link :to="{
          name: `${label.toLowerCase()}Edit`,
          params: {
            node_id: $route.params['node_id']
          }}">Edit {{ label }}</router-link>
      <router-link :to="{name: label.toLowerCase().pluralize()}">Browse {{ label.pluralize() }}</router-link>
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
    label: {
      type: String,
      required: true
    }
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
    this.node = await this.nodeRead(node_id);
  }
};
</script>
