<template>
  <layout id="pages">
    <h2>Pages</h2>
    <ul v-if="pages.length > 0">
      <li v-for="p in pages">{{ p.attributes.title }}</li>
    </ul>
    <p v-else>No pages are available.  Please login.</p>
  </layout>
</template>

<script>
import Layout from './layouts/Default';

export default {
  name: 'Pages',
  components: {
    Layout,
  },
  created() {
    this.$store.dispatch('pagesFetch');
  },
  computed: {
    pages() {
      return this.$store.state.pages;
    },
  },
};
</script>

<style scoped>
</style>
