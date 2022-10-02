carbonInput <- function(id, label, helper = NULL) {
    
    dep_input <- htmltools::htmlDependency(
        name = "input",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/input.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    input <- htmltools::tag("bx-input",
                            list(id = id,
                                 tagList(tags$span(slot = "label-text", label),
                                         tags$span(slot = "helper-text", helper))))
    
    htmltools::attachDependencies(input, dep_input)
    
}