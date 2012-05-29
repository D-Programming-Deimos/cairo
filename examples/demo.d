
import deimos.cairo.cairo;
import deimos.cairo.svg;
import std.string;

enum M_PI = 3.14159265358979323846;


void draw_text(cairo_t* cr, string text, double x, double y)
{
	// save the state of the context:
	cairo_save(cr);

	// draw black text
	cairo_set_source_rgb(cr, 0, 0, 0);
	cairo_select_font_face (cr, "Sans", CairoFontSlant.Normal, CairoFontWeight.Bold);
	cairo_set_font_size (cr, 20.0);
	cairo_move_to(cr, x, y);
	cairo_show_text(cr, toStringz(text));

	cairo_restore(cr);
}

void demo()
{
	cairo_surface_t *surface;
	cairo_t *cr;
	cairo_pattern_t *pat;

	auto width = 256.0;
	auto height = 256.0;
	surface = cairo_svg_surface_create("demo.svg", width, height);
	cr = cairo_create(surface);

	/* from http://cairographics.org/samples/ */
	pat = cairo_pattern_create_linear (0.0, 0.0,  0.0, height);
	cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1);
	cairo_pattern_add_color_stop_rgba (pat, 0, 1, 1, 1, 1);
	cairo_rectangle (cr, 0, 0, 256, 256);
	cairo_set_source (cr, pat);
	cairo_fill (cr);
	cairo_pattern_destroy (pat);

	auto half = height/2;
	pat = cairo_pattern_create_radial (115.2, 102.4, 25.6, 102.4, 102.4, height/2);
	cairo_pattern_add_color_stop_rgba (pat, 0, 1, 1, 1, 1);
	cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1);
	cairo_set_source (cr, pat);
	cairo_arc (cr, half, half, 76.8, 0, 2 * M_PI);
	cairo_fill (cr);
	cairo_pattern_destroy (pat);

	draw_text(cr, "hello svg", 80, half);

	cairo_destroy(cr);
	cairo_show_page(cr);
	cairo_surface_destroy(surface);
}

void main()
{
	demo();
}

