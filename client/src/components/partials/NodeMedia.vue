<template>
  <div class="node-media">
    <ul v-if="nodes && nodes.length > 0">
      <li class="node media mb-3" v-for="n in nodes" :key="n.attributes.slug">

        <img class="mr-3" src="http://via.placeholder.com/100" alt="Generic placeholder image">
        <div class="media-body">
          <router-link class="node-link" :to="{name: n.attributes.label.toLowerCase(), params: { node_id: n.id }}">
              <h3 class="mt-0">{{ n.attributes.title }}</h3>
          </router-link>

          <ul class="list-unstyled mt-2 mb-3">
            <li>@ MCA Pop-up at 1330 N Milwaukee Ave</li>
            <li>Opening Saturday, April 7th, from 10PM - 5PM</li>
            <li>On view through Sunday, April 8th</li>
          </ul>

          <p>{{ truncateWords(n.attributes.body, 50) }}</p>
        </div>

      </li>
    </ul>
    <p v-else>No {{ label.pluralize() }} are available.</p>
  </div>
</template>

<script>
import nodecrud from "../../mixins/nodecrud";
// eslint-disable-next-line
import utility from "../../utility";

export default {
  name: "NodeMedia",
  mixins: [nodecrud],
  props: {
    label: String
  },
  computed: {
    nodes() {
      return this.$store.state[this.label.toLowerCase().pluralize()];
    }
  },
  methods: {
    async deleteNode(node) {
      await this.nodeDelete(node);
      this.updateNodes();
    },
    async updateNodes() {
      const json = await this.nodeBrowse(this.label);
      this.$store.dispatch("retainNodes", {
        label: this.label,
        nodes: json
      });
    },
    truncateWords(text, wordcount) {
      const words = text.split(" ");
      return words
        .splice(0, wordcount)
        .join(" ")
        .concat(words.length > wordcount ? "..." : "");
    }
  },
  created() {
    this.updateNodes();
  }
};
</script>

<style lang="scss" scoped>
.node-media ul {
  padding-left: 0;
  list-style-type: none;

  .node {
    display: flex;
    .data {
      flex: 1;
      > * {
        margin-right: 1rem;
      }
    }
    .controls {
      > * {
        margin-left: 1rem;
      }
    }
  }
}
</style>
