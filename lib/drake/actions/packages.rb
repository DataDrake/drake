module Drake
  module Packages

    def package_manager
      if execute 'which apt'
        return :apt
      end
      if execute 'which yum'
        return :yum
      end
      :nil
    end

    def package_add( list )
      if list.nil?
        say_error '[PACKAGES] Error: no package(s) specified'
        return
      end
      if list.is_a? Array
        list = list.join
        puts list
      end
      success = false
      case package_manager
        when :apt
          success = execute "apt-get install -y #{list}"
        when :yum
          success = execute "yum install -y #{list}"
        else
          say_error '[PACKAGES] Error: could not find supported package manager'
      end
      if success
        say_ok '[PACKAGES] Install Succeeded'
      else
        say_error '[PACKAGES] Install Failed'
      end
    end

    def package_remove( list )
      if list.nil?
        say_error '[PACKAGES] Error: no package(s) specified'
        return
      end
      if list.is_a? Array
        list = list.join
        puts list
      end
      success = false
      case package_manager
        when :apt
          success = execute "apt-get remove -y #{list}"
        when :yum
          success = execute "yum remove -y #{list}"
        else
          say_error '[PACKAGES] Error: could not find supported package manager'
      end
      if success
        say_ok '[PACKAGES] Uninstall Succeeded.'
      else
        say_error '[PACKAGES] Uninstall Failed.'
      end
    end

    def package_upgrade( list )
      if list.is_a? Array
        list = list.join
        puts list
      end
      success = false
      case package_manager
        when :apt
          success = execute "apt-get upgrade -y #{list}"
        when :yum
          success = execute "yum upgrade -y #{list}"
        else
          say_error '[PACKAGES] Error: could not find supported package manager'
      end
      if success
        say_ok '[PACKAGES] Upgrade Succeeded.'
      else
        say_error '[PACKAGES] Upgrade Failed.'
      end
    end

    def package_list_update
      success = false
      case package_manager
        when :apt
          success = execute "apt-get update"
        when :yum
          success = execute "yum check-update"
        else
          say_error '[PACKAGES] Error: could not find supported package manager'
      end
      if success
        say_ok '[PACKAGES] Package lists updated.'
      else
        say_error '[PACKAGES] Package list update failed.'
      end
    end

    def packages( mode , list = nil )
      case mode
        when :add
          package_list_update
          package_add( list )
        when :remove
          package_remove( list )
        when :update
          package_list_update
        when :upgrade
          package_list_update
          package_upgrade( list )
        else
          say_error '[PACKAGES] Error: mode not supported'
      end
    end
    alias_method :package, :packages
  end
end