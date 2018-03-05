import Vue from "vue";
import Vuex from "vuex";
import request from "superagent";
import railsRoutes from "../router/railsRoutes";
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
    // login(state, jwt) {
    //   state.user.jwt = jwt;
    // },
    // logout(state) {
    //   state.user = { jwt: "" };
    // },
    eventsSet(state, arr) {
      state.events = arr;
    }
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
    /**
     * Gets any set (of a single type, e.g. event) from the Rails API,
     * and commits/fills the respective state array with it.
     */
    async nodesFetch(context, { type: type }) {
      const path = railsRoutes.getPath(pluralize(type));
      const url = `${context.rootState.apiHost}${path}`;
      try {
        const response = await request.get(url);
        console.log(`${pluralize(type)} fetched`, response.statusCode);
        context.commit(`${pluralize(type)}Set`, JSON.parse(response.text).data);
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Creates a single node
     */
    async nodeCreate(context, { type: type, node: node }) {
      const path = railsRoutes.getPath(type);
      const url = `${context.rootState.apiHost}${path}`;
      try {
        const response = await request.post(url).send(node);
        console.log(`${type} posted`, response.statusCode);
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Destroys a single node.
     */
    async nodeDelete(context, { type: type, node: node }) {
      const path = railsRoutes.getPath(type);
      const url = `${context.rootState.apiHost}${path}${node.id}`;

      try {
        const response = await request.delete(url);
        console.log(`${type} deleted`, response.statusCode);
      } catch (err) {
        console.error(err);
      }
    }
  }
});
