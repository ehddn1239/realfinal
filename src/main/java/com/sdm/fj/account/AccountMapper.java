package com.sdm.fj.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AccountMapper {

	int register(Account a);

	Account login(Account a);

	int checkId(Account a);

	Account findPW(Account a);

	int changePW(Account a);

	int changeInfo(Map<String, String> value);

	Account showAllInfo(Map<String, String> value);

	Account getAccount(Account a);

	int updateRequest(Account a);

	List<Account> getAllClient();

	int updateReq(HashMap<String, String> val);


}
