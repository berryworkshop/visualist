import Vue from 'vue';
import Vuex from 'vuex';
import request from 'superagent';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    pages: {},
  },
  mutations: {
    getPages(state) {
      request
        .get('http://localhost:3000/api/pages')
        .end((err, res) => {
          state.pages = JSON.parse(res.text);
        });
    },
  },
});
