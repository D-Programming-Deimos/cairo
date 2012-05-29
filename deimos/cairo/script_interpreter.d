module deimos.cairo.script_interpreter;
/* cairo - a vector graphics library with display and print output
 *
 * Copyright © 2008 Chris Wilson
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

extern(System) {

    struct cairo_script_interpreter_t;

    /* XXX expose csi_dictionary_t and pass to hooks */
    alias void function(void *closure, void *ptr) csi_destroy_func_t;

    alias cairo_surface_t * function (void *closure, cairo_content_t content, double width, double height, long uid) csi_surface_create_func_t;
    alias cairo_t *  function(void *closure, cairo_surface_t *surface) csi_context_create_func_t;
    alias void function(void *closure, cairo_t *cr) csi_show_page_func_t;

    alias void function(void *closure, cairo_t *cr) csi_copy_page_func_t;

    struct cairo_script_interpreter_hooks_t{
        void *closure;
        csi_surface_create_func_t surface_create;
        csi_destroy_func_t surface_destroy;
        csi_context_create_func_t context_create;
        csi_destroy_func_t context_destroy;
        csi_show_page_func_t show_page;
        csi_copy_page_func_t copy_page;
    } ;

    cairo_script_interpreter_t * cairo_script_interpreter_create (void);

    void cairo_script_interpreter_install_hooks (cairo_script_interpreter_t *ctx, const cairo_script_interpreter_hooks_t *hooks);

    CairoStatus cairo_script_interpreter_run (cairo_script_interpreter_t *ctx, const char *filename);

    CairoStatus cairo_script_interpreter_feed_stream (cairo_script_interpreter_t *ctx, FILE *stream);

    CairoStatus cairo_script_interpreter_feed_string (cairo_script_interpreter_t *ctx, const char *line, int len);

    uint cairo_script_interpreter_get_line_number (cairo_script_interpreter_t *ctx);

    cairo_script_interpreter_t * cairo_script_interpreter_reference (cairo_script_interpreter_t *ctx);

    CairoStatus cairo_script_interpreter_finish (cairo_script_interpreter_t *ctx);

    CairoStatus cairo_script_interpreter_destroy (cairo_script_interpreter_t *ctx);

    CairoStatus cairo_script_interpreter_translate_stream (FILE *stream, cairo_write_func_t write_func, void *closure);

}
