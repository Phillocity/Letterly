// Preventing Babel from transpiling NodeModules packages
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
})
)
environment.loaders.delete('nodeModules');
module.exports = environment
