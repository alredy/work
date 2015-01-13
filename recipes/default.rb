# grammarly_users_manage "user" do
# end
# include_recipe "sudo"

{"auth" => ""}


search(:test_users) do |u|
	if  u['roles'] == "system" && node['grammarly_users']['system']
	        user u['id'] do
		        shell "/bin/bash"
		        system true
	        end
	end # if  u['roles'] == "system" && node['grammarly_users']['system']
	search(:grammarly_groups) do |g|
		group = g['id'].split(",")

		unless u['roles'].to_a.empty?
			if u['roles'].any?{|role, groupname| node.roles.include?(role)}
				roles = u['roles'].select do |role, groupname|
					user u['id'] do
						home "/home/#{u['id']}"
						shell "/bin/bash"
						system true
					end


					if groupname.empty? && u['groups'].nil? == false && group.any?{|g| u['groups'].include?(g)}
						groupname = group.join
					elsif group.any?{|g| groupname.include?(g)}
						groupname = group.join
						group groupname do
							members u['id']
							append true
							action :create
						end
						template "/etc/sudoers.d/#{u['id']}" do
							source "sudoers/root.erb" #need varieble
							owner "root"
							group "root"
							mode "0440"
							variables :id => u['id']
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
						end #if u['ssh_keys']


					end #if groupname
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
	end #search(:grammarly_groups) do |g|
end #search(:test_users) do |u|
