package com.example.ErrandRunner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import com.example.ErrandRunner.entity.customer.CustomerNotFoundException;
import com.example.ErrandRunner.entity.provider.ProviderNotFoundException;
import com.example.ErrandRunner.entity.provider.TaskNotFoundException;

import jakarta.servlet.http.HttpServletResponse;

/**
 * Turns errors on the FreeMarker pages into a clear message instead of an error dump.
 * Scoped to the controller package, so the /api REST controllers are unaffected.
 */
@ControllerAdvice(basePackages = "com.example.ErrandRunner.controller")
public class UiExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(UiExceptionHandler.class);

    @ExceptionHandler({TaskNotFoundException.class, CustomerNotFoundException.class,
                       ProviderNotFoundException.class})
    public String notFound(RuntimeException e, Model model, HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        model.addAttribute("title", "Not found");
        model.addAttribute("message", e.getMessage());
        return "error";
    }

    @ExceptionHandler({MethodArgumentTypeMismatchException.class,
                       MissingServletRequestParameterException.class})
    public String badRequest(Exception e, Model model, HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        model.addAttribute("title", "That request wasn't valid");
        model.addAttribute("message", "Something in the link or form was missing or not a valid value. Please go back and try again.");
        return "error";
    }

    @ExceptionHandler(Exception.class)
    public String unexpected(Exception e, Model model, HttpServletResponse response) {
        log.error("Unexpected error on a page", e); // details go to the log, not the browser
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        model.addAttribute("title", "Something went wrong");
        model.addAttribute("message", "We couldn't complete that. Please try again in a moment.");
        return "error";
    }
}
