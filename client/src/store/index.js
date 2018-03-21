import Vue from "vue";
import Vuex from "vuex";
// import request from "superagent";
// import railsRoutes from "../router/railsRoutes";

// eslint-disable-next-line
import utility from "../utility";

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
    people: [],
    organizations: [],
    pages: [],
    places: []
    // user: {
    //   jwt: ""
    // }
  },
  mutations: {
    eventsSet(state, arr) {
      state.events = arr;
    },
    agentsSet(state, arr) {
      state.agents = arr;
    },
    peopleSet(state, arr) {
      state.people = arr;
    },
    organizationsSet(state, arr) {
      state.organizations = arr;
    },
    placesSet(state, arr) {
      state.places = arr;
    },
    pagesSet(state, arr) {
      state.pages = arr;
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
    async retainNodes(context, { label: label, nodes: nodes }) {
      context.commit(`${label.toLowerCase().pluralize()}Set`, nodes);
    }
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
