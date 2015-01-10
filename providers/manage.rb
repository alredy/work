  action :create do
  search(:test_users) do |u|
  unless u['roles'].to_a.empty?
    roles = u['roles'].select{|role, groupname| node.roles.include?(role)} # {"role1" => "grp1", "role2" => "grp2"}
    roles.each do |role, groupname|
    
      if groupname.empty? && u['groups']
        @groups = u['groups'].join(", ")
      else
        @groups = roles.values.to_a.join(", ")
      end 

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
    if  u['type']  == "system" && node['sys_dir']
        directory "/opt/#{node['sys_dir']}" do
        owner u['id']
        group u['id']
        mode "6700"
        end
    end

                    case @groups
                          when  /root/
                              group "root" do
                              members u['id']
                              append true
                              action :create
                              end
                              template "/etc/sudoers.d/#{u['id']}" do
                              source "sudoers/root.erb"
                              owner "root"
                              group "root"
                              mode "0440"
                              variables :id => u['id']
                              end
                          when /dev/ 
                              group "dev" do
                              members u['id']
                              append true
                              action :create
                              end       
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

