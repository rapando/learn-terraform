# resource block
# resource type is local_file (depends on the provider)
# {provider}_{type}
# pet is the resource name
resource "local_file" "pet" {
    # arguments for the resource in key=valye format.
    # these arguments are specific to provider and type.
    filename = "./pets.txt"
    content = "We love Pets!"
}