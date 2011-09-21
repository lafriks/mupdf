LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

MY_ROOT := ../..

LOCAL_C_INCLUDES := \
	../thirdparty/jbig2dec \
	../thirdparty/openjpeg-1.4/libopenjpeg \
	../thirdparty/jpeg-8c \
	../thirdparty/zlib-1.2.5 \
	../thirdparty/freetype-2.4.6/include \
	../scripts

LOCAL_CFLAGS := \
	-DFT2_BUILD_LIBRARY -DDARWIN_NO_CARBON -DHAVE_STDINT_H

LOCAL_MODULE    := mupdfthirdparty
LOCAL_SRC_FILES := \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_arith.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_arith_int.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_arith_iaid.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_huffman.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_segment.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_page.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_symbol_dict.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_text.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_generic.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_refinement.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_mmr.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_image.c \
	$(MY_ROOT)/thirdparty/jbig2dec/jbig2_metadata.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/bio.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/cio.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/dwt.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/event.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/image.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/j2k.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/j2k_lib.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/jp2.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/jpt.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/mct.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/mqc.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/openjpeg.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/pi.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/raw.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/t1.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/t2.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/tcd.c \
	$(MY_ROOT)/thirdparty/openjpeg-1.4/libopenjpeg/tgt.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jaricom.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcapimin.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcapistd.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcarith.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jccoefct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jccolor.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcdctmgr.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jchuff.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcinit.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcmainct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcmarker.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcmaster.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcomapi.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcparam.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcprepct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jcsample.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jctrans.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdapimin.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdapistd.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdarith.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdatadst.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdatasrc.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdcoefct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdcolor.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jddctmgr.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdhuff.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdinput.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdmainct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdmarker.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdmaster.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdmerge.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdpostct.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdsample.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jdtrans.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jerror.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jfdctflt.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jfdctfst.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jfdctint.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jidctflt.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jidctfst.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jidctint.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jquant1.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jquant2.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jutils.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jmemmgr.c \
	$(MY_ROOT)/thirdparty/jpeg-8c/jmemansi.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/adler32.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/compress.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/crc32.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/deflate.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/gzclose.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/gzlib.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/gzread.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/gzwrite.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/infback.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/inffast.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/inflate.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/inftrees.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/trees.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/uncompr.c \
	$(MY_ROOT)/thirdparty/zlib-1.2.5/zutil.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/autofit/autofit.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftbase.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftbbox.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftbdf.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftbitmap.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftdebug.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftgasp.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftglyph.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftgxval.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftinit.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftlcdfil.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftmm.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftotval.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftpfr.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftstroke.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftsynth.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftsystem.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/fttype1.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftwinfnt.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftxf86.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftpatent.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/base/ftpatent.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/cache/ftcache.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/cff/cff.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/cid/type1cid.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/gzip/ftgzip.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/lzw/ftlzw.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/pcf/pcf.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/pfr/pfr.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/psaux/psaux.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/pshinter/pshinter.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/psnames/psnames.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/raster/raster.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/smooth/smooth.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/sfnt/sfnt.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/truetype/truetype.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/type1/type1.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/type42/type42.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/otvalid/otvalid.c \
	$(MY_ROOT)/thirdparty/freetype-2.4.6/src/winfonts/winfnt.c

include $(BUILD_STATIC_LIBRARY)
