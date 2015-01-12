  action :create do
  search(:test_users) do |u|
   search(:grammarly_groups) do |g|
   group = g['id'].split(",")
      if  u['groups'] == "system" && node['sys_dir']
        user u['id'] do
        shell "/bin/bash"
        system true
        end
        directory "/opt/#{node['sys_dir']}" do
        owner u['id']
        group u['id']
        mode "0700"
        end
      end


 if u['roles'].to_a.any?
 group = g['id'].split(",")
    roles = u['roles'].select{|role, groupname| node.roles.include?(role)} # {"role1" => "grp1", "role2" => "grp2"}
    roles.each do |role, groupname|
    
      # group u['id'] do
       #   system true
       # end
        user u['id'] do
        home "/home/#{u['id']}"
    #    group u['id']
        shell "/bin/bash"
        system true
    #    action :create
        end

if groupname.empty? && u['groups'].nil? == false && u['groups'].any?{|g| group.include?(g)}
        @groupname = group.join
      elsif group.any?{|g| groupname.include?(g)}
        @groupname = group.join
end

unless @groupname.nil? 
          puts "_______"
puts u['id']
puts role
puts @groupname

                    # case @groups
                    #       when  /root/
                              group @groupname do
                              members u['id']
                              append true
                              action :create
                              end
                    #           template "/etc/sudoers.d/#{u['id']}" do
                    #           source "sudoers/root.erb"
                    #           owner "root"
                    #           group "root"
                    #           mode "0440"
                    #           variables :id => u['id']
                    #           end
                    #       when /dev/ 
                    #           group "dev" do
                    #           members u['id']
                    #           append true
                    #           action :create
                    #           end       
                    # end
      
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
end
   # end
  #  end
   
  #  search(:test_users) do |u|
  #     roles = u['roles'].keys
   # if roles.any?{|r| node.run_list.roles.include?(r)}  == false
   # if `cat /etc/passwd | grep u['id']`.split(":").last #.chomp
   # else
    if roles.to_a.empty? #|| @groups.empty?  
        user u['id'] do 
        shell "/dev/null" 
        action :manage 
       end
         directory "home/#{u['id']}/.ssh/" do
         recursive true
         action :delete
         end
     end
     if u['action'] == 'remove'
       user u['id'] do 
       action :remove
       end
     end
end
end

end
end

