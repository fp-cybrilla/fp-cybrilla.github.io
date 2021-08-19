module ActiveLink

  def active_link(text, target, attributes = { class: 'text-base-color' })
      # Find path
      path = target.is_a?(String) ? target : target.path

      if @item_rep&.path == path
        # Create message
        "<span class=\"text-primary-B100\">#{text}</span>"
      else
        link_to(text, target, attributes)
      end
    end

end
