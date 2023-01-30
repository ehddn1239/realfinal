function deleteProduct(n, c) {
		let a = confirm('삭제하시겠습니까?')
		if (a == 1) {
			location.href = 'product.delete.do?p_no=' + n + '&p_category=' + c;
		}
	}