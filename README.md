# Andgate's Blog

This is the source code for my blog. This is a static site generated with hakyll.

# Building

The site can be build with

```
> nix-shell
> cabal new-run site -- build
```

This will produce the directories `_cache` and `_site`.