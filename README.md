1. [Overview](#overview)
2. [Description - What the module does and why it is useful](#description)
3. [Setup](#setup)
  * [Requirements](#requirements)
  * [Installing the google_cloud_dns cookbook](#installing-the-google_cloud_dns-module)
4. [Getting Started with google_cloud_DNS](#getting-started-with-google_cloud_DNS)
5. [Limitations - OS compatibility, etc.](#limitations)

# Overview

Google Cloud DNS is an authoritative Domain Name System (DNS) service running on the same infrastructure as Google.
It lets you publish your domain names using Google's infrastructure for production-quality, high-volume DNS services. 

To get more insight on the product, visit [Cloud DNS product overview](https://cloud.google.com/dns/)

The google_cloud_dns cookbook allows you to use the Puppet DSL for managing zones and resource record sets in google's cloud dns. 

# Description

The module allows for defining google_cloud_dns resources in Puppet, and then for Puppet to create or update those resources. 
This improves on the basic YAML file approach in a few ways:

* The Puppet language supports logic and abstractions, 
  allowing for the crafting of business specific user 
  interfaces and avoiding repetition
* Modifications can be made to the Puppet code and Puppet will handle
  updating the relevant resources, without having to describe the full
  state of the resource
* Puppet supports relationships between resources, so you can enforce
  ordering where necessary

The user interface of the Puppet code however follows the API/YAML
format exactly. This allows for a familiar interface for anyone used to
the Google API, at the same time as providing a low level building
block for creating higher level types.

# Setup

Note that the following assumes you have already created Google Account (https://cloud.google.com/).

## Requirements

* [google-api-ruby-client](https://github.com/google/google-api-ruby-client) ruby gem
* Ruby 2.x, google-api-ruby-client
* Puppet 3.x and 4.x

## Installing the google_cloud_dns module

Download and install googleclouddns module as you would for other modules.

    puppet module install googleclouddns 
    puppet module build googleclouddns
    
Install the required gems with this command:

    /opt/Puppet-manage/embedded/bin/gem install google-api-client --no-ri --no-rdoc

#### Configuring credentials

We use 'Google Application Default Credentials' to get authorization credentials 
for use in calling Google APIs.

To set your crendentials, please follow this: 
https://developers.google.com/identity/protocols/application-default-credentials#howtheywork

# Getting started with google_cloud_DNS
(DNS - Domain Name System) 

# Resources and Providers
This modules provides a resource and its corresponding provider.

## ACTIONS:

### CREATE

Create action handles the following:

* Create Managed zone
* Add Resource Record Set
* Update Resource Record Set
* Delete Resource Record Set

###### Managed Zone: 

* Create a Managed Zone if it does not exist.
* Throw an error if attempt is made to update managed zone name and dns_name.

###### Resource Record Set: 

* Create a Resource Record Set collection if it does not exist in the managed zone and update if it already exists
* Only 'ttl' and 'rrdatas' can be updated in an existing record set.
* If an attempt is made to update 'name' and 'type' of an existing record set, a new record set is created.

This will create a new managed zone named 'simplezone' with resource record sets

```Puppet
google_cloud_dns{'my-zone-testsample':  
    ensure => 'present',
    project => 'graphite-development',
    zone =>  
         {
            dns_name => 'myzonegoogle.com.',
            description => 'testing description',
            resource_record_sets => {
                additions => [
                    {
                        name => 'samplepuppet1.myzonegoogle.com.',
                        type => "A",
                        ttl => "5",
                        rrdatas => ['1.0.0.0']
                    }
                ]
				}}
				}
    
```

This will delete the resource record set 

```Puppet
google_cloud_dns{'my-zone-testsample':
        ensure => 'absent',
        project => 'graphite-development',
        }
    
```

### UPDATE     

Manage action handles the following:

* Add Resource Record Set
* Update Resource Record Set
* Delete Resource Record Set

###### Resource Record Set: 

* Modify an existing managed zone/Resource Record Set Collection.
* No error thrown if managed zone/Resource Record Set Collection is not available.
* Throw an error if the resource cannot be updated.

Example for manage google_cloud_dns resources

```Puppet

google_cloud_dns{'my-zone-testsample':  
    ensure => 'present',
    project => 'graphite-development', 
    zone =>  
         {
            dns_name => 'myzonegoogle.com.',
            description => 'testing description',
            resource_record_sets => {
                additions => [
                    {
                        name => 'samplepuppet1.myzonegoogle.com.',
                        type => "A",
                        ttl => "5",
                        rrdatas => ['0.0.0.0']
                    }
                ]
                }
            }
}
    
```

### UPDATE   

Update action handles the following:

* Add Resource Record Set
* Update Resource Record Set
* Delete Resource Record Set

###### Resource Record Set: 
   
* Update an existing managed zone/Resource Record Set Collection.
* Throw an error if managed zone/Resource Record Set Collection is not available. 

Example for modify google_cloud_dns resources

```Puppet

project 'graphite-development' //optional, By default should read from gcloud config
zones [   //Supports Creation of multiple zones
            {
            name => 'simple-zone'
            resource_record_sets => {
                additions => [
                    {
                        name => 'samplepuppet1.mygoogle.com.',
                        type => "A",
                        ttl => "5",
                        rrdatas => ['1.0.0.0']
                    }
                ],
                deletions => [
                    {
                        name => 'samplepuppet2.mygoogle.com.',
                        type => "A",
                        ttl => "5",
                        rrdatas => ['0.0.0.0']
                    }
                ]
                }
            }
        ]
    end
    
```

### GET   

Get action handles the following:

* Get Managed zone
* Get Resource Record Set

###### Managed zone/Resource Record Set: 

* Gets the managed zone details along with the resource record sets. 
* When managed zone is not passed to the Get action, it lists all the managed zones present in a project.

In addition to creating and managing resources this module supports printing the response in the console by using the `get` method.
This will get details of the managed zone and its resource record sets.

```Puppet

  google_cloud_dns{'Cloud DNS':
        ensure => 'get',
        project => 'graphite-development',
        zones => [   //Displays multiple Zone Details
          {name => 'simple-zone'},
          {name => 'simple-zone2'}   
        ]
    }

```

### LIST   

List action handles the following:

* List Managed zone
* List Resource Record Set

###### Managed zone/Resource Record Set: 

* Lists the managed zone details along with the resource record sets. 

Example for List resources

```Puppet

 google_cloud_dns{'Cloud DNS':
        ensure => 'list',
        project => 'graphite-development',
    }

   
```

### DELETE   

Delete action handles the following:

* Delete Managed zone
* Delete Resource Record Set

###### Managed zone/Resource Record Set: 

* Deletes an existing managed zone/ Resource Record Set. 
* Deletes the user added record sets first and then the managed zone. 

This will delete the managed zone and its resource record sets

```Puppet
 google_cloud_dns{'Cloud DNS':
        ensure => 'absent',
        project => 'graphite-development',
        zones => [   //Supports deletion of multiple zones
          {name => 'simple-zone'},
          {name => 'simple-zone2'}   
        ]
    }

```

# Limitations

This module is a proof of concept, demonstrating both the power of
auto-generating Puppet resourcesand providers from Swagger specifications
and of managing higher level tools like Google Cloud with Puppet. It
likely has several bugs and rough edges at the moment. Please report
those on GitHub.

# Development

Much of the code for this module is auto-generated using the
Puppet-swagger-generator project. This means modifications to the resources and providers should be
done there, rather than within this project. Files which are
auto-generated should have a suitable comment indicating as such.
