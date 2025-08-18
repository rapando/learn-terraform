resource "local_file" "pet" {
    filename = "./pets.txt"
    content = "We love Pets!"
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
resource "random_pet" "my-pet" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}