module UsersHelper

  def get_color_picker_div
    html = ""
    html += "<div class='form-group' >"
    html += "<label class='col-md-2'>Please Select a Color:</label>"
    html += "<div class ='controls col-md-3' ><input type='color' name='favcolor' value='#000000' id = 'color_chooser'></div>"
    html += "</div></br>"
    html.html_safe
  end

  def get_square_grid_element(k, v)
    style = title = ""
    if v.present?
      style = "background-color:#{v[1]}"
      title = "Last Updated By #{v[0]} at #{CommonUtils.format_date_time v[2]}"
    end
    html = "<div id= 'grid_#{k}' class='item' style = '#{style}' title = '#{title}' onclick = 'updateColorForGrid(#{@square_grid.id}, #{k})'>#{k}</div>"
    html.html_safe
  end
end
