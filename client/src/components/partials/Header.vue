<template>
  <header>
    <h1>The Visualist</h1>
    <ul id="primary-nav" v-if="nav">
      <li v-for="i in nav"
          :key="i.slug">
        <router-link :to="{ name: i.name }">{{ i.text }}</router-link>
      </li>
    </ul>

    <button
      v-if="!$auth.loggedIn"
      class="btn btn-primary btn-margin"
      @click="$auth.login()">
        Log In
    </button>
    <button
      v-else
      class="btn btn-primary btn-margin"
      @click="$auth.logout()">
        Log Out
    </button>

  </header>
</template>

<script>
import auth from "../../auth/auth.js";

export default {
  name: "HeaderDefault",
  mixins: [auth],
  data() {
    return {
      nav: [
        {
          name: "home",
          text: "Home"
        },
        {
          name: "events",
          text: "Calendar"
        },
        {
          name: "agents",
          text: "Directory"
        },
        {
          name: "places",
          text: "Map"
        },
        {
          name: "search",
          text: "Search"
        }
      ]
    };
  },
  methods: {
    isObjectEmpty(obj) {
      return Object.keys(obj).length === 0;
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  padding: 1rem;
  background-color: #eee;

  ul {
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
