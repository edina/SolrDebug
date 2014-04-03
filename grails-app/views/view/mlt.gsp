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
    <h1>View 'more like this' results</h1>
</div>
<g:if test="${flash.message}">
    <div class="bg-danger bordered" role="status">${flash.message}</div>
</g:if>
<div class="row">
    <g:link class="btn btn-success" action="index">New search</g:link>
    <g:link class="btn btn-primary" action="record" params="${params}">Back to record</g:link>
</div>

<div class="row">
    <div class="col-md-6 bordered">
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

    <div class="col-md-6 bordered">
        <h3>MLT params</h3>
        <dl class="dl-horizontal">
            <g:if test="${params.docFreq}">
                <dt>Document frequency</dt>
                <dd>${params.docFreq} (1)</dd>
            </g:if>
            <g:if test="${params.termFreq}">
                <dt>Term frequency</dt>
                <dd>${params.termFreq} (1)</dd>
            </g:if>
            <g:if test="${params.minWordLength}">
                <dt>Min word length</dt>
                <dd>${params.minWordLength} (3)</dd>
            </g:if>
            <g:if test="${params.maxWordLength}">
                <dt>Max word length</dt>
                <dd>${params.maxWordLength}</dd>
            </g:if>
            <g:if test="${params.maxQueryTerms}">
                <dt>Max query terms</dt>
                <dd>${params.maxQueryTerms}</dd>
            </g:if>
            <g:if test="${params.simFields}">
                <dt>Similar fields</dt>
                <dd>${params.simFields} (description-index,title-index)</dd>
            </g:if>
            <g:if test="${params.sortFields}">
                <dt>Sort fields</dt>
                <dd>${params.sortFields}</dd>
            </g:if>
            <g:if test="${params.boostTerms}">
                <dt>Boost terms</dt>
                <dd>${params.boostTerms}</dd>
            </g:if>
        </dl>
    </div>
</div>

<div class="row">
    <div class="col-md-6 bordered">
        <h3>Default mlt</h3>
        <g:each in="${defaultList}" status="i" var="viewInstance">
            <dl class="dl-horizontal">
                <dt>Record id (${i + 1})</dt>
                <dd><g:link action="record"
                            params="${[recordId: viewInstance.recordId]}">${viewInstance.recordId}</g:link></dd>
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
                <dt>Score</dt>
                <dd class="text-danger">${viewInstance.score}</dd>
            </dl>
        </g:each>
    </div>

    <div class="col-md-6 bordered">
        <h3>More like this</h3>
        <g:each in="${mlt}" status="i" var="viewInstance">
            <dl class="dl-horizontal">
                <dt>Record id (${i + 1})</dt>
                <dd><g:link action="record"
                            params="${[recordId: viewInstance.recordId]}">${viewInstance.recordId}</g:link></dd>
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
                <dt>Score</dt>
                <dd class="text-danger">${viewInstance.score}</dd>
            </dl>
        </g:each>
    </div>

</div>

<div class="row">
    <g:if test="${debug}">
        <div class="row debug">
            <a href="#" onclick="$('#explain').toggleClass('hidden');
            return false;"><h4>Debug info</h4></a>

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
</div>
</body>
</html>
