actions :create 

# :data_bag is the object to search
# :search_group is the groups name to search for, defaults to resource name
# :group_name is the string name of the group to create, defaults to resource name
# :group_id is the numeric id of the group to create
# :cookbook is the name of the cookbook that the authorized_keys template should be found in
attribute :data_bag, :kind_of => String, :default => "test_users"
attribute :roles, :kind_of => String, :name_attribute => true
#attribute :ssh_keys,      :kind_of => [Array,String], :default => []
#attribute :groupname, :kind_of => Integer, :required => true
def initialize(*args)
  super
  @action = :create
end