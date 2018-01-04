<template>
  <header>
    <h1>The Visualist</h1>
    <ul id="primary-nav" v-if="nav">
      <li v-for="i in nav">
        <router-link :to="{ name: i.name }">{{ i.text }}</router-link>
      </li>
    </ul>
  </header>
</template>

<script>
export default {
  name: 'HeaderDefault',
  data() {
    return {
      nav: [
        { name: 'Home', text: 'Home' },
        { name: 'Calendar', text: 'Calendar' },
        { name: 'Directory', text: 'Directory' },
        { name: 'Map', text: 'Map' },
        { name: 'Pages', text: 'Pages' },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
  header {
    padding: 1rem;
    background-color: #eee;

    #primary-nav {
      list-style-type: none;
      padding-left: 0;

      li {
        display: inline;
        margin-right: 1rem;
        &:last-of-type {
          margin-right: 0;
        }
      }
    }
  }
</style>
