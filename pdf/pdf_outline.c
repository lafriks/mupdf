#include "fitz.h"
#include "mupdf.h"

static fz_outline *
pdf_load_outline_imp(pdf_xref *xref, fz_obj *dict)
{
	pdf_link *link;
	fz_outline *node;
	fz_obj *obj;
	/* SumatraPDF: prevent potential stack overflow */
	fz_outline *prev, *root = NULL;
	fz_obj *origDict = dict;
	fz_context *ctx = xref->ctx;

	if (fz_is_null(ctx, dict))
		return NULL;

	/* SumatraPDF: prevent cyclic outlines */
	do
	{
		if (fz_dict_gets(ctx, dict, ".seen"))
			break;
		obj = fz_new_null(ctx);
		fz_dict_puts(ctx, dict, ".seen", obj);
		fz_drop_obj(ctx, obj);

		node = fz_malloc(ctx, sizeof(fz_outline));
		node->title = NULL;
		node->page = -1;
		node->down = NULL;
		node->next = NULL;

		obj = fz_dict_gets(ctx, dict, "Title");
		if (obj)
			node->title = pdf_to_utf8(ctx, obj);

		/* SumatraPDF: support expansion states */
		node->is_open = fz_to_int(ctx, fz_dict_gets(ctx, dict, "Count")) >= 0;
		/* SumatraPDF: extended outline actions */
		node->data = node->free_data = NULL;

		if (fz_dict_gets(ctx, dict, "Dest") || fz_dict_gets(ctx, dict, "A"))
		{
			link = pdf_load_link(xref, dict);
			if (link) /* SumatraPDF: don't crash if it's no link after all */
			{
				if (link->kind == PDF_LINK_GOTO)
					node->page = pdf_find_page_number(xref, fz_array_get(ctx, link->dest, 0));
				/* SumatraPDF: extended outline actions */
				node->data = link;
				node->free_data = pdf_free_link;
			}
		}

		obj = fz_dict_gets(ctx, dict, "First");
		if (obj)
			node->down = pdf_load_outline_imp(xref, obj);

		/* SumatraPDF: prevent potential stack overflow */
		if (!root)
			prev = root = node;
		else
			prev = prev->next = node;
	
		dict = fz_dict_gets(ctx, dict, "Next");
	} while (dict && !fz_is_null(ctx, dict));
	node = root;
	/* SumatraPDF: prevent cyclic outlines */
	for (dict = origDict; dict && fz_dict_gets(ctx, dict, ".seen"); dict = fz_dict_gets(ctx, dict, "Next"))
		fz_dict_dels(ctx, dict, ".seen");

	return node;
}

fz_outline *
pdf_load_outline(pdf_xref *xref)
{
	fz_obj *root, *obj, *first;
	fz_context *ctx = xref->ctx;

	root = fz_dict_gets(ctx, xref->trailer, "Root");
	obj = fz_dict_gets(ctx, root, "Outlines");
	first = fz_dict_gets(ctx, obj, "First");
	if (first)
		return pdf_load_outline_imp(xref, first);

	return NULL;
}
