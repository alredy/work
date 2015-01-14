
action :create do
  search(:test_users) do |u|
    if !u['roles'].nil? && u['roles'].any?{|role, group| node.roles.include?(role)}
      roles = u['roles'].select{|role, group| node.roles.include?(role)}
      roles.each do |role, groups|
        groups = u['groups'] if groups.empty?
          group u['id'] do
          end
        user u['id'] do
          group u['id']
          home "/home/#{u['id']}"
          shell "/bin/bash"
          system true
        end

        local_groups = `cat /etc/group| grep #{u['id']}| awk -F: '{print $1}'| grep -v #{u['id']}`.split
        local_groups.each do |local_group|
          unless Array(groups).include?(local_group)
            group local_group do 
              excluded_members u['id']
              append true
              action :manage
            end 
          end
        end 

        Array(groups).each do |group|
          group group do
            members u['id']
            append true
            action :manage
          end
        end #Array(group).each do |group|

        directory "/home/#{u['id']}"  do
          owner u['id']
          group u['id']
          mode 0700
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
        if u['sudo']
          template "/etc/sudoers.d/#{u['id']}" do
            source "sudoers/sudo.erb" 
            owner "root"
            group "root"
            mode "0440"
            variables({
              :id => u['id'],
              :sudoers => u['sudo']
            })
          end
        else 
            template "/etc/sudoers.d/#{u['id']}" do
            source "sudoers/sudo.erb" 
            :delete
            end  
        end
      end #roles.each do |role, groups|

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
  end #search(:test_users) do |u|
end #action :create do
