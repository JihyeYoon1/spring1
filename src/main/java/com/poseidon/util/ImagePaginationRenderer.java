package com.poseidon.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
public class ImagePaginationRenderer extends AbstractPaginationRenderer {
	public ImagePaginationRenderer() { 
		firstPageLabel = "<a class=\"xi-step-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>&#160;"; 
	    previousPageLabel = "<a class=\"xi-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>&#160;";
	    currentPageLabel = "<strong>{0}</strong>&#160;";
	    otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
	    nextPageLabel = "<a class=\"xi-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>&#160;";
	    lastPageLabel = "<a class=\"xi-step-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>&#160;";
	}
}
