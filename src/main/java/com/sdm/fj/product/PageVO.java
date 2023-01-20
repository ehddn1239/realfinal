package com.sdm.fj.product;

public class PageVO {
		private int startPage;
		private int endPage;
		private boolean prev, next;
		
		private int total;
		private int pageNum;
		private int amount;
		//현재 페이지 번호, 한 페이지에 표출할 데이터 개수
		private Criteria cri;
		private String sort;
		

		public PageVO(Criteria cri, int total) {
			this.pageNum = cri.getPageNum();
			this.amount = cri.getAmount();
			this.cri = cri;
			this.total = total;
			
			//시작페이지, 마지막페이지 계산
			this.endPage = (int)Math.ceil(cri.getPageNum() / 10.0) * 10;
			this.startPage = this.endPage -10 +1;
			
			int realEnd = (int)Math.ceil(this.total / (double)this.amount);
			
			if(realEnd < this.endPage) {
				this.endPage = realEnd;
			}
			
			//이전, 다음 버튼 표출 여부 결정
			this.prev = this.startPage > 1;
			this.next = this.endPage < realEnd;
		}
		
		
		
		public int getPageNum() {
			return pageNum;
		}

		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public void setCri(Criteria cri) {
			this.cri = cri;
		}

		public int getStartPage() {
			return startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public boolean isPrev() {
			return prev;
		}
		public boolean isNext() {
			return next;
		}
		public int getTotal() {
			return total;
		}
		public Criteria getCri() {
			return cri;
		}

		
		public String getSort() {
			return sort;
		}



		public void setSort(String sort) {
			this.sort = sort;
		}



		@Override
		public String toString() {
			return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
					+ ", total=" + total + "]";
		}
	}

