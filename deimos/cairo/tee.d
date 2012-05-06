module deimos.cairo.tee;
/* cairo - a vector graphics library with display and print output
 *
 * Copyright © 2009 Chris Wilson
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
 * The Initial Developer of the Original Code is Chris Wilson
 *
 * Contributor(s):
 *	Chris Wilson <chris@chris-wilson.co.uk>
 */

import deimos.cairo.cairo;
import deimos.cairo.features;

static if(CairoHasTEESurface) {
    extern(System) {

        cairo_surface_t * cairo_tee_surface_create (cairo_surface_t *master);

        void cairo_tee_surface_add (cairo_surface_t *surface, cairo_surface_t *target);

        void cairo_tee_surface_remove (cairo_surface_t *surface, cairo_surface_t *target);

        cairo_surface_t * cairo_tee_surface_index (cairo_surface_t *surface, unsigned int index);
    }
} else {
    static assert(0, "Error: Cairo was not compiled with support for the TEE backend");
}
