module NavigationHelpers

  def path_to(page_name)
    case page_name

      #---------------------
      # Customer Paths
      when /^the customer (.*?) page/
        route = "new_customer_registration_path"
        send(route)



      #---------------------
      # Vendor Paths


      # --------------------
      #Generic Paths

      when /^the (.*?) page/
        model_prose = $1
        route = "root_path"
        send(route)

    end
  end

end

World(NavigationHelpers)