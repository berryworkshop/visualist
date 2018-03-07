import railsRoutes from "../router/railsRoutes";
import request from "superagent";
import { pluralize } from "../utility";

/**
 * All nodes, of all types, share a single basic interface
 * BREAD (browse, read, edit, add, delete) signature, below.
 */
export default {
  methods: {
    /**
     * Gets a set of nodes.
     */
    async nodeBrowse(type) {
      const path = railsRoutes.getPath(pluralize(type));
      const url = `${this.$store.state.apiHost}${path}`;
      try {
        const response = await request.get(url);
        console.log(`got ${pluralize(type)}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Gets a single node.
     */
    async nodeRead(type, node_id) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}${node_id}`;
      try {
        const response = await request.get(url);
        console.log(`got ${type}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Updates an existing node, in part
     */
    async nodeEdit(type, node) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}${node.id}`;
      try {
        const response = await request.patch(url).send(node);
        console.log(`patched ${type}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Creates a node.
     */
    async nodeAdd(type, node) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}`;
      try {
        const response = await request.post(url).send(node);
        console.log(`posted ${type}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Destroys a node.
     */
    async nodeDelete(type, node) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.state.apiHost}${path}${node.id}`;
      try {
        const response = await request.delete(url);
        console.log(`deleted ${type}`, response.statusCode);
        return response.text;
      } catch (err) {
        console.error(err);
      }
    }
  }
};
