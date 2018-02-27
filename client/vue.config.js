resolve = require('path').resolve

module.exports = {
  configureWebpack: {
    output: {
      path: resolve('../public'),
      filename: 'js/[name].js'
    }
  }
}
