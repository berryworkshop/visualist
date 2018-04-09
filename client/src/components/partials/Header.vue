<template>
  <header>
    <!-- <div class="container">
      <h1>The Visualist</h1>
      <ul id="primary-nav" v-if="nav">
        <li v-for="i in nav"
            :key="i.slug">
          <router-link :to="{ name: i.name }">{{ i.text }}</router-link>
        </li>
      </ul>

      <button
        v-if="!$auth.authenticated"
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
    </div> -->
    <b-navbar toggleable="md" type="dark">
      <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
      <b-navbar-brand :to="{ name: 'home' }">Visualist</b-navbar-brand>
      <b-collapse is-nav id="nav_collapse">
        <b-navbar-nav v-if="nav">
          <b-nav-item
              v-for="i in nav"
              :to="{ name: i.name }"
              :key="i.slug">{{ i.text }}</b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-form
              @submit="navbarSearchSubmit">
            <b-form-input
                v-model="form.query"
                size="sm"
                class="mr-sm-2"
                type="text"
                placeholder="Search"/>
            <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
          </b-nav-form>

          <b-nav-item-dropdown right>
            <!-- Using button-content slot -->
            <template slot="button-content">User</template>
            <b-dropdown-item href="#">Profile</b-dropdown-item>
            <b-dropdown-item
              v-if="!$auth.authenticated"
              @click="$auth.login()">
                Log In
            </b-dropdown-item>
            <b-dropdown-item
              v-else
              @click="$auth.logout()">
                Log Out
            </b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>

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
        // {
        //   name: "home",
        //   text: "Home"
        // },
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
        }
        // {
        //   name: "search",
        //   text: "Search"
        // }
      ],
      form: {
        query: ""
      }
    };
  },
  methods: {
    isObjectEmpty(obj) {
      return Object.keys(obj).length === 0;
    },
    navbarSearchSubmit(event) {
      event.preventDefault();
      this.$router.push({ name: "search" });
      console.log(this.form.query);
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  // padding: 1rem;
  background-color: black;

  // ul {
  //   list-style-type: none;
  //   padding-left: 0;

  //   li {
  //     display: inline;
  //     margin-right: 1rem;
  //     &:last-of-type {
  //       margin-right: 0;
  //     }
  //   }
  // }
}
</style>
