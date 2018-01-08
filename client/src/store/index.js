import Vue from 'vue';
import Vuex from 'vuex';
import request from 'superagent';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    apiUrl: (() => {
      const protocol = window.location.protocol;
      const hostname = window.location.hostname;
      const port = process.env.NODE_ENV === 'development' ? 3000 : window.location.port;
      return `${protocol}//${hostname}:${port}`;
    })(),
    pages: [],
    events: [],
    user: {
      jwt: '',
    },
  },
  mutations: {
    login(state, jwt) {
      state.user.jwt = jwt;
    },
    logout(state) {
      state.user = { jwt: '' };
    },
    pagesSet(state, arr) {
      state.pages = arr;
    },
    eventsSet(state, arr) {
      state.events = arr;
    },
  },
  getters: {
    loggedIn(state) {
      if (state.user.jwt && state.user.jwt.length > 0) {
        return true;
      }
      return false;
    },
  },
  actions: {
    async login(context, user) {
      // user: {email: 'lebowski@example.com', password: 'p455w0rd'}
      const url = `${context.rootState.apiUrl}/user_token`;
      try {
        const response = await request.post(url)
          .set('Content-Type', 'application/json')
          .send({
            auth: {
              email: user.email,
              password: user.password,
            },
          });
        const res = JSON.parse(response.text);
        context.commit('login', res.jwt);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    async logout(context) {
      context.commit('logout');
    },
    async pagesFetch(context) {
      const url = `${context.rootState.apiUrl}/pages`;
      try {
        const response = await request.get(url)
          .set('Authorization', context.rootState.user.jwt);
        context.commit('pagesSet', JSON.parse(response.text).data);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    async eventsFetch(context) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request.get(url)
          .set('Authorization', context.rootState.user.jwt);
        context.commit('eventsSet', JSON.parse(response.text).data);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    // async eventCreate(context) {
    //   const url = `${context.rootState.apiUrl}/events`;
    //   try {
    //     const response = await request.post(url)

    //       .set('Authorization', context.rootState.user.jwt);
    //     eventsFetch(context);
    //     // context.commit('eventsSet', JSON.parse(response.text).data);
    //   } catch (err) {
    //     console.error(err); // eslint-disable-line no-console
    //   }
    // },
  },
});
