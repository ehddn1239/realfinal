package com.sdm.fj.account;

public interface AccountMapper {

	int register(Account a);

	Account login(Account a);

	int checkId(Account a);

	Account findPW(Account a);

	int changePW(Account a);


}
