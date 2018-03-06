import Vue from "vue";
import Vuex from "vuex";
// import request from "superagent";
// import railsRoutes from "../router/railsRoutes";
import { pluralize } from "../utility";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    apiHost: (() => {
      const protocol = window.location.protocol;
      const hostname = window.location.hostname;
      const port =
        // eslint-disable-next-line no-undef
        process.env.NODE_ENV === "development" ? 3000 : window.location.port;
      return `${protocol}//${hostname}:${port}`;
    })(),
    events: [],
    agents: [],
    pages: [],
    places: []
    // user: {
    //   jwt: ""
    // }
  },
  mutations: {
    eventsSet(state, arr) {
      state.events = arr;
    }
    // login(state, jwt) {
    //   state.user.jwt = jwt;
    // },
    // logout(state) {
    //   state.user = { jwt: "" };
    // },
  },
  getters: {
    // loggedIn(state) {
    //   if (state.user.jwt && state.user.jwt.length > 0) {
    //     return true;
    //   }
    //   return false;
    // }
  },
  actions: {
    async storeNodes(context, { type: type, nodes: nodes }) {
      context.commit(`${pluralize(type)}Set`, nodes);
    },
    // async login(context, user) {
    //   // user: {email: 'lebowski@example.com', password: 'p455w0rd'}
    //   const url = `${context.rootState.apiHost}/user_token`;
    //   try {
    //     const response = await request
    //       .post(url)
    //       .set("Content-Type", "application/json")
    //       .send({
    //         auth: {
    //           email: user.email,
    //           password: user.password
    //         }
    //       });
    //     const res = JSON.parse(response.text);
    //     context.commit("login", res.jwt);
    //   } catch (err) {
    //     console.error(err);
    //   }
    // },
    // async logout(context) {
    //   context.commit("logout");
    // },
  }
});
