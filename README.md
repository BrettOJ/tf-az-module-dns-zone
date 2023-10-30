Enables you to manage DNS zones within Azure DNS. These zones are hosted on Azure's name servers to which you can delegate the zone from the parent domain.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#example-usage)

```
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_dns_zone" "example-public" {
  name                = "mydomain.com"
  resource_group_name = azurerm_resource_group.example.name
}
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#name) - (Required) The name of the DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#resource_group_name) - (Required) Specifies the resource group where the resource exists. Changing this forces a new resource to be created.
    
-   [`soa_record`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#soa_record) - (Optional) An `soa_record` block as defined below. Changing this forces a new resource to be created.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#tags) - (Optional) A mapping of tags to assign to the resource.
    

___

The `soa_record` block supports:

-   [`email`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#email) - (Required) The email contact for the SOA record.
    
-   [`host_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#host_name) - (Optional) The domain name of the authoritative name server for the SOA record. If not set, computed value from Azure will be used.
    
-   [`expire_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#expire_time) - (Optional) The expire time for the SOA record. Defaults to `2419200`.
    
-   [`minimum_ttl`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#minimum_ttl) - (Optional) The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to `300`.
    
-   [`refresh_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#refresh_time) - (Optional) The refresh time for the SOA record. Defaults to `3600`.
    
-   [`retry_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#retry_time) - (Optional) The retry time for the SOA record. Defaults to `300`.
    
-   [`serial_number`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#serial_number) - (Optional) The serial number for the SOA record. Defaults to `1`.
    
-   [`ttl`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#ttl) - (Optional) The Time To Live of the SOA Record in seconds. Defaults to `3600`.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#tags) - (Optional) A mapping of tags to assign to the Record Set.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#id) - The DNS Zone ID.
    
-   [`max_number_of_record_sets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#max_number_of_record_sets) - (Optional) Maximum number of Records in the zone. Defaults to `1000`.
    
-   [`number_of_record_sets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#number_of_record_sets) - (Optional) The number of records already in the zone.
    
-   [`name_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#name_servers) - (Optional) A list of values that make up the NS record for the zone.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#create) - (Defaults to 30 minutes) Used when creating the DNS Zone.
    
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#update) - (Defaults to 30 minutes) Used when updating the DNS Zone.
    
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#read) - (Defaults to 5 minutes) Used when retrieving the DNS Zone.
    
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#delete) - (Defaults to 30 minutes) Used when deleting the DNS Zone.
    

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#import)

DNS Zones can be imported using the `resource id`, e.g.

```
terraform import azurerm_dns_zone.zone1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/dnsZones/zone1
```