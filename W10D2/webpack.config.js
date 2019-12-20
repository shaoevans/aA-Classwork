var path = require('path');

module.exports = {
  entry: './frontend/entry.jsx',
  output: {
    filename: './bundle.js',
    path: path.resolve(__dirname)
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/env', '@babel/react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};

// npm init -y
// npm install a b c d 
// npm install -D webpack-cli
// create webpack.config.js
// copy and pageXOffset
// change the output path to path.resolve(__dirname)
// create frontend directory/ entry file
// create gitignore