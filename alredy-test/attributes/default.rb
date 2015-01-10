
default['authorization']['sudo']['include_sudoers_d'] = true 

case node.chef_environment
when /^qa.*/
  override['java']['oracle']['accept_oracle_download_terms'] = true
  override['java']['remove_deprecated_packages'] = false
  override['java']['install_flavor'] = "oracle"
  override['java']['jdk_version'] = '8'
  override['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz'
  override['java']['jdk']['8']['x86_64']['checksum'] = 'e145c03a7edc845215092786bcfba77e'
else
  override['java']['oracle']['accept_oracle_download_terms'] = true
  override['java']['remove_deprecated_packages'] = false
  override['java']['install_flavor'] = "oracle"
  override['java']['jdk_version'] = '7'
  override['java']['jdk']['7']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jdk-7u25-linux-x64.tar.gz'
  override['java']['jdk']['7']['x86_64']['checksum'] = 'f80dff0e19ca8d038cf7fe3aaa89538496b80950f4d10ff5f457988ae159b2a6'
end
