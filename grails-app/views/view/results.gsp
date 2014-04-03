<%@ page import="solrdebug.View" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'view.label', default: 'View')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="container" role="main">
    <div class="row">
        <h1>Search results</h1>
    </div>
    <g:if test="${flash.message}">
        <div class="bg-danger bordered" role="status">${flash.message}</div>
    </g:if>
    <div>
        <div class="row">
            <g:link class="btn btn-success" action="index">New search</g:link>
        </div>
        <div class="row bordered">
                <g:each in="${results}" status="i" var="viewInstance">
                    <dl class="dl-horizontal">
                    <dt>Record id (${i + 1})</dt>
                    <dd><g:link action="record" params="${[recordId: viewInstance.recordId]}">${viewInstance.recordId}</g:link></dd>
                    <g:if test="${viewInstance.title}">
                        <dt>Title</dt>
                        <dd>${viewInstance.title}</dd>
                    </g:if>
                    <g:if test="${viewInstance.description}">
                        <dt>Description</dt>
                        <dd>${viewInstance.description}</dd>
                    </g:if>
                    <g:if test="${viewInstance.collection}">
                        <dt>Collection</dt>
                        <dd>${viewInstance.collection}</dd>
                    </g:if>
                    <g:if test="${viewInstance.genre}">
                        <dt>Genre</dt>
                        <dd>${viewInstance.genre}</dd>
                    </g:if>
                    <g:if test="${viewInstance.subjects}">
                        <dt>Subjects</dt>
                        <dd>${viewInstance.subjects}</dd>
                    </g:if>
                    <g:if test="${viewInstance.keywords}">
                        <dt>Keywords</dt>
                        <dd>${viewInstance.keywords}</dd>
                    </g:if>
                    <g:if test="${viewInstance.people}">
                        <dt>People</dt>
                        <dd>${viewInstance.people}</dd>
                    </g:if>
                    <g:if test="${viewInstance.places}">
                        <dt>Places</dt>
                        <dd>${viewInstance.places}</dd>
                    </g:if>
                    <g:if test="${viewInstance.countries}">
                        <dt>Countries</dt>
                        <dd>${viewInstance.countries}</dd>
                    </g:if>
                    <g:if test="${viewInstance.credit}">
                        <dt>Credit</dt>
                        <dd>${viewInstance.credit}</dd>
                    </g:if>
                    </dl>
                </g:each>
        </div>
        <g:if test="${debug}">
            <div class="row debug">
                <a href="#" onclick="$('#explain').toggleClass('hidden');return false;"><h4>Debug info</h4></a>

                <div class="row hidden" id="explain">
                    <dl>
                        <g:each in="${debug.entrySet()}">
                            <g:if test="${it.key == "explain"}">
                                <dt>${it.key}</dt>
                                <dd>
                                    <dl class="dl-horizontal">
                                        <g:each in="${it.value.iterator()}" var="ex">
                                            <dt>${ex.getKey()}</dt>
                                            <dd><pre>${ex.getValue()}</pre></dd>
                                        </g:each>
                                    </dl>
                                </dd>
                            </g:if>
                            <g:else>
                                <dt>${it.key}</dt>
                                <dd>${it.value}</dd>
                            </g:else>
                        </g:each>
                    </dl>
                </div>
            </div>
        </g:if>
    </div>
</body>
</html>
