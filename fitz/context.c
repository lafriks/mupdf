#include "fitz.h"
#include "except.h"

void fz_context_fin(fz_context *ctx)
{
	assert(ctx != NULL);

	/* Other finalisation calls go here (in reverse order) */
#ifndef SKIP_FONT_CONTEXT
	fz_free_font_context(ctx);
#endif
	fz_except_fin(ctx);
	/* Free the context itself */
	ctx->alloc->free(ctx->alloc->opaque, ctx);
	/* We do NOT free the allocator! */
}

fz_obj *fz_resolve_indirect_null(fz_obj *ref)
{
	return ref;
}

fz_context *fz_context_init(fz_alloc_context *alloc)
{
	fz_context *ctx;
	fz_error error;

	assert(alloc != NULL);
	ctx = alloc->calloc(alloc->opaque, 1, sizeof(fz_context));
	if (ctx == NULL)
		return NULL;
	ctx->alloc = alloc;

	error = fz_except_init(ctx);
	if (error != fz_okay)
		goto cleanup;
	ctx->fz_resolve_indirect = fz_resolve_indirect_null;

	ctx->error_count = 0;
	ctx->warn_count = 0;
#ifndef SKIP_FONT_CONTEXT
	fz_new_font_context(ctx);
#else
	ctx->ft = NULL;
#endif

#ifndef AA_BITS
	/* Anti-aliasing */
	ctx->fz_aa_hscale = 17;
	ctx->fz_aa_vscale = 15;
	ctx->fz_aa_scale = 256;
	ctx->fz_aa_level = 8;
#endif

	/* New initialisation calls for context entries go here */
	return ctx;
  cleanup:
	fz_context_fin(ctx);
	fz_error_handle(ctx, error, "fz_context_init failed");
	return NULL;
}

fz_context *fz_context_clone(fz_context *ctx)
{
	fz_context *clone;
	fz_error error;

	clone = ctx->alloc->calloc(ctx->alloc->opaque, 1, sizeof(*clone));
	if (clone == NULL)
		return NULL;
	clone->alloc = ctx->alloc;
	error = fz_except_init(ctx);
	if (error != fz_okay)
		goto cleanup;

	/* Do not clone warnings and error messages */
	clone->error_count = 0;
	clone->warn_count = 0;

#ifndef SKIP_FONT_CONTEXT
	fz_new_font_context(clone);
#else
	ctx->ft = NULL;
#endif

#ifndef AA_BITS
	/* Anti-aliasing */
	clone->fz_aa_hscale = ctx->fz_aa_hscale;
	clone->fz_aa_vscale = ctx->fz_aa_vscale;
	clone->fz_aa_scale = ctx->fz_aa_scale;
	clone->fz_aa_level = ctx->fz_aa_level;
#endif

	/* Other initialisations go here; either a copy (probably refcounted)
	 * or a new initialisation. */
	return clone;
  cleanup:
	fz_context_fin(ctx);
	fz_error_handle(ctx, error, "fz_context_clone failed");
	return NULL;
}
