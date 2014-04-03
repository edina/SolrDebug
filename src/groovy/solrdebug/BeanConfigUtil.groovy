package solrdebug

import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.springframework.context.ApplicationContext

class BeanConfigUtil {

  /**
   * Define variables in SolrService from the config file
   * @param config
   * @param ctx
   */
  static void configure(ConfigObject config, ApplicationContext ctx) {
    ctx.solrService.with {
      url = config.solrUrl;
      server = new HttpSolrServer(url);
    }
  }
}
