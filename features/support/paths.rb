module NavigationHelpers
  
  def path_to(page_name)
    case page_name
    
    when /^the (newstab )?home\s?page$/
      '/'
    when /^the add new article page$/
      '/articles/new'
    when /^the show all articles page$/
      '/articles'
    when /^the show all users$/
      '/users'
    when /^the show article for "(.*)"$/
      article_path(Articles.find_by_title($1))
    when /^the show page for user email "(.*)"$/
      user_path(Users.find_by_email($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)