var path = require('path')

module.exports = {
  entry: './app/index.js',
  output: {
    path: __dirname,
    filename: 'public/bundle.js'
  },
  module: {
    loaders: [
    {
      test: /\.js$/,
      loader: 'babel-loader',
      exclude: /node-modules/,
      query: {
        presets: ['es2015']
      }
    },
    {
      test: /\.tag$/,
      loader: 'tag',
      exclude: /node-modules/,
    },
    ]
  }
}
