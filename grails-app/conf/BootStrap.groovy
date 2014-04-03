import solrdebug.BeanConfigUtil

class BootStrap {

  def grailsApplication;

    def init = { servletContext ->
      BeanConfigUtil.configure(grailsApplication.config, grailsApplication.mainContext);
    }
    def destroy = {
    }
}
