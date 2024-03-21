fun_showcase_sparkline <- plot_ly(economics) %>%
  add_lines(
    x = ~date, y = ~psavert,
    color = I("white"), span = I(1),
    fill = 'tozeroy', alpha = 0.2
  ) %>%
  layout(
    xaxis = list(visible = F, showgrid = F, title = ""),
    yaxis = list(visible = F, showgrid = F, title = ""),
    hovermode = "x",
    margin = list(t = 0, r = 0, l = 0, b = 0),
    font = list(color = "white"),
    paper_bgcolor = "transparent",
    plot_bgcolor = "transparent"
  ) %>%
  config(displayModeBar = F) %>%
  htmlwidgets::onRender(
    "function(el) {
      var ro = new ResizeObserver(function() {
         var visible = el.offsetHeight > 200;
         Plotly.relayout(el, {'xaxis.visible': visible});
      });
      ro.observe(el);
    }"
  )