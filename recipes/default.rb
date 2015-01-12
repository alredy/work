grammarly_users_manage "user" do
end
include_recipe "sudo"




# search(:test_users) do |u|
# search(:grammarly_groups) do |g|
#  group = g['id'].split(",")
# unless u['roles'].to_a.empty?
#     roles = u['roles'].select{|role, groupname| node.roles.include?(role)} # {"role1" => "grp1", "role2" => "grp2"}
#     roles.each do |role, groupname|
# if groupname.empty? && u['groups'].nil? == false && u['groups'].any?{|g| group.include?(g)}
#         @groupname = group.join
#       elsif group.any?{|g| groupname.include?(g)}
#         @groupname = group.join
# end

# #unless @groupname.nil? 
#          	puts "_______"
# puts u['id']
# puts role
# puts @groupname
# #end



# end		
# end
# end
# end


    # roles.each do |role, groupname|
    
      # if groupname.empty? && u['groups']
      #   @groupname = u['groups'].join(", ")
      # else
      #   @groupname = roles.values.to_a.join(", ")
      # end 
	

					# case @groupname
     #                      when  /g['id']/
     #                      puts @groupname
     #                      #     group "root" do
     #                      #     members u['id']
     #                      #     append true
     #                      #     action :create
     #                      #     end
     #                      #     template "/etc/sudoers.d/#{u['id']}" do
     #                      #     source "sudoers/root.erb"
     #                      #     owner "root"
     #                      #     group "root"
     #                      #     mode "0440"
     #                      #     variables :id => u['id']
     #                      #     end
     #                      # when /dev/ 
     #                      #     group "dev" do
     #                      #     members u['id']
     #                      #     append true
     #                      #     action :create
     #                end       
      
      


# puts g['id']
# puts u['roles'].values
# if u['roles'].values == g['id']
# puts "__1__"
# puts @groupname
# end

# if groupname == g['id']
# puts "__2__"
# puts groupname	
# end




	# end

