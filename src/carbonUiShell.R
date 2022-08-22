carbonUiShell <- function(prefix, name, href = "javascript:void 0") {
    
    dep_ui_shell <- htmltools::htmlDependency(
        name = "ui-shell",
        version = "1.0.0",
        src = list(href = "https://1.www.s81c.com/common"),
        script = list(type = "module", src = "carbon/web-components/tag/latest/ui-shell.min.js"),
        stylesheet = list(href = "carbon-for-ibm-dotcom/tag/v1/latest/plex.css")
    )
    
    ui_shell <- htmltools::tag("bx-header",
                               list(`aria-label` = paste(prefix, name),
                                    htmltools::tag("bx-header-name",
                                                   list(href = href,
                                                        prefix = prefix, name))))
    
    htmltools::attachDependencies(ui_shell, dep_ui_shell)
    
}