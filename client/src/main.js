// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue";
import App from "./App";
import router from "./router";
import store from "./store/index";
import auth from "./auth/auth.js";

Vue.config.productionTip = false;
Vue.use(auth);

new Vue({
  el: "#app",
  router,
  store,
  template: "<App/>",
  components: { App }
});
