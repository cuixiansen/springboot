package com.xiangmu.entity;

import java.util.Map;

public class CheckResult {
private int okcount;
private int errcount;
private Map<Integer,String> errors;
public int getOkcount() {
	return okcount;
}
public void setOkcount(int okcount) {
	this.okcount = okcount;
}
public int getErrcount() {
	return errcount;
}
public void setErrcount(int errcount) {
	this.errcount = errcount;
}
public Map<Integer, String> getErrors() {
	return errors;
}
public void setErrors(Map<Integer, String> errors) {
	this.errors = errors;
}
@Override
public String toString() {
	return "CheckResult [okcount=" + okcount + ", errcount=" + errcount + ", errors=" + errors + "]";
}



}
