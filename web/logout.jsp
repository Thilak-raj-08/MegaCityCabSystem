<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }
    // Redirect to the login page
    response.sendRedirect("index.jsp?success=Logout Successful!");
%>