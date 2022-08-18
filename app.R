library(shiny)

dep_ui_shell <- htmltools::htmlDependency(
    name = "ui-shell",
    version = "1.0.0",
    src = list(href = "https://1.www.s81c.com/common"),
    script = list(type = "module", src = "carbon/web-components/tag/latest/ui-shell.min.js"),
    stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
)

ui_shell <- htmltools::tag("bx-header",
                           list(`aria-label`="IBM Carbon Shiny",
                                htmltools::tag("bx-header-name",
                                               list(href="javascript:void 0",
                                                    prefix = "IBM Carbon", "Shiny"))))

dep_dropdown <- htmltools::htmlDependency(
    name = "dropdown",
    version = "1.0.0",
    src = list(href = "https://1.www.s81c.com/common"),
    script = list(type = "module", src = "carbon/web-components/tag/latest/dropdown.min.js"),
    stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
)

dropdown <- htmltools::tag("bx-dropdown", 
                           list(id = "dropdown", value = "", `label-text` = "Dropdown",
                                htmltools::tagList(
                                    tag("bx-dropdown-item", list(value = "foo", "Foo")),
                                    tag("bx-dropdown-item", list(value = "bar", "Bar")),
                                    tag("bx-dropdown-item", list(value = "baz", "Baz")))))

dep_slider <- htmltools::htmlDependency(
    name = "slider",
    version = "1.0.0",
    src = list(href = "https://1.www.s81c.com/common"),
    script = list(type = "module", src = "carbon/web-components/tag/latest/slider.min.js"),
    stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
)

slider <- htmltools::tag("bx-slider", 
                         list(id = "slider",
                              `label-text` = "Slider",
                              max = "100",
                              min = "0",
                              step = "1",
                              value = "50",
                              htmltools::tag("bx-slider-input", 
                                             list(`aria-label` = "Slider value",
                                                  type = "number"))))

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

dep_date_picker <- htmltools::htmlDependency(
    name = "date_picker",
    version = "1.0.0",
    src = list(href = "https://1.www.s81c.com/common"),
    script = list(type = "module", src = "carbon/web-components/tag/latest/date-picker.min.js"),
    stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
)

date_picker <- htmltools::tag("bx-date-picker", 
                              list(id = "date_picker",
                                   htmltools::tag("bx-date-picker-input",
                                                  list(kind = "single",
                                                       `label-text` = "Date Picker label",
                                                       placeholder = "mm/dd/yyyy"))))

dep_data_table <- htmltools::htmlDependency(
    name = "data-table",
    version = "1.0.0",
    src = list(href = "https://1.www.s81c.com/common"),
    script = list(type = "module", src = "carbon/web-components/tag/latest/data-table.min.js"),
    stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
)


carbonDataTable <- function() {
    
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
    
}

carbonTag <- function(text) {
    
    dep_tag <- htmltools::htmlDependency(
        name = "tag",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/tag.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    htmltools::attachDependencies(htmltools::tag("bx-tag", 
                                                 list(type = "green", 
                                                      title = "Tag",
                                                      text)), dep_tag)
}


ui <- function(requests) {
    
    tagList(
        htmltools::htmlDependency(name = "grid",
                                  version = "1.0.0", 
                                  src = list(href = "https://1.www.s81c.com/common/carbon-for-ibm-dotcom/tag/v1/latest"),
                                  stylesheet = list(href = "grid.css")),
        
        htmltools::attachDependencies(ui_shell, dep_ui_shell),
        tags$div(class = "bx--grid",
                 tags$div(class = "bx--row", style = "margin-top: 5rem",
                          tags$div(class = "bx--col",
                                   htmltools::attachDependencies(dropdown, dep_dropdown),
                                   tags$br(),
                                   htmltools::attachDependencies(slider, dep_slider),
                                   tags$br(),
                                   htmltools::attachDependencies(toggle, dep_toggle),
                                   tags$br(),
                                   htmltools::attachDependencies(date_picker, dep_date_picker),
                                   
                                   tags$script(HTML('document.getElementById("dropdown").addEventListener("bx-dropdown-selected", (e) => {Shiny.setInputValue("dropdown", e.detail.item.value)});')),
                                   tags$script(HTML('document.getElementById("slider").addEventListener("bx-slider-changed", (e) => {Shiny.setInputValue("slider", e.detail.value)});')),
                                   tags$script(HTML('document.getElementById("toggle").addEventListener("bx-toggle-changed", (e) => {Shiny.setInputValue("toggle", e.target.__checked)});')),
                                   tags$script(HTML('document.getElementById("date_picker").addEventListener("bx-date-picker-changed", (e) => {Shiny.setInputValue("date_picker", e.detail.selectedDates[0])});')),
                          ),
                          
                          tags$div(class = "bx--col",
                                   # htmltools::attachDependencies(carbonDataTable(), dep_data_table),
                                   h4("Results:"),
                                   carbonTag("Dropdown:"),
                                   textOutput("resdropdown"),
                                   tags$br(),
                                   carbonTag("Slider:"),
                                   textOutput("resslider"),
                                   tags$br(),
                                   carbonTag("Toggle:"),
                                   textOutput("restoggle"),
                                   tags$br(),
                                   carbonTag("Date Picker:"),
                                   textOutput("resdate")
                                   
                          )
                 )
        )
    )
}

server <- function(input, output, session) {
    
    output$resdropdown <- renderText({
        input$dropdown
    })
    
    output$resslider <- renderText({
        input$slider
    })
    
    output$restoggle <- renderText({
        input$toggle
    })
    
    output$resdate <- renderText({
        as.character(as.Date(input$date_picker))
    })
    
}

shinyApp(ui, server)