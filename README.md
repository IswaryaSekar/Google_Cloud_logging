## Examples

#### METHOD 1 PUPPET APPLY
## ManagedZone Resource
## 1. CREATE
------------
Create method called only with mandatory parameter 
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
          ensure      => 'present',
    project     => 'graphite-development',
          dns_name    => 'myzonegoogle.com.',
          description   => 'Module Testing'
      }
```

Create method called without mandatory parameter 
```puppet
google_cloud_dns_managed_zone{'my-zone-testsample-invalid':
          ensure      => 'present',
		  }
```
Create method called with invalid parameter 
```puppet
        google_cloud_dns_managed_zone{'my-zone-testsample':
          ensure      => 'presentt',
		  project     => 'graphite-development',
          dns_name    => 'myzonegoogle.com.',
          description   => 'Module Testing'
      }
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
google_cloud_dns_managed_zone{'List Manage zone':
		  ensure      => 'list',
		  project     => 'graphite-development'
          }
```

list method called along with optional parameter
```puppet
google_cloud_dns_managed_zone{'List Manage zone':
		  ensure      => 'list',
}
```

when list method called with invalid parameter 
