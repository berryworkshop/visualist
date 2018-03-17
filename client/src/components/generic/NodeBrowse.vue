<template>
  <div>
    <h3>Browse {{ type.pluralize().toTitleCase() }}</h3>
    <ul id="node-list" v-if="nodes && nodes.length > 0">
      <li class="node" v-for="n in nodes" :key="n.attributes.slug">
        <div class="data">
          <span class="node-id">{{ n.id }}</span><router-link class="node-link" :to="{name: n.type, params: { node_id: n.id }}">{{ n.attributes.title }}</router-link>
        </div>
        <div class="controls">
          <router-link :to="{
            name: `${n.type}Edit`,
            params: {
              node_id: n.id
            }}">Edit {{ type.toTitleCase() }}</router-link>
          <button name="delete" :value="n" v-on:click="nodeDelete(n)">Delete {{ type.toTitleCase() }}</button>
        </div>
      </li>
    </ul>
    <p v-else>No {{ type.pluralize() }} are available.</p>

    <nav class="controls">
      <router-link :to="{name: `${type}Add`}">Add {{ type.toTitleCase() }}</router-link>
    </nav>
  </div>
</template>

<script>
import nodecrud from "../../mixins/nodecrud";
// eslint-disable-next-line
import utility from "../../utility";

export default {
  name: "node-browse",
  components: {},
  mixins: [nodecrud],
  props: {
    type: String
  },
  computed: {
    nodes() {
      return this.$store.state[this.type.pluralize()];
    }
  },
  methods: {
    async nodeDelete(node) {
      await this.nodeDelete(this.type, node);
      this.updateNodes();
    },
    async updateNodes() {
      const json = await this.nodeBrowse(this.type);
      this.$store.dispatch("storeNodes", {
        type: this.type,
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
ul#node-list {
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
