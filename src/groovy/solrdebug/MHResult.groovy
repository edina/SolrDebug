package solrdebug

import org.apache.solr.common.SolrDocument

class MHResult {

  String recordId
  String title
  String collection
  String description
  String genre
  List<String> subjects
  List<String> keywords
  List<String> people
  List<String> countries
  List<String> places
  List<String> credit
  String score

  /**
   * Empty constructor
   */
  MHResult() {
  }

  /**
   * Constructor that maps a Solr search response to MHResult
   * variables
   * @param solrResult SolrDocument output from Solr query
   */
  MHResult(SolrDocument solrResult) {
    this.recordId = solrResult.getFieldValue("id");
    this.collection = solrResult.getFieldValue("collection");
    this.title = solrResult.getFieldValue("title");
    this.countries = solrResult.getFieldValues("country") as List<String>;
    this.credit = solrResult.getFieldValues("credit") as List<String>;
    this.description = solrResult.getFieldValue("description");
    this.genre = solrResult.getFieldValue("genre");
    this.keywords = solrResult.getFieldValues("keyword") as List<String>;
    this.people = solrResult.getFieldValues("people") as List<String>;
    this.places = solrResult.getFieldValues("place") as List<String>;
    this.subjects = solrResult.getFieldValues("subject") as List<String>;
    this.score = solrResult.getFieldValue("score");
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("MHResult{");
    sb.append("recordId='").append(recordId).append('\'');
    sb.append(", title='").append(title).append('\'');
    sb.append(", collection='").append(collection).append('\'');
    sb.append(", description='").append(description).append('\'');
    sb.append(", genre='").append(genre).append('\'');
    sb.append(", subjects='").append(subjects).append('\'');
    sb.append(", keywords='").append(keywords).append('\'');
    sb.append(", people='").append(people).append('\'');
    sb.append(", countries='").append(countries).append('\'');
    sb.append(", places='").append(places).append('\'');
    sb.append(", credit='").append(credit).append('\'');
    sb.append('}');
    return sb.toString();
  }
}