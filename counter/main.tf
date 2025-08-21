resource "local_file" "users" {
  filename = var.filename[count.index]
  count = 2
  content = random_pet.pet.id
}

resource "random_pet" "pet" {
    prefix = "Mr."
    separator = " "
    length = 2
}