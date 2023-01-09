package com.sdm.fj.account;

import java.util.HashMap;
import java.util.List;

public interface RequestMapper {

	int regRequest(RequestSeller r);

	List<RequestSeller> showAll();

	boolean deleteReq(HashMap<String, String> val);

}
