## Examples

## METHOD 1 PUPPET APPLY
## Change Resource
### PREREQUISITE FOR CREATE METHOD
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

--------------

### 1. CREATE
------------
Change method called only with mandatory parameter
```puppet
 google_cloud_dns_change{'Create Changes':
    ensure      => 'present',
    project     => 'graphite-development',
    managed_zone => 'my-zone-testsample',
    additions => [
        {
            name => 'samplepuppet5.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        },
        {
            name => 'samplepuppet4.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        }
     ]
}
```

Change method called without mandatory parameter 
```puppet
google_cloud_dns_change{'Create Changes':
    ensure      => 'present',
    project     => 'graphite-development',
    managed_zone => 'my-zone-testsample',
		  }
```
Change method called with invalid parameter 
```puppet
google_cloud_dns_change{'Create Changes':
    ensure      => 'presentt',
    project     => 'graphite-development',
    managed_zone => 'my-zone-testsample',
    additions => [
        {
            name => 'samplepuppet5.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        },
        {
            name => 'samplepuppet4.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        }
     ]
}
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
 google_cloud_dns_change{'listchanges':
          ensure      => 'list',
		  project => 'graphite-development',
          managed_zone => 'my-zone-testsample'
          }
```

List method called along with optional parameter
```puppet
google_cloud_dns_change{'listchanges':
          ensure      => 'list',
		  project => 'graphite-development',
          managed_zone => 'my-zone-testsample',
		  max_results=>10,
		   }
```

List method called without mandatory parameter
```puppet
google_cloud_dns_change{'listchanges':
          ensure      => 'list',
		  }
```

List method called with invalid parameter 
```puppet
google_cloud_dns_change{'listchanges':
          ensure      => 'listt',
		  project => 'graphite-development',
          managed_zone => 'my-zone-testsample',
		  }
```

## 3. GET
------------

Get method called along with mandatory parameter
```puppet
google_cloud_dns_change{'0':
          ensure      => 'get',
		  project => 'graphite-development',
          managed_zone => 'my-zone-testsample',
		  }
```

Get method called along without mandatory parameter
```puppet
  google_cloud_dns_change{'getchanges':
          ensure      => 'get',
		  }
```

Get method called with invalid parameter 
```puppet
  google_cloud_dns_change{'getchanges':
          ensure      => 'gets',
		  project => 'graphite-development',
          managed_zone => 'my-zone-testsample',
		  id=>0
		  }
```

## 4. DELETE
------------

Change method called only with mandatory parameter
```puppet
 google_cloud_dns_change{'Create Changes':
    ensure      => 'present',
    project     => 'graphite-development',
    managed_zone => 'my-zone-testsample',
    deletions => [
        {
            name => 'samplepuppet5.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        },
        {
            name => 'samplepuppet4.myzonegoogle.com.',
            type => "TXT",ttl => "5",
            rrdatas => ["Added from Puppet"]
        }
     ]
}
```

## DELETING PREREQUISITE
------------

Delete method called along with mandatory parameter 
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'absent'
        }
```

----------------------

## METHOD 2 PUPPET RESOURCE COMMANDS

### PREREQUISITE FOR CREATE METHOD
------------
Create method called only with mandatory parameter 
```puppet

 puppet resource google_cloud_dns_managed_zone 'my-zone-testsample1' ensure='present' project='graphite-development' dns_name='myzonegoogle.com.' description='Module Testing'
 
```

--------------

### 1. CREATE
------------
Change method called only with mandatory parameter
```puppet

  puppet resource --debug google_cloud_dns_change "Create Changes" ensure='present' project='graphite-development' managed_zone='my-zone-testsample1' additions='[{"name": "samplepuppet6.myzonegoogle.com.","type": "TXT","ttl": "5","rrdatas": ["Added from Puppet"]}]'
  
```

Change method called without mandatory parameter 
```puppet

puppet resource --debug google_cloud_dns_change "Create Changes" ensure='present' project='graphite-development'

```
Change method called with invalid parameter 
```puppet

puppet resource --debug google_cloud_dns_change "Create Changes" ensure='presentt' project='graphite-development' managed_zone='my-zone-testsample1' additions='[{"name": "samplepuppet6.myzonegoogle.com.","type": "TXT","ttl": "5","rrdatas": ["Added from Puppet"]}]'

```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet

 puppet resource google_cloud_dns_change "List Changes" ensure='list' project='graphite-development' managed_zone='my-zone-testsample1'
 
```

List method called along with optional parameter
```puppet

puppet resource google_cloud_dns_change "List Changes" ensure='list' project='graphite-development' managed_zone='my-zone-testsample1' max_results=10

```

List method called without mandatory parameter
```puppet

puppet resource google_cloud_dns_change "List Changes" ensure='list'

```

List method called with invalid parameter 
```puppet

puppet resource google_cloud_dns_change "List Changes" ensure='listt' project='graphite-development' managed_zone='my-zone-testsample1'

```

## 3. GET
------------

Get method called along with mandatory parameter
```puppet

 puppet resource google_cloud_dns_change 0 ensure='get' project='graphite-development' managed_zone='my-zone-testsample1'
 
```

Get method called along without mandatory parameter
```puppet

 puppet resource google_cloud_dns_change 0 ensure='get' managed_zone='my-zone-testsample1'
 
```

Get method called with invalid parameter 
```puppet

  puppet resource google_cloud_dns_change 0 ensure='gets' project='graphite-development' managed_zone='my-zone-testsample'
  
```

## 4. DELETE
------------

Change method called only with mandatory parameter
```puppet

 puppet resource --debug google_cloud_dns_change "Create Changes" ensure='present' project='graphite-development' managed_zone='my-zone-testsample1' deletions='[{"name": "samplepuppet6.myzonegoogle.com.","type": "TXT","ttl": "5","rrdatas": ["Added from Puppet"]}]'
 
```

## DELETING PREREQUISITE
------------

Delete method called along with mandatory parameter 
```puppet

 puppet resource google_cloud_dns_managed_zone my-zone-testsample1 project='graphite-development' ensure='absent'
 
```
