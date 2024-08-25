# Hugo theme Hermit-Dracula

This is a fork of [the Hermit Hugo theme](https://github.com/Track3/hermit) with
[Dracula color scheme](https://github.com/dracula/dracula-theme) applied.

## Installation

First, clone this repo into your `themes` directory:

```sh
# If your Hugo site doesn't use Git:
$ git clone https://github.com/dotandl/hermit-dracula.git themes/hermit-dracula
# If your Hugo site used Git:
$ git submodule add https://github.com/dotandl/hermit-dracula.git themes/hermit-dracula
```

Then update your `config.toml`:

```toml
# ...
theme = "hermit-dracula"
# ...
```

## Configuration/Documentation

In `exampleSite` directory you can find an example Hugo site using
`Hermit-Dracula` with configuration.

More details can be found in
[the original project's repository](https://github.com/Track3/hermit).

## Example site

Example site can be run with:

```sh
$ cd exampleSite/
$ hugo server --themesDir ../../
```

## TODO

- [ ] Add some screenshots to `README.md`

## Acknowledgments

- [normalize.css](https://necolas.github.io/normalize.css/) - [MIT](https://github.com/necolas/normalize.css/blob/master/LICENSE.md)
- [animate.css](https://daneden.github.io/animate.css/) - [MIT](https://github.com/daneden/animate.css/blob/master/LICENSE)
- [feather](https://feathericons.com/) - [MIT](https://github.com/feathericons/feather/blob/master/LICENSE)
- [code-copy.js](assets/js/code-copy.js) - [Tom Spencer](https://www.fiznool.com/blog/2018/09/14/adding-click-to-copy-buttons-to-a-hugo-powered-blog/)

And, of course, author of
[the original Hermit theme](https://github.com/Track3/hermit) - [Track3](https://github.com/Track3).

Thanks!
