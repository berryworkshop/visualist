import { AUTH_CONFIG } from "./config.js";
import auth0 from "auth0-js";
import router from "./../router";
import Vue from "vue";

const webauth = new auth0.WebAuth({
  domain: AUTH_CONFIG.domain,
  clientID: AUTH_CONFIG.clientId,
  redirectUri: AUTH_CONFIG.callbackUrl,
  audience: `https://${AUTH_CONFIG.domain}/userinfo`,
  responseType: "token id_token",
  scope: "openid"
});

/**
 * Determines whether the current session is valid.
 */
function isAuthenticated() {
  // Check whether the current time is past the
  // access token's expiry time
  let expiresAt = JSON.parse(localStorage.getItem("expires_at"));
  return new Date().getTime() < expiresAt;
}

const auth = new Vue({
  name: "AuthMixin",
  data() {
    // verify registered state change
    // this is in data() to trigger Vue's update mechanism
    this.$on("authChange", () => {
      this.authenticated = isAuthenticated();
    });
    return {
      authenticated: isAuthenticated()
    };
  },
  methods: {
    login() {
      webauth.authorize();
      // register state change
      this.$emit("authChange");
    },
    logout() {
      // clear session variables from local storage
      localStorage.removeItem("access_token");
      localStorage.removeItem("id_token");
      localStorage.removeItem("expires_at");
      // register state change
      this.$emit("authChange");
      // navigate to the home route
      router.push({ name: "home" });
    },
    handleAuthentication() {
      webauth.parseHash((err, authResult) => {
        if (authResult && authResult.accessToken && authResult.idToken) {
          this.setSession(authResult);
          this.$emit("authChange");
          router.push({ name: "home" });
        } else if (err) {
          router.push({ name: "home" });
          console.error(err);
        }
      });
    },
    setSession(authResult) {
      // Set the time that the access token will expire at
      const expiresAt = JSON.stringify(
        authResult.expiresIn * 1000 + new Date().getTime()
      );
      // save session variables in local storage
      localStorage.setItem("access_token", authResult.accessToken);
      localStorage.setItem("id_token", authResult.idToken);
      localStorage.setItem("expires_at", expiresAt);
      // register state change
      this.$emit("authChange");
    }
  }
});

export default {
  install(Vue) {
    Vue.prototype.$auth = auth;
  }
};
