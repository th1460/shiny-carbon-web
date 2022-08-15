library(shiny)

dep <- htmltools::htmlDependency(
    name = "main",
    version = "1.0.0",
    src = "./dist",
    script = c(file = "main.js"),
    stylesheet = c(href = "plex.css")
)

ui_shell <- htmltools::tag("bx-header",
                           list(`aria-label`="IBM Carbon Shiny",
                                htmltools::tag("bx-header-name",
                                               list(href="javascript:void 0",
                                                    prefix = "IBM Carbon", "Shiny"))))

dropdown1 <- htmltools::tag("bx-dropdown", 
                            list(`label-text` = "Dropdown",
                                 value = "bar",
                                 htmltools::tagList(
                                     tag("bx-dropdown-item", list(value = "foo", "Foo")),
                                     tag("bx-dropdown-item", list(value = "bar", "Bar")),
                                     tag("bx-dropdown-item", list(value = "baz", "Baz"))
                                 )))

slider <- htmltools::tag("bx-slider", 
                         list(`label-text` = "Slider",
                              max = "100",
                              min = "0",
                              step = "1",
                              value = "50",
                              htmltools::tag("bx-slider-input", 
                                             list(`aria-label` = "Slider value",
                                                  type = "number"))))

ui <- fluidPage(
    
    tags$html(htmltools::attachDependencies(ui_shell, dep)),
    tags$br(),
    tags$br(),
    htmltools::attachDependencies(dropdown1, dep),
    tags$br(),
    htmltools::attachDependencies(slider, dep)
    
)

server <- function(input, output, session) {
    
    observeEvent(input$dropdown1, {
        print(input$dropdown1)
    })
    
    observeEvent(input$slider, {
        print(input$slider)
    })
    
}

shinyApp(ui, server)