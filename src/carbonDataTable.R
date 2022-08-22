carbonDataTable <- function() {
    
    dep_data_table <- htmltools::htmlDependency(
        name = "data-table",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/data-table.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    table_header <- 
        tagList(htmltools::tag("bx-table-header-cell", "Column1"),
                htmltools::tag("bx-table-header-cell", "Column1"))
    
    table_row <- 
        tagList(htmltools::tag("bx-table-cell", ""),
                htmltools::tag("bx-table-cell", ""))
    
    data_table <- 
        htmltools::tag(
            "bx-data-table", 
            list(htmltools::tag(
                "bx-table", 
                list(htmltools::tag(
                    "bx-table-head",
                    list(htmltools::tag(
                        "bx-table-header-row", table_header))),
                    htmltools::tag(
                        "bx-table-body",
                        list(htmltools::tag(
                            "bx-table-row", table_row)))))))
    
    htmltools::attachDependencies(data_table, dep_data_table)
    
}