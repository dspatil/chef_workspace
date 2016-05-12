# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dspatil"
client_key               "#{current_dir}/dspatil.pem"
validation_client_name   "tavisca_vexiere-validator"
validation_key           "#{current_dir}/tavisca_vexiere-validator.pem"
chef_server_url          "https://api.chef.io/organizations/tavisca_vexiere"
cookbook_path            ["#{current_dir}/../cookbooks"]
