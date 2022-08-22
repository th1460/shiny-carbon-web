carbonDatePicker <- function(id, kind, label, placeholder) {
    
    dep_date_picker <- htmltools::htmlDependency(
        name = "date_picker",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/date-picker.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    date_picker <- htmltools::tag("bx-date-picker", 
                                  list(id = id,
                                       htmltools::tag("bx-date-picker-input",
                                                      list(kind = kind,
                                                           `label-text` = label,
                                                           placeholder = placeholder))))
    
    htmltools::attachDependencies(date_picker, dep_date_picker)
    
}