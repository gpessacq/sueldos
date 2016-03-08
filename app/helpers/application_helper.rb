module ApplicationHelper
  def sortable(column, title = nil, mes_nombre, mes, anio)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    
    link_to title, sueldos_show_path(sort: column, direction: direction, fecha_mes: mes_nombre, fecha_nromes: mes, fecha_anio: anio), class: css_class
  end
  
  def sortable_home(column, title = nil, mes, anio)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    
    link_to title, sueldos_show_path(sort: column, direction: direction, fecha_mes: mes_nombre, fecha_nromes: mes, fecha_anio: anio)
  end  
  
  def glyph(*names)
    content_tag :i, nil, class: names.map{|name| "glyphicon glyphicon-#{name.to_s.gsub('_','-')}" }
  end  
  
end
