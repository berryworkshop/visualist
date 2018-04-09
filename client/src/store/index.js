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
    nodes: [],
    events: [],
    agents: [],
    people: [],
    organizations: [],
    pages: [],
    places: []
  },
  mutations: {
    nodesSet(state, arr) {
      state.nodes = arr;
    },
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
  },
  actions: {
    retainNodes(context, { label: label, nodes: nodes }) {
      context.commit(`${label.toLowerCase().pluralize()}Set`, nodes);
    }
  }
});
