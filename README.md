cairo
=====

Cairo is a 2D graphics library with support for multiple output devices. Currently supported output
targets include the X Window System (via both Xlib and XCB), Quartz, Win32, image buffers,
PostScript, PDF, and SVG file output. Experimental backends include OpenGL, BeOS, OS/2, and
DirectFB.

Alterations to Original interface
---------------------------------

Enums have been renamed to allow for a more sane invocation. The enum types have been camel-cased
and the members have been shortened appropriately. If shortening the name would result in a syntax
error (such as it shortening to `1_2`) then an underscore is added to the beginning.

D-specific keywords have an `_` appended to the name to prevent syntax errors.

Limitations
-----------

Currently many surfaces are un-implemented, all planned surfaces are in the `c/` directory, supported
ones are listed in the `deimos/cairo/` directory.

Some existing bindings are unsupported due to a lack of complementary bindings to other libraries.

The features list is currently just set to a common set, you will have to manually edit this to suit
your needs. This will later be replaced with an script that automatically generated the list from
your existing Cairo install.

Dependencies
------------

The basic usage has no dependencies, however some of the backends have dependencies that require you
to have other deimos bindings installed.

* The Xlib and XRender surfaces require `deimos.X11`.
