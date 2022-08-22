carbonToggle <- function(id, checked_text, label, unchecked_text) {
    
    dep_toggle <- htmltools::htmlDependency(
        name = "toggle",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/toggle.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    toggle <- htmltools::tag("bx-toggle", 
                             list(id = "toggle",
                                  `checked-text` = "On",
                                  `label-text` = "Toggle",
                                  `unchecked-text` = "Off"))
    
    htmltools::attachDependencies(toggle, dep_toggle)
    
}