package com.example.ErrandRunner.exception;

/** Thrown when user input is bad. The message is safe to show on the page. */
public class InvalidRequestException extends RuntimeException {

    public InvalidRequestException(String message) {
        super(message);
    }
}
