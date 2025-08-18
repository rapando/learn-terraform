# resource block
# resource type is local_file (depends on the provider)
# {provider}_{type}
# pet is the resource name
resource "local_file" "pet" {
    # arguments for the resource in key=valye format.
    # these arguments are specific to provider and type.
    filename = "./pets.txt"
    content = "We love Pets!"
    # initial attempt to update permissions of the file
    # this will force deletion and creation of new file.
    file_permission = "0700"
    
}