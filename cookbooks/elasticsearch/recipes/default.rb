# Encoding: utf-8
#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe 'chef-sugar'

aws = data_bag_item('main', 'aws')

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch' 
elasticsearch_install 'elasticsearch' do
  type node['elasticsearch']['install_type'].to_sym # since TK can't symbol.
end
elasticsearch_configure 'elasticsearch' do 
  configuration ({ 'cloud.aws.access_key' => aws['aws_access_key_id'], 'cloud.aws.secret_key' => aws['aws_secret_access_key'] , 'cloud.aws.region' => aws['aws_region'], 'index.store.type' => aws['index_store_type']})
  action :manage
end
elasticsearch_service 'elasticsearch' do
	service_actions  [:enable,:start]
end
elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
  action :install
end
elasticsearch_plugin 'bigdesk' do
  url 'lukas-vlcek/bigdesk'
  action :install
end
elasticsearch_plugin 'cloud_aws' do
  url 'elasticsearch/elasticsearch-cloud-aws/2.7.1'
  action :install
end


# by default, no plugins
