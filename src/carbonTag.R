carbonTag <- function(text, type, title = NULL) {
    
    dep_tag <- htmltools::htmlDependency(
        name = "tag",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/tag.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    htmltools::attachDependencies(htmltools::tag("bx-tag", 
                                                 list(type = type, 
                                                      title = title,
                                                      text)), dep_tag)
}