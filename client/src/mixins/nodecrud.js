import railsRoutes from "../router/railsRoutes";
import request from "superagent";

export default {
  created: function() {
    this.hello();
  },
  methods: {
    /**
     * Destroys a single node.
     */
    async nodeDelete(type) {
      const path = railsRoutes.getPath(type);
      const url = `${this.$store.apiHost}${path}`;//${node.id}`;

      console.log(url);

      // try {
      //   const response = await request.delete(url);
      //   console.log(`${type} deleted`, response.statusCode);
      // } catch (err) {
      //   console.error(err);
      // }
    }
  }
};
