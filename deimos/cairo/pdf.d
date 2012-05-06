module deimos.cairo.pdf;
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

static if(CairoHasPdfSurface) {
    extern(System) {
        /**
         * CairoPdfVersion:
         * @CAIRO_PDF_VERSION_1_4: The version 1.4 of the PDF specification.
         * @CAIRO_PDF_VERSION_1_5: The version 1.5 of the PDF specification.
         *
         * #CairoPdfVersion is used to describe the version number of the PDF
         * specification that a generated PDF file will conform to.
         *
         * Since 1.10
         */
        enum CairoPdfVersion {
            _1_4,
            _1_5
        }


        cairo_surface_t * cairo_pdf_surface_create (const char *filename, double width_in_points, double height_in_points);

        cairo_surface_t * cairo_pdf_surface_create_for_stream (cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points);

        void cairo_pdf_surface_restrict_to_version (cairo_surface_t *surface, CairoPdfVersion version_);

        void cairo_pdf_get_versions (const(CairoPdfVersion) **versions, int *num_versions);

        const(char*) CairoPdfVersiono_string (CairoPdfVersion version_);

        void cairo_pdf_surface_set_size (cairo_surface_t *surface, double width_in_points, double height_in_points);
    }
} else {
    static assert(0, "Cairo was not compiled with support for the pdf backend");
}
