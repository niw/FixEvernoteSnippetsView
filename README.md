Fix Evernote Snippets View
==========================

_Evernote.app 7.1 (456449) addressed this issue._

A dynamic link library that patches [Evernote](https://evernote.com/) snippets view that seems having a wrong configuration, which causes this strange effects.

![Strange effects](https://user-images.githubusercontent.com/13096/37389861-24d95a00-2723-11e8-80aa-64cec65e362e.gif)

Usage
-----

Launch Evernote with injecting this dynamic link library using `DYLD_INSERT_LIBRARIES`. Simply using `make` to do so. It requires Xcode.

    make

See `Makefile` and `dyld(1)` for the details.

It’s also possible to make a scripting addition to inject the patch, but I prefer to ask Evernote insiders to fix this.
