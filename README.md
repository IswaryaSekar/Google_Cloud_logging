## Examples

## METHOD 1 PUPPET APPLY
## Project Resource

## 1. GET
------------

Get method called along with mandatory parameter
```puppet
google_cloud_dns_project{'graphite-development':
          ensure      => 'get'
          }
```

Get method called along without mandatory parameter
```puppet
 google_cloud_dns_project{'graphite-development':
              }
```

Get method called with invalid parameter 
```puppet
 google_cloud_dns_project{'graphite-development':
		ensure      => 'gets'
              }
```

----------------------

## METHOD 2 PUPPET RESOURCE COMMANDS

## 3. GET
------------

Get method called along with mandatory parameter
```puppet

puppet resource google_cloud_dns_project 'graphite-development' ensure='get'

```

Get method called along without mandatory parameter
```puppet

puppet resource google_cloud_dns_project ensure='get'
 
```

Get method called with invalid parameter 
```puppet

puppet resource google_cloud_dns_project 'graphite-development' ensure='gets'
  
```

