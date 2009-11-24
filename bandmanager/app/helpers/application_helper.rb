# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def verify_current_page(menu_item)
    if controller_name == menu_item
      "current_page_item"
    end
  end

  def corner(*ids)
    ids.each do |id|
      output << ""
    end
  end

end
