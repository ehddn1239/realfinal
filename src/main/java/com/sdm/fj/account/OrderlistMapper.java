package com.sdm.fj.account;

import java.util.ArrayList;
import java.util.HashMap;

public interface OrderlistMapper {

	int regOrder(OrderList ol);

	ArrayList<OrderList> showAllOrders(HashMap<String, String> val);

}
