/* eslint-disable */
const resolve = require("path").resolve;

module.exports = {
  compiler: true,
  configureWebpack: config => {
    if (process.env.NODE_ENV === "production") {
      return {
        output: {
          path: resolve("../public"),
          filename: "js/[name].js"
        }
      };
    } else {
      // mutate for development...
    }
  }
};
