# Raylib (Odin) Base Template

This is a raylib library game development template which includes such features as:

* Initialization of memory tracking to help find memory leaks.
* Initialization of a Raylib window with VSYNC turned on.
* Delta Time calculations (default set to 60 FPS). This also calculates a "delta time blend" which is used for smoother
    calculation of different objects for a game.
* Basic constants for window width and height as well as target FPS.

Other than the above preferences, this template doesn't attempt to dictate how a game should be written, optimized or
what type of build system should be used to package the game.

It also includes configuration files for the [Odin Language Server](https://github.com/DanielGavin/ols).
