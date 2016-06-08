module deimos.cairo.ps;
/* cairo - a vector graphics library with display and print output
 *
 * Copyright © 2002 University of Southern California
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
 */

import deimos.cairo.cairo;
import deimos.cairo.features;

static if(CairoHasPSSurface) {
    extern(System) {
        /**
         * cairo_ps_level_t:
         * @CAIRO_PS_LEVEL_2: The language level 2 of the PostScript specification.
         * @CAIRO_PS_LEVEL_3: The language level 3 of the PostScript specification.
         *
         * #cairo_ps_level_t is used to describe the language level of the
         * PostScript Language Reference that a generated PostScript file will
         * conform to.
         */
        enum CairoPSLevel {
            _2,
            _3
        }

        cairo_surface_t * cairo_ps_surface_create (const char *filename, double width_in_points, double height_in_points);
        cairo_surface_t * cairo_ps_surface_create_for_stream (cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points);

        void cairo_ps_surface_restrict_to_level (cairo_surface_t *surface, CairoPSLevel level);
        void cairo_ps_get_levels (const(CairoPSLevel) **levels, int *num_levels);

        const(char) * cairo_ps_level_to_string (CairoPSLevel level);

        void cairo_ps_surface_set_eps (cairo_surface_t *surface, cairo_bool_t eps);
        cairo_bool_t cairo_ps_surface_get_eps (cairo_surface_t *surface);

        void cairo_ps_surface_set_size (cairo_surface_t *surface, double width_in_points, double height_in_points);

        void cairo_ps_surface_dsc_comment (cairo_surface_t *surface, const char *comment);

        void cairo_ps_surface_dsc_begin_setup (cairo_surface_t *surface);

        void cairo_ps_surface_dsc_begin_page_setup (cairo_surface_t *surface);

    }
} else {
    static assert(0, "Error: Cairo was not compiled with support for the ps backend");
}
