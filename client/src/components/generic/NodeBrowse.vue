<template>
  <div>
    <h3>Browse {{ label.toLowerCase().pluralize().toTitleCase() }}</h3>
    <node-list :label="label"></node-list>

    <nav class="controls">
      <router-link :to="{name: `${label.toLowerCase()}Add`}">Add {{ label }}</router-link>
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
    label: String,
    required: true
  }
};
</script>
