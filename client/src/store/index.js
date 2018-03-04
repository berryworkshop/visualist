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
    events: []
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
    //   const url = `${context.rootState.apiUrl}/user_token`;
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
    async eventsFetch(context) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request.get(url);
        console.log("events fetched", response.statusCode);
        context.commit("eventsSet", JSON.parse(response.text).data);
      } catch (err) {
        console.error(err);
      }
    },
    async eventCreate(context, event) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request.post(url).send(event);
        console.log("event posted", response.statusCode);
        context.dispatch("eventsFetch");
      } catch (err) {
        console.error(err);
      }
    }
  }
});
