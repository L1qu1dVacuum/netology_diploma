resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
  
  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../../ansible/inventory ../../ansible/deploy_cluster.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}
