<template>
  <div class="node-list">
    <!-- <ul v-if="nodes && nodes.length > 0">
      <li class="node" v-for="n in nodes" :key="n.attributes.slug">
        <div class="data">
          <span class="node-id">{{ n.id }}</span>
          <router-link class="node-link" :to="{name: n.attributes.label.toLowerCase(), params: { node_id: n.id }}">{{ n.attributes.title }}</router-link>
        </div>
        <div class="controls">
          <router-link :to="{
            name: `${n.attributes.label.toLowerCase()}Edit`,
            params: {
              node_id: n.id
            }}">Edit</router-link>
          <button name="delete" :value="n" v-on:click="deleteNode(n)">Delete</button>
        </div>
      </li>
    </ul> -->

    <table class="table" v-if="nodes && nodes.length > 0">
      <caption>List of {{ label.pluralize() }}</caption>
      <thead>
        <tr>
          <th scope="col">Pic</th>
          <th scope="col">Id</th>
          <th scope="col" style="width: 100%">Title</th>
          <th scope="col">Controls</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="n in nodes" :key="n.attributes.slug">
          <td scope="row">
            <img class="mr-3" src="http://via.placeholder.com/50" alt="Generic placeholder image">
          </td>
          <td>{{ n.id }}</td>
          <td>
            <router-link class="node-link" :to="{name: n.attributes.label.toLowerCase(), params: { node_id: n.id }}">{{ n.attributes.title }}</router-link>
          </td>
          <td>
            <router-link class="control"
                :to="{
                  name: `${n.attributes.label.toLowerCase()}Edit`,
                  params: {
                    node_id: n.id
                  }}">Edit</router-link>
            <button class="control" name="delete" :value="n" v-on:click="deleteNode(n)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>


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
      return this.$store.state["nodes"];
    }
  },
  methods: {
    async deleteNode(node) {
      await this.nodeDelete(node);
      this.updateNodes();
    },
    async updateNodes() {
      const json = await this.nodeBrowse(this.label);
      this.$store.dispatch("retainNodes", json.data);
    }
  },
  created() {
    this.updateNodes();
  }
};
</script>

<style lang="scss" scoped>
.control {
  margin-right: 1rem;
  &:last-child {
    margin-right: 0;
  }
}
</style>
