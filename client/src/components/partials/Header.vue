<template>
  <header>
    <h1>The Visualist</h1>
    <ul id="primary-nav" v-if="nav">
      <li v-for="i in nav"
          :key="i.slug">
        <router-link :to="{ name: i.name }">{{ i.text }}</router-link>
      </li>
    </ul>
    <!-- <ul id="user-nav"> -->
      <!-- <li v-if="!this.$store.getters.loggedIn">
        <router-link :to="{ name: 'login' }">Login</router-link>
      <li v-else>
        <button name="logout" class="link"
          v-on:click="$store.dispatch('logout')">Logout</button>
      </li> -->
      <!-- <li v-if="!isObjectEmpty(user)">User</li> -->
    <!-- </ul> -->
  </header>
</template>

<script>
export default {
  name: "HeaderDefault",
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
