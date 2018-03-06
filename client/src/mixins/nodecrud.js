import railsRoutes from "../router/railsRoutes";
import request from "superagent";
import { pluralize } from "../utility";

/**
 * All nodes, of all types, share a single basic interface
 * signature, below.
 */
export default {
  methods: {
    /**
     * Gets a set of nodes.
     */
    async nodesGet(type) {
      const path = railsRoutes.getPath(pluralize(type));
      const url = `${this.$store.state.apiHost}${path}`;
      try {
        const response = await request.get(url);
        console.log(`${pluralize(type)} fetched`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Gets a single node.
     */
    async nodeGet(type, node_id) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}${node_id}`;
      try {
        const response = await request.get(url);
        console.log(`${type} retrieved`, response.statusCode);
        return JSON.parse(response.text).data;
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
        return JSON.parse(response.text).data;
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
        return response.text;
      } catch (err) {
        console.error(err);
      }
    }
  }
};
