module "agmodule" {
	source = "../modules"
	address_space = "${var.address_space}"
    address_prefix = "${var.address_prefix}"
    ssh_key_var =  "${var.ssh_key_var}"
}
