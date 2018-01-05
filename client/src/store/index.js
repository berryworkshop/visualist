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
  },
  mutations: {
    pagesSet(state, pagesArray) {
      state.pages = pagesArray;
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
  },
});
