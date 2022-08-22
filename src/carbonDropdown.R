carbonDropdown <- function(id, value, label, options) {
    
    dep_dropdown <- htmltools::htmlDependency(
        name = "dropdown",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/dropdown.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    dropdown <- htmltools::tag("bx-dropdown", 
                               list(id = id, value = "", `label-text` = label))
    
    for(i in seq(length(options))) {
        
        dropdown <- 
            dropdown |> 
            htmltools::tagAppendChild(tag("bx-dropdown-item", list(value = options[i], names(options[i]))))
        
    }
    
    htmltools::attachDependencies(dropdown, dep_dropdown)
    
}