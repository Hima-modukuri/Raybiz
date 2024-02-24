resource_group_name ="bindu-rg"
location="EAST-US"
tags = {
      Purpose       = "RBT-Task" 
      created_by    = "Himabindu"
}
node_count="1"
vm_size="StandardB4ms"
mysql_sku_name="GP_Gen5_2"
mysql_version="5.7"
mysql_admin_username= admin
mysql_admin_password= admin
mysql_server_name= bindu-sql
vm_name= bin
vm_publisher="MicrosoftWindowsServer"
vm_offer="WindowsServer"
vm_sku="2019-Datacenter"
vm_admin_username="admin"
vm_admin_password="Admin@123"



