<%@ page import="solrdebug.View" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'view.label', default: 'View')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="container">
    <div class="row">
        <h1>Find record</h1>
    </div>
    <g:if test="${flash.message}">
        <div class="bg-danger bordered" role="status">${flash.message}</div>
    </g:if>
    <div class="col-md-4">
        <g:form role="form" action="results" method="get">
            <div class="form-group">
                <label for="searchTerm">Search term</label>
                <input type="text" class="form-control" name="searchTerm" id="searchTerm"/>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </g:form>
    </div>

    <div class="col-md-4">
        <g:form role="form" action="record" method="get">
            <div class="form-group">
                <label for="recordId">Record ID</label>
                <input type="text" class="form-control" name="recordId" id="recordId"/>
            </div>
            <button type="submit" class="btn btn-primary">Get record</button>
        </g:form>
    </div>
</div>
</body>
</html>
