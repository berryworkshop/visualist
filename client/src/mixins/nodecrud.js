import railsRoutes from "../router/railsRoutes";
import request from "superagent";
// eslint-disable-next-line
import utility from "../utility";

/**
 * All nodes, of all labels, share a single basic interface
 * BREAD (browse, read, edit, add, delete) signature, below.
 */
export default {
  methods: {
    /**
     * Gets a set of nodes.
     */
    async nodeBrowse(label) {
      const path = railsRoutes.getPath(label.toLowerCase().pluralize());
      const url = `${this.$store.state.apiHost}${path}`;

      try {
        const response = await request.get(url);
        console.log(`got ${label.pluralize()}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Gets a single node.
     */
    async nodeRead(node_id) {
      const path = railsRoutes.getPath("node");
      const url = `${this.$store.state.apiHost}${path}${node_id}`;
      try {
        const response = await request.get(url);
        const label = response.body.data.attributes.label;
        console.log(`got ${label}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err);
      }
    },
    /**
     * Updates an existing node, in part
     */
    async nodeEdit(node) {
      const path = railsRoutes.getPath("node");
      const label = node.attributes.label;
      const url = `${this.$store.state.apiHost}${path}${node.id}`;
      try {
        const response = await request.patch(url).send(node);
        console.log(`patched ${label}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err, label, path, url, JSON.parse(JSON.stringify(node)));
      }
    },
    /**
     * Creates a node.
     */
    async nodeAdd(node) {
      const path = railsRoutes.getPath("node");

      console.log(node);

      const label = node.attributes.label;
      const url = `${this.$store.state.apiHost}${path}`;
      try {
        const response = await request.post(url).send(node);
        console.log(`posted ${label}`, response.statusCode);
        return JSON.parse(response.text).data;
      } catch (err) {
        console.error(err, label, path, url, JSON.parse(JSON.stringify(node)));
      }
    },
    /**
     * Destroys a node.
     */
    async nodeDelete(node) {
      const path = railsRoutes.getPath("node");
      const label = node.attributes.label;
      const url = `${this.$store.state.apiHost}${path}${node.id}`;
      try {
        const response = await request.delete(url);
        console.log(`deleted ${label}`, response.statusCode);
        return response.text;
      } catch (err) {
        console.error(err);
      }
    }
  }
};
