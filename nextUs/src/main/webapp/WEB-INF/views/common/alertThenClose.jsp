<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	alert('${msg}');
	// Additional JavaScript for closing the window
	function closeWindow() {
		window.open('', '_parent', '');
		window.close();
	}

	setTimeout(closeWindow, 100); 
</script>
