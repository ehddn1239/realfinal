package com.sdm.fj.account;

import java.util.ArrayList;

public interface OrderlistMapper {

	int regOrder(OrderList ol);

	ArrayList<OrderList> showAllOrders(OrderList o);

	OrderList getProduct(OrderList o);

}
