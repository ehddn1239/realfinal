package com.sdm.fj.account;

public interface AccountMapper {

	int register(Account a);

	Account login(Account a);

	int checkId(Account a);


}
