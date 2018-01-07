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
  },
  mutations: {
    pagesSet(state, arr) {
      state.pages = arr;
    },
    eventsSet(state, arr) {
      state.events = arr;
    },
  },
  actions: {
    async pagesFetch(context) {
      const url = `${context.rootState.apiUrl}/pages`;
      try {
        const response = await request.get(url);
        context.commit('pagesSet', JSON.parse(response.text).data);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
    async eventsFetch(context) {
      const url = `${context.rootState.apiUrl}/events`;
      try {
        const response = await request.get(url);
        context.commit('eventsSet', JSON.parse(response.text).data);
      } catch (err) {
        console.error(err); // eslint-disable-line no-console
      }
    },
  },
});
