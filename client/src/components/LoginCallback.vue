<template>
  <layout id="loginCallback">
    <p>Logging in...</p>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";
import auth from "../auth/auth.js";

export default {
  name: "LoginCallback",
  mixins: [auth],
  components: {
    Layout
  },
  created() {
    this.$auth.handleAuthentication();
  }
};
</script>
