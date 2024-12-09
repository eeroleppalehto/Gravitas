# Gravitas

This repository holds the source code for the Gravitas game a Nodejs server that distributes the game.

## Godot

The game uses Godot as its game engine so for you to start development on the game, you need to download the game engine to your own device.

[Download Godot](https://godotengine.org/download/macos/)

To start developing the game make sure pick the `gravitas` directory as the project path and not its parent directory `Gravitas`.

## Server

The server is done with Expressjs that distributes the game as static files

### Development

For development on your own machine download node v20.xx. The commads below assumes that the server directory is the current path.

To start the develoment server run the following command:

```bash
npm run dev
```

The styling for the HTML pages is done with Tailwind so to start the Tailwind service run the following command:

```bash
npm run watch
```
