## Examples

## METHOD 1 PUPPET APPLY
## ManagedZone Resource
### 1. CREATE
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

List method called along with optional parameter
```puppet
google_cloud_dns_managed_zone{'List Manage zone':
		  ensure      => 'list',
}
```

List method called without mandatory parameter
```puppet
google_cloud_dns_managed_zone{'List Manage zone':
		  ensure      => 'list',
		  }
```

List method called with invalid parameter 
```puppet
google_cloud_dns_managed_zone{'List Manage zone':
		  ensure      => 'lists',
		  project     => 'graphite-development'
          }
```

## 3. GET
------------

Get method called along with mandatory parameter
```puppet
google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'get'
          }
```

Get method called along without mandatory parameter
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
		ensure      => 'get'
          }
```

Get method called with invalid parameter 
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'gets'
          }
```

## 4. DELETE
------------
Delete method called along with mandatory parameter 
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'absent'
        }
```

Delete method called along without mandatory parameter 
```puppet
google_cloud_dns_managed_zone{'my-zone-testsample':
		ensure      => 'absent'
        }
```

Delete method called with invalid parameter
```puppet
google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'absentt'
        }
```

----------------------

## METHOD 2 PUPPET RESOURCE COMMANDS

### 1. CREATE
------------
Create method called only with mandatory parameter 
```puppet

 puppet resource google_cloud_dns_managed_zone 'my-zone-testsample1' ensure='present' project='graphite-development' dns_name='myzonegoogle.com.' description='Module Testing'
 
```

Create method called without mandatory parameter 
```puppet

 puppet resource google_cloud_dns_managed_zone 'my-zone-testsample1' ensure='present'
 
```
Create method called with invalid parameter 
```puppet

puppet resource google_cloud_dns_managed_zone 'my-zone-testsample1' ensure='presentt' project='graphite-development' dns_name='myzonegoogle.com.' description='Module Testing'

```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet

puppet resource google_cloud_dns_managed_zone 'List Manage zone' project='graphite-development' ensure='list'

```

List method called without mandatory parameter
```puppet

puppet resource google_cloud_dns_managed_zone 'List Manage zone' ensure='list'

```

List method called along with optional parameter
```puppet

puppet resource google_cloud_dns_managed_zone 'List Manage zone' project='graphite-development' ensure='list' max_results='10'

```

List method called with invalid parameter 
```puppet

puppet resource google_cloud_dns_managed_zone 'List Manage zone' project='graphite-development' ensure='lists'

```

## 3. GET
------------

Get method called along with mandatory parameter
```puppet

puppet resource google_cloud_dns_managed_zone 'my-new-zone' ensure='get' project='graphite-development'

```

Get method called along without mandatory parameter
```puppet

 puppet resource google_cloud_dns_managed_zone 'List Manage zone' ensure='get'
 
```

Get method called with invalid parameter 
```puppet

  puppet resource google_cloud_dns_managed_zone 'my-new-zone' ensure='gets' project='graphite-development'
  
```

## 4. DELETE
------------
Delete method called along with mandatory parameter 
```puppet

 puppet resource google_cloud_dns_managed_zone my-zone-testsample1 project='graphite-development' ensure='absent'
 
```

Delete method called along without mandatory parameter 
```puppet

puppet resource google_cloud_dns_managed_zone my-zone-testsample1 ensure='absent'

```

Delete method called with invalid parameter
```puppet

puppet resource google_cloud_dns_managed_zone my-zone-testsample1 project='graphite-development' ensure='absentt'

```
