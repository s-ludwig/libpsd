#ifndef __PSD_RECT_H__
#define __PSD_RECT_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "libpsd.h"


typedef struct _psd_rect
{
	psd_size 			left;
	psd_size 			top;
	psd_size 			right;
	psd_size 			bottom;
} psd_rect;


psd_bool psd_incept_rect(psd_rect * r1, psd_rect * r2, psd_rect * dst_rect);
psd_bool psd_equal_rect(psd_rect * r1, psd_rect * r2);
psd_bool psd_subtract_rect(psd_rect * r1, psd_rect * r2, psd_rect * dst_rect);
void psd_make_rect(psd_rect * rc, psd_size left, psd_size top, psd_size right, psd_size bottom);
void psd_dup_rect(psd_rect * dst, psd_rect * src);
psd_size psd_rect_width(psd_rect * rc);
psd_size psd_rect_height(psd_rect * rc);
void psd_offset_rect(psd_rect * rc, psd_size dlt_x, psd_size dlt_y);
void psd_inflate_rect(psd_rect * rc, psd_size dlt_x, psd_size dlt_y);
psd_bool psd_point_in_rect(psd_rect * rc, psd_size x, psd_size y);
psd_bool psd_is_empty_rect(psd_rect * rc);



#ifdef __cplusplus
}
#endif

#endif
