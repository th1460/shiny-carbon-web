carbonSlider <- function(id, label, max, min, step, value) {
    
    dep_slider <- htmltools::htmlDependency(
        name = "slider",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/slider.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    slider <- htmltools::tag("bx-slider", 
                             list(id = id,
                                  `label-text` = label,
                                  max = max,
                                  min = min,
                                  step = step,
                                  value = value,
                                  htmltools::tag("bx-slider-input", 
                                                 list(type = "number"))))
    
    htmltools::attachDependencies(slider, dep_slider)
    
}