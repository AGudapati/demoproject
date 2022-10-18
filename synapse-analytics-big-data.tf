resource "azurerm_synapse_spark_pool" "synapse-spark-pool" {
  name                 = var.synapse_sparkpool
  synapse_workspace_id = azurerm_synapse_workspace.syn-ws.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Small"
  cache_size           = 100

  auto_scale {
    max_node_count = 50
    min_node_count = 3
  }

  auto_pause {
    delay_in_minutes = 15
  }

  library_requirement {
    content  = <<EOF
appnope==0.1.0
beautifulsoup4==4.6.3
EOF
    filename = "requirements.txt"
  }

  spark_config {
    content  = <<EOF
spark.shuffle.spill                true
EOF
    filename = "config.txt"
  }

    tags = merge(local.tags, {
    purpose = "synapse spark pool"
  })
  depends_on          = [var.resource_group_name,azurerm_storage_data_lake_gen2_filesystem.addlfs,azurerm_synapse_workspace.syn-ws]

}