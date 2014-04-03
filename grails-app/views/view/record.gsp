<%--
  Created by IntelliJ IDEA.
  User: rwincewicz
  Date: 05/03/2014
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
        <h1>View Record</h1>
    </div>
    <g:if test="${flash.message}">
        <div class="bg-danger bordered" role="status">${flash.message}</div>
    </g:if>
    <div class="row">
        <g:link class="btn btn-success" action="index">New search</g:link>
    </div>
    <div class="row bordered">
        <h3>Record result</h3>
        <dl class="dl-horizontal">
            <g:each in="${list}" status="i" var="viewInstance">
                <dt>Record id</dt>
                <dd>${viewInstance.recordId}</dd>
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
            </g:each>
        </dl>
    </div>

    <div class="row bordered">
        <h3>Search parameters</h3>
        <div class="col-md-4">
            <g:form role="form" action="mlt" method="get">
                <div class="form-group">
                    <label for="docFreq">Document frequency</label>
                    <input type="number" class="form-control" name="docFreq" id="docFreq" value="${(df) ? df : solrdebug.ViewController.DOCFREQ}"/>
                    <label for="termFreq">Term frequency</label>
                    <input type="number" class="form-control" name="termFreq" id="termFreq" value="${(tf) ? tf : solrdebug.ViewController.TERMFREQ}"/>
                    <label for="minWordLength">Min word length</label>
                    <input type="number" class="form-control" name="minWordLength" id="minWordLength" value="${(minwl) ? minwl : solrdebug.ViewController.MINWORDLENGTH}"/>
                    <label for="maxWordLength">Max word length</label>
                    <input type="number" class="form-control" name="maxWordLength" id="maxWordLength" value="${(maxwl) ? maxwl : null}"/>
                    <label for="maxQueryTerms">Max query terms</label>
                    <input type="number" class="form-control" name="maxQueryTerms" id="maxQueryTerms" value="${(mqt) ? mqt : null}"/>
                    <label for="simFields">Similar fields</label>
                    <input type="text" class="form-control" name="simFields" id="simFields" value="${(sf) ? sf : solrdebug.ViewController.SIMFIELDS}"/>
                    <label for="sortFields">Sort fields</label>
                    <input type="text" class="form-control" name="sortFields" id="sortFields" value="${(sortFields) ? sortFields : null}"/>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="random" id="random" checked="${random}"/>
                        Random sort?</label>
                </div>
                <div class="form-group">
                    <label for="boostTerms">Boost terms</label>
                    <input type="text" class="form-control" name="boostTerms" id="boostTerms" value="${bt}"/>
                </div>
                <input type="hidden" name="recordId" value="${params.recordId}"/>
                <button type="submit" class="btn btn-primary">Submit</button>

            </g:form>
        </div>
    </div>
</div>

</body>
</html>