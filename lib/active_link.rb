module ActiveLink

  def active_link(text, target, attributes = { class: 'text-primary-N100 dark:text-primary-N05 px-3 py-1 hover:bg-primary-B10 dark:hover:bg-primary-DN05 w-full' })
      # Find path
      path = target.is_a?(String) ? target : target.path

      if (@item_rep&.path == path || @item_rep&.path == path+"/")
        # Create message
        "<span class=\"text-primary-B100 active px-3 py-1\" data-href=#{path}>#{text}</span>"
      else
        link_to(text, target, attributes)
      end
    end

end
