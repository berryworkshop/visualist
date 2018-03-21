<template>
  <div class="node-list">
    <ul v-if="nodes && nodes.length > 0">
      <li class="node" v-for="n in nodes" :key="n.attributes.slug">
        <div class="data">
          <span class="node-id">{{ n.id }}</span><router-link class="node-link" :to="{name: n.attributes.label.toLowerCase(), params: { node_id: n.id }}">{{ n.attributes.title }}</router-link>
        </div>
        <div class="controls">
          <router-link :to="{
            name: `${n.attributes.label.toLowerCase()}Edit`,
            params: {
              node_id: n.id
            }}">Edit {{ label }}</router-link>
          <button name="delete" :value="n" v-on:click="deleteNode(n)">Delete {{ label }}</button>
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
  name: "NodeList",
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
      this.$store.dispatch("storeNodes", {
        label: this.label,
        nodes: json
      });
    }
  },
  created() {
    this.updateNodes();
  }
};
</script>

<style lang="scss" scoped>
.node-list ul {
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
