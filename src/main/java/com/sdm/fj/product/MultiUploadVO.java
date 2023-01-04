package com.sdm.fj.product;

import java.util.List;

public class MultiUploadVO {
	private List<UploadVO> list;
	
	public MultiUploadVO() {
		// TODO Auto-generated constructor stub
	}

	public List<UploadVO> getList() {
		return list;
	}

	public void setList(List<UploadVO> list) {
		this.list = list;
	}

	public MultiUploadVO(List<UploadVO> list) {
		super();
		this.list = list;
	}
	
}
