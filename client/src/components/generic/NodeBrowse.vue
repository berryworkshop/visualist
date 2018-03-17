<template>
  <div>
    <h3>Browse {{ type.pluralize().toTitleCase() }}</h3>
    <node-list :type="type"></node-list>

    <nav class="controls">
      <router-link :to="{name: `${type}Add`}">Add {{ type.toTitleCase() }}</router-link>
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
  props: {
    type: String
  }
};
</script>
