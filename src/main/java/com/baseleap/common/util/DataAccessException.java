package com.baseleap.common.util;

public class DataAccessException extends RuntimeException {
    public DataAccessException(String message) {
        super(message + "에서 데이터베이스 문제가 발생했습니다.");
    }

}
