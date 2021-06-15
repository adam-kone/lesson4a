
variable "vcn-cidr" {
  default = "20.0.0.0/16"
}
variable "subnet1-cidr" {
  default = "20.0.1.0/24"
}

variable "subnet2-cidr" {
  default = "20.0.2.0/24"
}
variable "subnet3-cidr" {
  default ="20.0.3.0/24"
}

variable "vnc-name" {
  default = "myvcn"
}

variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaaqmbxaf5w5njsvf3e3oizkoomde77fbzkcy26gdfzxcbbije72eza"
}
variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaajznex5attydtrmrgudwayqu7kn4krasw2ct4h4pwz7nwbfxoyd4q"
}
variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaaijipzhhn5dvk6btah6tjapvnp6v4fpt5viefkcncvhse757mqaaa"
}

variable "fingerprint" {
  default = "24:f1:95:01:51:d3:d6:73:7f:0d:17:64:34:45:b4:1e"
}

variable "private_key_path" {
default = "/home/adam_kone/.oci/api_key_public.pem"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "service-ports" {
  default = [80,443]
}
variable "bastion_ports" {
  default = [22]
}

variable "ads" {
  default = ["GrCh:US-ASHBURN-AD-1","GrCh:US-ASHBURN-AD-2","GrCh:US-ASHBURN-AD-3"]
}

variable "shapes" {
  default = "VM.Standard2.1"
}
variable "images" {
  default = "ocid1.image.oc1.iad.aaaaaaaaw2wavtqrd3ynbrzabcnrs77pinccp55j2gqitjrrj2vf65sqj5kq"
}
variable "ssh_authorized_keys" {
  default = "/home/opc/.ssh/id_rsa.pub"
}

variable "FlexShapeOCPUS" {
    default = 1
}
variable "FlexShapeMemory" {
    default = 1
}

variable "instance_os" {
  default = "Oracle Linux"
}

variable "linux_os_version" {
  default = "7.9"
}

variable "ssh_public_key" {
  default = ""
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}

# load balancer

variable "load_balancer_shape" {
  default = "100Mbps"
}


# variable "load_balancer_shape_details_maximum_bandwidth_in_mbps" {
#   default = "20"
# }

# variable "load_balancer_shape_details_minimum_bandwidth_in_mbps" {
#   default = "100"
# }

variable "listener_port" {
  default = 80
}

variable "listener_protocol" {
  default = "HTTP"
}

variable "backend_set_policy" {
  default = "ROUND_ROBIN"

}

