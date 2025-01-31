resource "grafana_slo" "test" {
  name        = "Tupper - Terraform Ratio Query Example"
  description = "Tupper - Terraform Ratio Query Description"
  
  query {
    type = "ratio"
    ratio {
      success_metric  = "mythical_request_times_bucket{namespace=\"production\", le=\"200\", status!=\"500\"}"
      total_metric    = "mythical_request_times_count{namespace=\"production\"}"
      group_by_labels = ["endpoint"]
    }
  }
  
  objectives {
    value  = 0.8
    window = "30d"
  }
  
  destination_datasource {
    uid = "grafanacloud-prom"
  }
  
  label {
    key   = "slo"
    value = "terraform"
  }
  
  alerting {
    fastburn {
      annotation {
        key   = "name"
        value = "SLO Burn Rate Very High"
      }
      annotation {
        key   = "description"
        value = "Error budget is burning too fast"
      }
      label {
        key   = "type"
        value = "slo"
      }
    }

    slowburn {
      annotation {
        key   = "name"
        value = "SLO Burn Rate High"
      }
      annotation {
        key   = "description"
        value = "Error budget is burning too fast"
      }
      label {
        key   = "type"
        value = "slo"
      }
    }
  }
}