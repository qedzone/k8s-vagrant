resource "local_file" "kubeconfig_eu_central_1" {
  for_each = module.clusters_eu_central_1
  content  = each.value.kubeconfig
  filename = "${path.module}/${each.value.cluster-name}"
}

resource "local_file" "kubeconfig_eu_west_1" {
  for_each = module.clusters_eu_west_1
  content  = each.value.kubeconfig
  filename = "${path.module}/${each.value.cluster-name}"
}

resource "local_file" "kubeconfig_eu_west_2" {
  for_each = module.clusters_eu_west_2
  content  = each.value.kubeconfig
  filename = "${path.module}/${each.value.cluster-name}"
}

output "cluster_info" {
  value = concat([
    for name in module.clusters_eu_central_1 : {
      cluster-name : name.cluster-name
      control-plane-public-ip : name.control_plane_public_ip
      control-plane-public-dns : name.control_plane_public_dns
      node01-public-ip : name.node01_public_ip
      node01-public-dns : name.node01_public_dns
      node02-public-ip : name.node02_public_ip
      node02-public-dns : name.node02_public_dns
      kubeconfig : name.kubeconfig
      cluster-admin-token : name.cluster-admin-token
    }
    ],
    [
      for name in module.clusters_eu_west_1 : {
        cluster-name : name.cluster-name
        control-plane-public-ip : name.control_plane_public_ip
        control-plane-public-dns : name.control_plane_public_dns
        node01-public-ip : name.node01_public_ip
        node01-public-dns : name.node01_public_dns
        node02-public-ip : name.node02_public_ip
        node02-public-dns : name.node02_public_dns
        kubeconfig : name.kubeconfig
        cluster-admin-token : name.cluster-admin-token
      }
    ],
    [
      for name in module.clusters_eu_west_2 : {
        cluster-name : name.cluster-name
        control-plane-public-ip : name.control_plane_public_ip
        control-plane-public-dns : name.control_plane_public_dns
        node01-public-ip : name.node01_public_ip
        node01-public-dns : name.node01_public_dns
        node02-public-ip : name.node02_public_ip
        node02-public-dns : name.node02_public_dns
        kubeconfig : name.kubeconfig
        cluster-admin-token : name.cluster-admin-token
      }
  ])
}
