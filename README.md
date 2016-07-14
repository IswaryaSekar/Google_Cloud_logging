## Examples

## METHOD 1 PUPPET APPLY
## ResourceRecordSet Resource
### PREREQUISITE FOR LIST METHOD
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

when change method called only with mandatory parameter
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

## 1. LIST
------------
List method called along with mandatory parameter 
```puppet
 google_cloud_dns_resource_record_set{'myzonegoogle.com.':
		project     => 'graphite-development',
          ensure      => 'list',
		  managed_zone    => 'my-zone-testsample'
		  }
```

List method called along with optional parameter
```puppet
google_cloud_dns_resource_record_set{'myzonegoogle.com.':
		project     => 'graphite-development',
          ensure      => 'list',
		  managed_zone    => 'my-zone-testsample',
		  max_results => 10,
		   }
}
```

List method called without mandatory parameter
```puppet
 google_cloud_dns_resource_record_set{'my-zone-testsample':
	  ensure      => 'list',
		  }
```

List method called with invalid parameter 
```puppet
google_cloud_dns_resource_record_set{'my-zone-testsample':
		project     => 'graphite-development',
          ensure      => 'lists',
		  max_results => 10,
		  page_token  => 'my-zone-testsample'
		  }
```

## DELETING PREREQUISITE
------------

when change method called only with mandatory parameter
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

Delete method called along with mandatory parameter 
```puppet
 google_cloud_dns_managed_zone{'my-zone-testsample':
		project     => 'graphite-development',
        ensure      => 'absent'
        }
```
