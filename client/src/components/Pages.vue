<template>
  <layout id="pages">
    <h2>Pages</h2>
    <ul>
      <li v-for="p in pages">{{ p.attributes.title }}</li>
    </ul>
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
    this.$store.commit('getPages');
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
