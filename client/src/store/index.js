import Vue from "vue";
import Vuex from "vuex";

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
    nodes: []
  },
  mutations: {
    nodesSet(state, arr) {
      state.nodes = arr;
    }
  },
  actions: {
    retainNodes(context, nodes) {
      context.commit("nodesSet", nodes);
    }
  }
});
