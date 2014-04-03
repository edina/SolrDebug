import solrdebug.View

class UrlMappings {

  static mappings = {
    "/$controller/$action?/$id?(.$format)?" {
      constraints {
        // apply constraints here
      }
    }
    "/view/record/$recordId?"(controller: "view", action: "record")

    "/"(view: "/index")
    "500"(view: '/error')
  }
}
