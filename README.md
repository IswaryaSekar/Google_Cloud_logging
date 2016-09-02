# Google Storage

## Table of Contents

* [Google Storage Module](#Google_Storage_Module)
  * [Setup](#Setup)
  * [Installing the Google Storage module](#Installing_the_Google_Storage_module)
  * [Steps to follow for running the examples](#Steps_to_follow_for_running_the_examples)
  * [Resources and Providers](#Resources_and_Providers)

    * [bucket](bucket)

      * [delete](delete)

      * [insert](insert)

      * [list](list)

      * [update](update)

    * [bucket_access_control](bucket_access_control)

      * [delete](delete)

      * [insert](insert)

      * [list](list)

      * [update](update)

    * [default_object_access_control](default_object_access_control)

      * [delete](delete)

      * [insert](insert)

      * [list](list)

      * [update](update)

    * [object](object)

      * [delete](delete)

      * [insert](insert)

      * [list](list)

      * [update](update)

    * [object_access_control](object_access_control)

      * [delete](delete)

      * [insert](insert)

      * [list](list)

      * [update](update)

## Setup

### Installing the Google Storage module

Download and install Google Storage module.

```puppet
puppet module install google_storage
```

Install the required gems:

```puppet
gem install google-api-client --no-ri --no-rdoc
gem install inifile
```

Info:
google-api-client - The Google API Ruby Client to discover and access supported
APIs
--no-ri --no-rdoc- Use these flags to skip document generation
for the gem and speed up it's installation
inifile  - This is a native Ruby package for reading and writing INI files.
In this module, when the value for 'Project' is not specified by user,
it is referred by default from this inifile

## Steps to follow for running the examples

```puppet
puppet apply "EXAMPLE.PP"
```

## Resources and Providers

### bucket

#### delete bucket

Permanently deletes an empty bucket.

```puppet
google_storage_bucket{'puppet-bucket-testing1':
            ensure  => 'absent',
            bucket  => 'puppet-bucket-testing1',
            project => 'graphite-development',
        }

```

#### insert bucket

Creates a new bucket.

```puppet
google_storage_bucket{'puppet-bucket-testing1':
            ensure  => 'present',
            bucket  => 'puppet-bucket-testing1',
            project => 'graphite-development',
        }
```

#### list bucket

Retrieves a list of buckets for a given project.

```puppet
puppet resource google_storage_bucket
```

#### update bucket

Updates a bucket.

```puppet
google_storage_bucket{'puppet-bucket-testing1':
          ensure  => 'present',
          acl     => [{
          entity => 'group-cloud-logs@google.com' ,
          role   => 'OWNER'
          }]
          bucket  => 'puppet-bucket-testing1'
          project => 'graphite-development',
          }
```

### bucket_access_control

#### delete bucket_access_control

Permanently deletes the ACL entry for the specified entity on the specified bucket.

```puppet
google_storage_bucket_access_control{'group-cloud-logs@google.com':
          ensure => 'absent',
          bucket => 'puppet-bucket-testing1',
          role   => 'OWNER',
      }

```

#### insert bucket_access_control

Creates a new ACL entry on the specified bucket.

```puppet
google_storage_bucket_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            role   => 'OWNER',
            }

```

#### list bucket_access_control

Retrieves ACL entries on the specified bucket.

```puppet
puppet resource google_storage_bucket_access_control
```

#### update bucket_access_control

Updates an ACL entry on the specified bucket.

```puppet
google_storage_bucket_access_control{'group-cloud-logs@google.com':
          ensure => 'present',
          bucket => 'puppet-bucket-testing1',
          role   => 'OWNER',
      }
```

### default_object_access_control

#### delete default_object_access_control

Permanently deletes the default object ACL entry
for the specified entity on the specified bucket.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
          ensure => 'absent',
          bucket => 'puppet-bucket-testing1',
          object => 'puppet-object',
          role   => 'OWNER',
      }

```

#### insert default_object_access_control

Creates a new default object ACL entry on the specified bucket.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            object => 'puppet-object',
            role   => 'OWNER',
            }

```

#### list default_object_access_control

Retrieves default object ACL entries on the specified bucket.

```puppet
puppet resource google_storage_default_object_access_control
```

#### update default_object_access_control

Updates a default object ACL entry on the specified bucket.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
          ensure => 'present',
          bucket => 'puppet-bucket-testing1',
          object => 'puppet-object',
          role   => 'OWNER',
      }
```

### object

#### delete object

Deletes an object and its metadata.
Deletions are permanent if versioning is not enabled for the bucket,
or if the generation parameter is used.

```puppet
google_storage_object{'puppet-object':
            ensure        => 'absent',
            bucket        => 'puppet-bucket-testing1',
            upload_source => 'metadata.json',
            content_type  => 'text/plain',
    }
```

#### insert object

Stores a new object and metadata.

```puppet
google_storage_object{'puppet-object':
            ensure        => 'present',
            bucket        => 'puppet-bucket-testing1',
            upload_source => 'metadata.json',
            content_type  => 'text/plain',
        }

```

#### list object

Retrieves a list of objects matching the criteria.

```puppet
puppet resource google_storage_object
```

#### update object

Updates an object's metadata.

```puppet
google_storage_object{'puppet-object':
          ensure           => 'present',
          acl              => [{
          entity => 'group-cloud-logs@google.com' ,
          role   => 'OWNER'
          }]
          bucket           => 'puppet-bucket-testing1',
          content_encoding => 'metadata.json',
          upload_source    => 'text/plain',
          }
```

### object_access_control

#### delete object_access_control

Permanently deletes the ACL entry for the specified entity on the specified object.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
          ensure => 'absent',
          bucket => 'puppet-bucket-testing1',
          object => 'puppet-object',
          role   => 'OWNER',
      }
```

#### insert object_access_control

Creates a new ACL entry on the specified object.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            object => 'puppet-object',
            role   => 'OWNER',
            }
```

#### list object_access_control

Retrieves ACL entries on the specified object.

```puppet
puppet resource google_storage_object_access_control
```

#### update object_access_control

Updates an ACL entry on the specified object.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
          ensure => 'present',
          bucket => 'puppet-bucket-testing1',
          object => 'puppet-object',
          role   => 'OWNER',
      }
```
