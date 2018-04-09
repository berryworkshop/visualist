<template>
  <layout id="login">
    <h1 class="display-4">Login</h1>

    <button name="user-button" v-on:click="login">Login</button>

      <!-- <div>
        <label for="user-email">User Email </label>
        <input name="user-email"
            type="email"
            v-model="user.email"
            placeholder="User email"
            required>
      </div>
      <div>
        <label for="user-password">Password </label>
        <input name="user-password"
            type="password"
            v-model="user.password"
            placeholder="Password"
            required>
      </div>
      <button name="user-button"
          v-on:click="$store.dispatch('login', user)">Submit</button> -->
  </layout>
</template>

<script>
import Layout from "./layouts/Default";

export default {
  name: "Login",
  components: {
    Layout
  },
  data() {
    return {
      user: {
        email: "",
        password: ""
      }
    };
  }
};
</script>

<style scoped lang="scss">
input:invalid {
  border: 1px solid red;
}
</style>
