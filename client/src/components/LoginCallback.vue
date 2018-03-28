<template>
  <layout id="loginCallback">
    <h2>Callback</h2>
    <p>You have been logged in.</p>
  </layout>
</template>

<script>
import Layout from "./layouts/Default";

export default {
  name: "LoginCallback",
  components: {
    Layout
  },
  created() {
    this.$store.dispatch('handleAuthentication')
  }
};
</script>
