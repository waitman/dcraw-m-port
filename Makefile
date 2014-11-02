# Created by: "Waitman Gobble" <uzimac@da3m0n8t3r.com>
# $FreeBSD$
# New ports collection makefile for: dcraw-m
# Date created: 29 March 2013

PORTNAME=	dcraw-m
PORTVERSION=	9.22
CATEGORIES=	graphics
MASTER_SITES=	GH

MAINTAINER=	waitman@waitman.net
COMMENT=	Modified Decoder for RAW files from digital cameras

LICENSE=	GPLv2

LIB_DEPENDS=	libjasper.so:${PORTSDIR}/graphics/jasper \
		libjpeg.so:${PORTSDIR}/graphics/jpeg \
		liblcms2.so:${PORTSDIR}/graphics/lcms2 \
		libMagickWand-6.Q16.so:${PORTSDIR}/graphics/ImageMagick

USE_GITHUB=	yes
GH_ACCOUNT=	waitman
GH_PROJECT=	dcraw-m
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	1b90326

PLIST_FILES=	bin/dcraw-m

OPTIONS_DEFINE=	OPTIMIZE_O3 OPTIMIZE_O4
OPTIMIZE_O3_DESC=	Use O3 with clang (O4 not working)
OPTIMIZE_O4_DESC=	Use O4 with gcc

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MOPTIMIZE_O3}
CFLAGS+=	-O3
.else
.if ${PORT_OPTIONS:MOPTIMIZE_O4}
CFLAGS+=	-O4
.endif
.endif

.include <bsd.port.mk>
