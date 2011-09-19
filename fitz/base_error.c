#include "fitz.h"

void fz_flush_warnings(fz_context *ctx)
{
	if (ctx->warn_count > 1)
		fprintf(stderr, "warning: ... repeated %d times ...\n", ctx->warn_count);
	ctx->warn_message[0] = 0;
	ctx->warn_count = 0;
}

void fz_warn(fz_context *ctx, char *fmt, ...)
{
	va_list ap;
	char buf[FZ_ERR_LINE_LEN];

	va_start(ap, fmt);
	vsnprintf(buf, sizeof buf, fmt, ap);
	va_end(ap);

	if (!strcmp(buf, ctx->warn_message))
	{
		ctx->warn_count++;
	}
	else
	{
		fz_flush_warnings(ctx);
		fprintf(stderr, "warning: %s\n", buf);
		fz_strlcpy(ctx->warn_message, buf, sizeof ctx->warn_message);
		ctx->warn_count = 1;
	}
}

static void
fz_emit_error(fz_context *ctx, char what, char *location, char *message)
{
	fz_flush_warnings(ctx);

	fprintf(stderr, "%c %s%s\n", what, location, message);

	if (ctx->error_count < FZ_ERR_LINE_COUNT)
	{
		fz_strlcpy(ctx->error_message[ctx->error_count], location, FZ_ERR_LINE_LEN);
		fz_strlcat(ctx->error_message[ctx->error_count], message, FZ_ERR_LINE_LEN);
		ctx->error_count++;
	}
}

int
fz_get_error_count(fz_context *ctx)
{
	return ctx->error_count;
}

char *
fz_get_error_line(fz_context *ctx, int n)
{
	return ctx->error_message[n];
}

fz_error
fz_error_make_imp(fz_context *ctx, const char *file, int line, const char *func, char *fmt, ...)
{
	va_list ap;
	char one[FZ_ERR_LINE_LEN], two[FZ_ERR_LINE_LEN];

	ctx->error_count = 0;

	snprintf(one, sizeof one, "%s:%d: %s(): ", file, line, func);
	va_start(ap, fmt);
	vsnprintf(two, sizeof two, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '+', one, two);

	return -1;
}

fz_error
fz_error_note_imp(fz_context *ctx, const char *file, int line, const char *func, fz_error cause, char *fmt, ...)
{
	va_list ap;
	char one[FZ_ERR_LINE_LEN], two[FZ_ERR_LINE_LEN];

	snprintf(one, sizeof one, "%s:%d: %s(): ", file, line, func);
	va_start(ap, fmt);
	vsnprintf(two, sizeof two, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '|', one, two);

	return cause;
}

void
fz_error_handle_imp(fz_context *ctx, const char *file, int line, const char *func, fz_error cause, char *fmt, ...)
{
	va_list ap;
	char one[FZ_ERR_LINE_LEN], two[FZ_ERR_LINE_LEN];

	snprintf(one, sizeof one, "%s:%d: %s(): ", file, line, func);
	va_start(ap, fmt);
	vsnprintf(two, sizeof two, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '\\', one, two);
}

fz_error
fz_error_make_impx(fz_context *ctx, char *fmt, ...)
{
	va_list ap;
	char buf[FZ_ERR_LINE_LEN];

	ctx->error_count = 0;

	va_start(ap, fmt);
	vsnprintf(buf, sizeof buf, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '+', "", buf);

	return -1;
}

fz_error
fz_error_note_impx(fz_context *ctx, fz_error cause, char *fmt, ...)
{
	va_list ap;
	char buf[FZ_ERR_LINE_LEN];

	va_start(ap, fmt);
	vsnprintf(buf, sizeof buf, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '|', "", buf);

	return cause;
}

void
fz_error_handle_impx(fz_context *ctx, fz_error cause, char *fmt, ...)
{
	va_list ap;
	char buf[FZ_ERR_LINE_LEN];

	va_start(ap, fmt);
	vsnprintf(buf, sizeof buf, fmt, ap);
	va_end(ap);

	fz_emit_error(ctx, '\\', "", buf);
}
