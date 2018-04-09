<template>
  <div>
    <h1 class="display-4">Browse People and Organizations</h1>
    <node-list :label="label"></node-list>

    <nav class="controls">
      <router-link :to="{name: `people`}">Browse People</router-link>
      <router-link :to="{name: `organizations`}">Browse Organizations</router-link>
      <router-link :to="{name: `personAdd`}">Add Person</router-link>
      <router-link :to="{name: `organizationAdd`}">Add Organization</router-link>
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
    label: {
      type: String,
      required: true
    }
  }
};
</script>
