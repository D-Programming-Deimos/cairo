module deimos.cairo.svg;
/* cairo - a vector graphics library with display and print output
 *
 * cairo-svg.h
 *
 * Copyright © 2005 Emmanuel Pacaud <emmanuel.pacaud@univ-poitiers.fr>
 *
 * This library is free software; you can redistribute it and/or
 * modify it either under the terms of the GNU Lesser General Public
 * License version_ 2.1 as published by the Free Software Foundation
 * (the "LGPL") or, at your option, under the terms of the Mozilla
 * Public License Version 1.1 (the "MPL"). If you do not alter this
 * notice, a recipient may use your version_ of this file under either
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
 */

import deimos.cairo.cairo;
import deimos.cairo.features;

static if(CairoHasSVGSurface) {
    extern(System) {
        /**
         * CairoSVGVersion:
         * @CAIRO_SVG_VERSION_1_1: The version_ 1.1 of the SVG specification.
         * @CAIRO_SVG_VERSION_1_2: The version_ 1.2 of the SVG specification.
         *
         * #CairoSVGVersion is used to describe the version_ number of the SVG
         * specification that a generated SVG file will conform to.
         */
        enum CairoSVGVersion {
            _1_1,
            _1_2
        }

        cairo_surface_t * cairo_svg_surface_create (const char *filename, double width_in_points, double height_in_points);

        cairo_surface_t * cairo_svg_surface_create_for_stream (cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points);

        void cairo_svg_surface_restrict_to_version (cairo_surface_t *surface, CairoSVGVersion version_);

        void cairo_svg_get_versions (CairoSVGVersion const **versions, int *num_versions);

        const char * cairo_svg_version_to_string (CairoSVGVersion version_);
    }
} else {
    static assert(0, "Cairo was not compiled with support for the svg backend");
}
