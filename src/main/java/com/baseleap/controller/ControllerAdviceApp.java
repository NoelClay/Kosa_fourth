package com.baseleap.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.config.ConfigDataNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLIntegrityConstraintViolationException;


@ControllerAdvice        // 프로젝트 전체 적용
//@ControllerAdvice("sb.mvc") // 특정 패키지와 그 하위 패키지에만 적용
@Slf4j
public class ControllerAdviceApp {

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public ResponseEntity<String> handleDataNotFoundException(SQLIntegrityConstraintViolationException ex) {
        log.info("2doNullPointerException() :: e.getClass()={}  | e.getMessage()={}", ex.getClass(), ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("데이터를 찾을 수 없습니다.");
    }

    @ExceptionHandler(ConfigDataNotFoundException.class)
    public ResponseEntity<String> handleDataNotFoundException(ConfigDataNotFoundException e) {
        log.info("2doNullPointerException() :: e.getClass()={}  | e.getMessage()={}", e.getClass(), e.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("데이터를 찾을 수 없습니다.");
    }
}
