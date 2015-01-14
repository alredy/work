action :create do
  search(:test_users) do |u|
    if  u['roles'] == "system" && node['grammarly_users']['system']
          user u['id'] do
            shell "/bin/bash"
            system true
          end
            directory "/home/#{u['id']}"  do
              owner u['id']
              group u['id']
              mode 0700
              action :create
            end
            directory "home/#{u['id']}/.ssh" do
              owner u['id']
              group u['id']
              mode "0700"
            end      
            if u['ssh_keys']
              template "home/#{u['id']}/.ssh/authorized_keys" do
                source "authorized_keys.erb"
                owner u['id']
                group u['id'] 
                mode "0600"
                variables :ssh_keys => u['ssh_keys']
              end
            end  
    end # if  u['roles'] == "system" && node['grammarly_users']['system']

      unless u['roles'].to_a.empty?
      if u['roles'].any?{|role, group| node.roles.include?(role)}
        roles = u['roles'].select do |role, group|
          user u['id'] do
            group u['id']
            home "/home/#{u['id']}"
            shell "/bin/bash"
            system true
          end
        group = u['groups'] if group.empty?
        Array(group).each do |group|
            group group do
              members u['id']
              append true
              action :manage
            end
        

            `cat /etc/passwd | awk -F: '{print $1}'`.split.each do |local_user|
              `cat /etc/group| grep #{local_user}| awk -F: '{print $1}'| grep -v #{local_user}`.split.each do |local_group|
                local_users = {local_user => local_group}
                chef_users = {u['id'] => group}   
                  unless local_users.to_s.include? chef_users.to_s
                    group local_user do 
                      excluded_members local_users.values
                      append true
                      action :manage
                    end 
                  end
              
              end #|local_group|
            end #|local_user|     
        end #Array(group).each do |group|

            directory "/home/#{u['id']}"  do
              owner u['id']
              group u['id']
              mode 0700
              action :create
            end
            directory "home/#{u['id']}/.ssh" do
              owner u['id']
              group u['id']
              mode "0700"
            end      
            if u['ssh_keys']
              template "home/#{u['id']}/.ssh/authorized_keys" do
                source "authorized_keys.erb"
                owner u['id']
                group u['id'] 
                mode "0600"
                variables :ssh_keys => u['ssh_keys']
              end
            end #if u['ssh_keys']


          
        end #roles = u['roles'].select do |role, groupname|

      else #if u['roles'].any?{|role, groupname| node.roles.include?(role)}
        user u['id'] do 
          shell "/dev/null" 
          action :manage 
        end
        directory "home/#{u['id']}/.ssh/" do
          recursive true
          action :delete
        end 

      end #if u['roles'].any?{|role, groupname| node.roles.include?(role)}
    end #unless u['roles'].to_a.empty?
  end #search(:test_users) do |u|
end #action :create do
