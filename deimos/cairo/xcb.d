module deimos.cairo.xcb;
/* cairo - a vector graphics library with display and print output
 *
 * Copyright © 2002 University of Southern California
 * Copyright © 2009 Intel Corporation
 *
 * This library is free software; you can redistribute it and/or
 * modify it either under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 * (the "LGPL") or, at your option, under the terms of the Mozilla
 * Public License Version 1.1 (the "MPL"). If you do not alter this
 * notice, a recipient may use your version of this file under either
 * the MPL or the LGPL.
 *
 * You should have received a copy of the LGPL along with this library
 * in the file COPYING-LGPL-2.1; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA 02110-1335, USA
 * You should have received a copy of the MPL along with this library
 * in the file COPYING-MPL-1.1
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
 * OF ANY KIND, either express or implied. See the LGPL or the MPL for
 * the specific language governing rights and limitations.
 *
 * The Original Code is the cairo graphics library.
 *
 * The Initial Developer of the Original Code is University of Southern
 * California.
 *
 * Contributor(s):
 *	Carl D. Worth <cworth@cworth.org>
 *	Chris Wilson <chris@chris-wilson.co.uk>
 */

import deimos.cairo.cairo;
import deimos.cairo.features;

static if (CairoHasXCBSurface) {
    static assert(0, "XCB support to be implemented, requires deimos.xcb");
    extern(System) {
        cairo_surface_t * cairo_xcb_surface_create (xcb_connection_t *connection, xcb_drawable_t drawable, xcb_visualtype_t *visual, int width, int height);

        cairo_surface_t * cairo_xcb_surface_create_for_bitmap (xcb_connection_t *connection, xcb_screen_t *screen, xcb_pixmap_t bitmap, int width, int height);

        cairo_surface_t * cairo_xcb_surface_create_with_xrender_format (xcb_connection_t *connection, xcb_screen_t *screen, xcb_drawable_t drawable, xcb_render_pictforminfo_t *format, int width, int height);

        void cairo_xcb_surface_set_size (cairo_surface_t *surface, int width, int height);

        void cairo_xcb_surface_set_drawable (cairo_surface_t *surface, xcb_drawable_t drawable, int width, int height);

        xcb_connection_t * cairo_xcb_device_get_connection (cairo_device_t *device);

        /* debug interface */

        void cairo_xcb_device_debug_cap_xshm_version (cairo_device_t *device, int major_version, int minor_version);

        void cairo_xcb_device_debug_cap_xrender_version (cairo_device_t *device, int major_version, int minor_version);

        /*
         * @precision: -1 implies automatically choose based on antialiasing mode,
         *            any other value overrides and sets the corresponding PolyMode.
         */
        void cairo_xcb_device_debug_set_precision (cairo_device_t *device, int precision);

        int cairo_xcb_device_debug_get_precision (cairo_device_t *device);
    }
} else {
    static assert(0, "Cairo was not compiled with support for the XCB backend");
}
