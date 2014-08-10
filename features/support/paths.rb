module NavigationHelpers

  def path_to(page_name)
    case page_name

      #---------------------
      # Person Paths


      #---------------------
      # Vendor Paths


      # --------------------
      #Generic Paths

      when /^the home page/
        send("root_path")

      when /the show page for (.+)/
        polymorphic_path(model($1))

      else
        if path = match_rails_path_for(page_name)
          path
        else
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in features/support/paths.rb"
        end
    end
  end

  private

    def match_rails_path_for(page_name)
      if page_name.match(/the (.*) page/)
        return send "#{$1.gsub(" ", "_")}_path" rescue nil
      end
    end

end

World(NavigationHelpers)
