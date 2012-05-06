module example;

import deimos.cairo.cairo;

void main() {
    cairo_surface_t *surface;
    cairo_t *cr;

    surface = cairo_image_surface_create (CairoFormat.ARGB32, 120, 120);
    cr = cairo_create (surface);

    cairo_set_line_width (cr, 0.1);
    cairo_set_source_rgb (cr, 0, 0, 0);
    cairo_rectangle (cr, 0.25, 0.25, 0.5, 0.5);
    cairo_stroke (cr);

    cairo_set_source_rgb (cr, 0, 0, 0);
    cairo_rectangle (cr, 0.25, 0.25, 0.5, 0.5);
    cairo_fill (cr);

    cairo_select_font_face (cr, "serif", CairoFontSlant.Normal, CairoFontWeight.Bold);
    cairo_set_font_size (cr, 32.0);
    cairo_set_source_rgb (cr, 0.0, 0.0, 1.0);
    cairo_move_to (cr, 10.0, 50.0);
    cairo_show_text (cr, "Hello, world");

    cairo_destroy(cr);
    cairo_surface_write_to_png(surface, "test");
    cairo_surface_destroy(surface);
}
