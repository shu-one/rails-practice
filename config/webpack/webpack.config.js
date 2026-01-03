// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

const customConfig = {
  resolve: {
    extensions: ['.ts', '.tsx']
  },
  devServer: {
    allowedHosts: 'all'
  }
}

module.exports = merge(webpackConfig, customConfig)
