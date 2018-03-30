import { AUTH_CONFIG } from "./config.js";
import auth0 from "auth0-js";
import router from "./../router";
import EventEmitter from "eventemitter3";
import Vue from "vue";

const authNotifier = new EventEmitter();

const webauth = new auth0.WebAuth({
  domain: AUTH_CONFIG.domain,
  clientID: AUTH_CONFIG.clientId,
  redirectUri: AUTH_CONFIG.callbackUrl,
  audience: `https://${AUTH_CONFIG.domain}/userinfo`,
  responseType: "token id_token",
  scope: "openid"
});

function setSession(authResult) {
  // Set the time that the access token will expire at
  const expiresAt = JSON.stringify(
    authResult.expiresIn * 1000 + new Date().getTime()
  );
  localStorage.setItem("access_token", authResult.accessToken);
  localStorage.setItem("id_token", authResult.idToken);
  localStorage.setItem("expires_at", expiresAt);
  authNotifier.emit("authChange", { authenticated: true });
}

const auth = new Vue({
  name: "AuthMixin",
  data() {
    return {
      authenticated: false
    };
  },
  methods: {
    async login() {
      this.loggedIn = true;
      await webauth.authorize();
    },
    async logout() {
      // Clear access token and ID token from local storage
      localStorage.removeItem("access_token");
      localStorage.removeItem("id_token");
      localStorage.removeItem("expires_at");
      authNotifier.emit("authChange", false);
      // navigate to the home route
      this.loggedIn = false;
      router.push({ name: "home" });
    },
    async handleAuthentication() {
      webauth.parseHash((err, authResult) => {
        if (authResult && authResult.accessToken && authResult.idToken) {
          setSession(authResult);
          this.loggedIn = true;
          router.push({ name: "home" });
        } else if (err) {
          router.push({ name: "home" });
          console.error(err);
        }
      });
    },
    async setAuth() {
      // Check whether the current time is past the
      // access token's expiry time
      if (this.authenticated === true) {
        const expiresAt = JSON.parse(localStorage.getItem("expires_at"));
        this.authenticated = new Date().getTime() < expiresAt;
      }
      this.authenticated = false;
    }
  }
});

export default {
  install(Vue) {
    Vue.prototype.$auth = auth;
  }
};
