 grammarly_users_manage "user" do
 end
 include_recipe "sudo"



# search(:test_users) do |u|
# #	search(:grammarly_groups) do |g|
# 	unless u['roles'].to_a.empty?
# 		#if u['roles'].any?{|role, group| node.roles.include?(role)}
# 		roles = u['roles'].select{|role, group| node.roles.include?(role)}
# 			roles.each do |role, group|				 		# puts "___
# 				group = u['groups'] if group.empty?
# 				Array(group).each do |group| 
            

#             template "/etc/sudoers.d/#{u['id']}" do
#               source "sudoers/root.erb" #need varieble
#               owner "root"
#               group "root"
#               mode "0440"
#               variables :id => u['id']
#             end		 			
		 			
# 		 			`cat /etc/passwd | awk -F: '{print $1}'`.split.each do |local_user|
# 						`cat /etc/group| grep #{u['id']}| awk -F: '{print $1}'| grep -v #{u['id']}`.split.each do |local_group|
# 							local_users = {u['id'] => local_group}
# 							chef_users = {u['id'] => group}		
# 								unless local_users.to_s.include? chef_users.to_s
# 									group local_group do
# 		                    			excluded_members u['id']
# 		                    			append true
# 		                    			action :manage
# 									end	
# 								end
# 								# group local_group do
# 			 				# 		excluded_members local_user
# 	       #              			append true
# 	       #              			action :manage
# 								# end
						
# 							end #|local_group|
# 					end	#|local_user| 		
# 				end #Array(group).each do |group|
# 			end #roles.each do |role, group|
# 		#end #if u['roles'].any?{|role, group| node.roles.include?(role)}	
# 	end #unless u['roles'].to_a.empty?
# end #search(:test_users) do |u|
