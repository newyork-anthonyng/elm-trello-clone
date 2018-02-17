const path = require("path");

module.exports = {
  context: path.join(__dirname, "src"),

  entry: "./index.js",

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "bundle.js",
  },

  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          "style-loader",
          "css-loader"
        ]
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: "file-loader?name=[name].[ext]"
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack-loader?verbose=true&warn=true"
      }
    ],

    noParse: /\.elm$/
  },

  devServer: {
    inline: true,
    stats: {
      colors: true
    }
  }
};
