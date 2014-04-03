package solrdebug

import org.apache.solr.client.solrj.response.QueryResponse
import org.apache.solr.common.*
import org.apache.solr.client.solrj.SolrServerException

class ViewController {

  public static final Integer DOCFREQ = 1;
  public static final Integer TERMFREQ = 1;
  public static final Integer MINWORDLENGTH = 3;
  public static final String SIMFIELDS = "description-index,title-index";

  def SolrService;

  /**
   * Initial page
   */
  def index() {

  }

  /**
   * Display results from a text query of Solr
   * @return
   */
  def results() {
    String searchTerm = params.searchTerm;
    if (!searchTerm) {
      flash.message = "Please enter a search term";
      redirect(action: "index");
      return
    }
    QueryResponse queryResponse = solrService.query(searchTerm);

    List<MHResult> results = parseSearchResults(queryResponse);

    [results: results, debug: queryResponse?.debugMap]
  }

  /**
   * Show details of a record along with a form to retrieve the 'More like this'
   * results
   * @return
   */
  def record() {
    log.error("Record params: " + params);
    String recordId = params.recordId;
    Integer docFreq = (params.docFreq) ? Integer.valueOf(params.docFreq) : DOCFREQ;
    Integer termFreq = (params.termFreq) ? Integer.valueOf(params.termFreq) : TERMFREQ;
    Integer minWordLength = (params.minWordLength) ? Integer.valueOf(params.minWordLength) : MINWORDLENGTH;
    Integer maxWordLength = (params.maxWordLength) ? Integer.valueOf(params.maxWordLength) : null;
    Integer maxQueryTerms = (params.maxQueryTerms) ? Integer.valueOf(params.maxQueryTerms) : null;
    String boostTerms = (params.boostTerms) ? params.boostTerms : null;
    String simFields = (params.simFields) ? params.simFields : SIMFIELDS;
    Boolean random = (params.random == "on");
    String sortFields = (params.sortFields) ? params.sortFields : null;
    QueryResponse queryResponse = null;
    try {
      queryResponse = solrService.query("id:" + recordId)
    } catch (SolrException se) {
      log.error("Could not perform Solr query - " + se);
      flash.message = "An error occurred when performing the Solr query";
    } catch (SolrServerException sse) {
      log.error("Could not perform Solr query - " + sse);
      flash.message = "An error occurred when performing the Solr query";
    }
    List<MHResult> documentList = (queryResponse) ? parseSearchResults(queryResponse) : null;

    [list: documentList, df: docFreq, tf: termFreq, minwl: minWordLength, maxwl: maxWordLength, mqt: maxQueryTerms, bt: boostTerms, sf: simFields, random: random, sortFields: sortFields]
  }

  /**
   * Return and display results from the 'More like this' query
   * @return
   */
  def mlt() {
    String recordId = params.recordId;
    if (!recordId) {
      flash.message = "Please enter a search term or record ID";
      redirect(action: "index");
      return
    }
    log.error(recordId);
    log.error("MLT params: " + params);
    QueryResponse queryResponse = null;
    try {
      queryResponse = solrService.query("id:" + recordId);
    } catch (SolrException se) {
      log.error("Could not perform Solr query - " + se);
      flash.message = "An error occurred when performing the Solr query";
    } catch (SolrServerException sse) {
      log.error("Could not perform Solr query - " + sse);
      flash.message = "An error occurred when performing the Solr query";
    }
    List<MHResult> documentList = (queryResponse) ? parseSearchResults(queryResponse) : null;
    Integer docFreq = validateInteger(params.docFreq, DOCFREQ);
    Integer termFreq = validateInteger(params.termFreq, TERMFREQ);
    Integer minWordLength = validateInteger(params.minWordLength, MINWORDLENGTH);
    Integer maxWordLength = validateInteger(params.maxWordLength, null);
    Integer maxQueryTerms = validateInteger(params.maxQueryTerms, null);
    String boostTerms = (params.boostTerms) ? params.boostTerms : null;
    String simFields = (params.simFields) ? params.simFields : SIMFIELDS;
    Boolean random = (params.random == "on");
    String sortFields = (params.sortFields) ? params.sortFields : null;
    QueryResponse mltResponse = null;
    QueryResponse defaultResponse = null;
    try {
      mltResponse = solrService.mlt(recordId, docFreq, termFreq, minWordLength, maxWordLength, maxQueryTerms, simFields, sortFields, random, boostTerms);
      defaultResponse = solrService.mlt(recordId, 1, 1, 3, null, null, "description-index,title-index", null, true, null);
    } catch (SolrException se) {
      log.error("Could not perform Solr query - " + se);
      flash.message = "An error occurred when performing the Solr query";
    } catch (SolrServerException sse) {
      log.error("Could not perform Solr query - " + sse);
      flash.message = "An error occurred when performing the Solr query";
    }
    List<MHResult> mltList = (mltResponse) ? parseSearchResults(mltResponse) : null;
    List<MHResult> defaultList = (defaultResponse) ? parseSearchResults(defaultResponse) : null;

    [list: documentList, mlt: mltList, defaultList: defaultList, debug: mltResponse?.debugMap]
  }

  private static validateInteger(String value, Integer defaultValue) {
    return (value) ? Integer.valueOf(value) : defaultValue;
  }

  /**
   * Convert a query response to a list of MHResults
   * @param queryResponse
   * @return
   */
  private static List<MHResult> parseSearchResults(QueryResponse queryResponse) {
    SolrDocumentList solrResults = queryResponse.getResults();
    List<MHResult> results = new ArrayList<>(solrResults.numFound.toInteger());
    for (SolrDocument solrResult in solrResults) {
      MHResult result = new MHResult(solrResult);
      results.add(result);
    }
    return results;
  }
}
