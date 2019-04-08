module "agmodule" {
	source = "../modules"
	address_space = "${address_space}"
    address_prefix = "${address_prefix}"
    ssh_key_var =  "${ssh_key_var}"
}
