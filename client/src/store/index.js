import Vue from "vue";
import Vuex from "vuex";
import request from "superagent";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    apiUrl: (() => {
      const protocol = window.location.protocol;
      const hostname = window.location.hostname;
      const port =
        // eslint-disable-next-line no-undef
        process.env.NODE_ENV === "development" ? 3000 : window.location.port;
      return `${protocol}//${hostname}:${port}`;
    })(),
    events: [],
    user: {
      jwt: ""
    }
  },
  mutations: {
    login(state, jwt) {
      state.user.jwt = jwt;
    },
    logout(state) {
      state.user = { jwt: "" };
    },
    eventsSet(state, arr) {
      state.events = arr;
    }
  },
  getters: {
    loggedIn(state) {
      if (state.user.jwt && state.user.jwt.length > 0) {
        return true;
      }
      return false;
    }
  },
  actions: {
    async login(context, user) {
      // user: {email: 'lebowski@example.com', password: 'p455w0rd'}
      const url = `${context.rootState.apiUrl}/user_token`;
      try {
        const response = await request
          .post(url)
          .set("Content-Type", "application/json")
          .send({
            auth: {
              email: user.email,
              password: user.password
            }
          });
        const res = JSON.parse(response.text);
        context.commit("login", res.jwt);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    async logout(context) {
      context.commit("logout");
    },
    async eventsFetch(context) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request
          .get(url)
          .set("Content-Type", "application/vnd.api+json")
          .set("Authorization", context.rootState.user.jwt);
        console.log("events fetched", response.statusCode); // eslint-disable-line no-console
        context.commit("eventsSet", JSON.parse(response.text).data);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    async eventCreate(context, event) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request
          .post(url)
          .send({
            data: event
          })
          .set("Content-Type", "application/vnd.api+json")
          .set("Accept", "application/vnd.api+json")
          .set("Authorization", context.rootState.user.jwt);
        console.log("event posted", response.statusCode); // eslint-disable-line no-console
        context.dispatch("eventsFetch");
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    }
  }
});
