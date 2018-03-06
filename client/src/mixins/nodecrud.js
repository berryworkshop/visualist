import railsRoutes from "../router/railsRoutes";
import request from "superagent";
import { pluralize } from "../utility";

export default {
  methods: {
    /**
     * Gets (and stores) a set of nodes.
     */
    async nodesFetch(type) {
      const path = railsRoutes.getPath(pluralize(type));
      const url = `${this.$store.state.apiHost}${path}`;
      try {
        const response = await request.get(url);
        const json = JSON.parse(response.text).data;
        this.$store.dispatch("storeNodes", {
          type: "event",
          nodes: json
        });
        console.log(`${pluralize(type)} fetched`, response.statusCode);
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Creates a single node.
     */
    async nodeCreate(type, node) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}`;
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
    async nodeDelete(type, node) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}${node.id}`;
      try {
        const response = await request.delete(url);
        console.log(`${type} deleted`, response.statusCode);
      } catch (err) {
        console.error(err);
      }
    }
  }
};
