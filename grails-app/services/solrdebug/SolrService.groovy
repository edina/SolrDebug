package solrdebug

import grails.transaction.Transactional
import org.apache.solr.client.solrj.*
import org.apache.solr.client.solrj.response.QueryResponse
import org.apache.solr.common.SolrException
import org.apache.solr.common.params.MoreLikeThisParams

@Transactional
class SolrService {

  /**
   * Variables defined in BeanConfigUtil as they can't access
   * grailsApplication from here.
   */
  String url;
  SolrServer server;

  /**
   * Initial query of Solr to return list of results
   * @param queryString String from search form
   * @return QueryResponse Response from Solr server
   * @throws SolrException
   * @throws SolrServerException
   */
  public QueryResponse query(String queryString) throws SolrException, SolrServerException {
    SolrQuery solrQuery = new SolrQuery();
    solrQuery.setQuery(queryString);
    solrQuery.showDebugInfo = true;
    solrQuery.setFields("primary-media-type,media0,media1,aggregated-collection,collection-jisc-licensed,collection-needs-login,collection-is-external,collection,credit,subject,id,description,duration,title,score,thumbnail,created");
    QueryResponse queryResponse = server.query(solrQuery);
    log.error("Solr query: " + solrQuery);
    return queryResponse;
  }

  /**
   * Returns response from Solr server for 'More like this' query
   * TODO Find a way to reduce number of parameters
   * @param recordId MHub record Id
   * @param docFreq
   * @param termFreq
   * @param minWordLength
   * @param maxWordLength
   * @param maxQueryTerms
   * @param simFields
   * @param sortFields
   * @param random
   * @param boostTerms
   * @return QueryResponse Response from Solr server
   * @throws SolrException
   * @throws SolrServerException
   */
  public QueryResponse mlt(String recordId, Integer docFreq, Integer termFreq, Integer minWordLength, Integer maxWordLength, Integer maxQueryTerms, String simFields, String sortFields, Boolean random, String boostTerms) throws SolrException, SolrServerException {
    SolrQuery solrQuery = new SolrQuery();
    solrQuery.setFacet(false);
    solrQuery.setQuery("id:" + recordId);
    solrQuery.setFields("*,score");
    solrQuery.showDebugInfo = true;
    // Solr query parameters lifted straight from MHub code to ensure that the default results match those
    // returned from the live service.
    solrQuery.setQueryType("/" + MoreLikeThisParams.MLT);    // Next few comments from the Solr docs
//    solrQuery.set(MoreLikeThisParams.MLT, true);
    solrQuery.set(MoreLikeThisParams.MATCH_INCLUDE, false);    // Presumably this prevents the current doc/record from being returned?
    if (docFreq) {
      solrQuery.set(MoreLikeThisParams.MIN_DOC_FREQ, docFreq);      // Minimum Document Frequency - the frequency at which words will be ignored which do not occur in at least this many docs.
    }
    if (termFreq) {
      solrQuery.set(MoreLikeThisParams.MIN_TERM_FREQ, termFreq);      // Minimum Term Frequency - the frequency below which terms will be ignored in the source doc
    }
    if (minWordLength) {
      solrQuery.set(MoreLikeThisParams.MIN_WORD_LEN, minWordLength);      // Minimum Word Length below which words will be ignored
    }
    if (maxWordLength) {
      solrQuery.set(MoreLikeThisParams.MAX_WORD_LEN, maxWordLength);
    }
    if (maxQueryTerms) {
      solrQuery.set(MoreLikeThisParams.MAX_QUERY_TERMS, maxQueryTerms);
    }
    solrQuery.set(MoreLikeThisParams.SIMILARITY_FIELDS, simFields);
    if (sortFields) {
      solrQuery.setSortField(sortFields, SolrQuery.ORDER.desc);
    } else if (random) {
      solrQuery.setSortField(("random_" + System.currentTimeMillis()), SolrQuery.ORDER.desc);
    }
    if (boostTerms) {
      solrQuery.set(MoreLikeThisParams.BOOST, true);
      solrQuery.set(MoreLikeThisParams.QF, boostTerms);
    }
    log.error("Solr query: " + solrQuery);
    QueryResponse queryResponse = server.query(solrQuery);
    return queryResponse;
  }
}
