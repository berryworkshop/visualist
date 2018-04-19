<template>
  <div id="node">
    <h1 class="display-4">{{ label }}: {{ result.data.attributes.title }}</h1>
    <div class="row">
      <div class="col-3">
        <img class="w-100 mb-3" src="http://via.placeholder.com/250" alt="Generic placeholder image">
        <div>
          <p>created: {{ created_at }}</p>
          <p>updated: {{ updated_at }}</p>
        </div>
      </div>
      <div class="col-9">
        <p v-if="result.data.attributes.body">{{ result.data.attributes.body }}</p>
        <p v-else><em>No body available.</em></p>
        <div>

          <ul v-if="predicates">
            <li v-for="p in predicates"
                :key="p">
              {{ p }}
              <ul>
                <li v-for="e in result.data.relationships.edges.data" :key="e.id">
                  {{ e.id }}
                </li>
              </ul>
            </li>
          </ul>

          <ul v-if="result.data.attributes.properties.websites">
            <li v-for="(s, index) in result.data.attributes.properties.websites"
                :key="index">
              <a :href="s.url">{{ s.url }}</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <nav class="controls">
      <router-link :to="{
          name: `${label.toLowerCase()}Edit`,
          params: {
            node_id: $route.params['node_id']
          }}">Edit {{ label }}</router-link>
      <router-link :to="{name: label.toLowerCase().pluralize()}">Browse {{ label.pluralize() }}</router-link>
    </nav>
  </div>
</template>

<script>
import moment from "moment";
import Layout from "../layouts/Default";
import nodecrud from "../../mixins/nodecrud";
// eslint-disable-next-line
import utility from "../../utility";

export default {
  name: "Node",
  components: {
    Layout
  },
  mixins: [nodecrud],
  props: {
    label: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      result: {
        data: {
          attributes: {
            properties: {}
          },
          relationships: {
            edges: {
              data: []
            },
            edges_inverted: {
              data: []
            }
          }
        },
        included: []
      }
    };
  },
  computed: {
    created_at() {
      return moment(this.result.data.attributes.created_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    },
    updated_at() {
      return moment(this.result.data.attributes.updated_at).format(
        "dddd, MMMM Do YYYY, h:mm:ss a"
      );
    },
    predicates() {
      return this.result.included.reduce((a, b) => {
        const p = b.attributes.predicate;
        return a.includes(p) ? a : a.concat(p);
      }, []);
    }
  },
  async created() {
    try {
      const node_id = this.$route.params["node_id"];
      this.result = await this.nodeRead(node_id);
    } catch (error) {
      console.error(error);
    }
  },
  methods: {
    getEdgeById(id) {
      return this.result.included.find(n => n.attributes.id === id);
    }
  }
};
</script>
