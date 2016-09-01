# Google Storage

## Table of Contents

    * [Google Storage Module](#Google_Storage_Module)
    * [Overview](#Overview)
    * [Scope](#Scope)
    * [Requirements](#Requirements)
    * [Platform Support](#Platform_Support)
    * [Dependencies](#Dependencies)
    * [Usage](#Usage)
    * [Configuring credentials](#Configuring_credentials)
    * [Resources Overview](#Resources_Overview)
    * [Examples](#Examples)

        * [bucket](#bucket)

        * [bucket_access_control](#bucket_access_control)

        * [default_object_access_control](#default_object_access_control)

        * [object](#object)

        * [object_access_control](#object_access_control)

    * [Properties](#properties)

        * [bucket Properties](#bucket_Properties)

        * [bucket_access_control Properties](#bucket_access_control_Properties)

        * [default_object_access_control Properties](#default_object_access_control_Properties)

        * [object Properties](#object_Properties)

        * [object_access_control Properties](#object_access_control_Properties)

    * [Methods](#methods)

        * [bucket Methods](#bucket_Methods)

        * [bucket_access_control Methods](#bucket_access_control_Methods)

        * [default_object_access_control Methods](#default_object_access_control_Methods)

        * [object Methods](#object_Methods)

        * [object_access_control Methods](#object_access_control_Methods)

    * [Development](#Development)
    * [License](#License)

## Overview

Google Cloud Storage offers developers and IT organizations
durable and highly available object storage.
Google created three simple product options to help you address
the needs of your applications while keeping your costs low.
These three product options use the same API,
providing you with a simple and consistent method of access.

To get an insight on the product, visit (Google Storage product overview) https://cloud.google.com/storage/  

## Scope

The google_storage module allows you to use the Puppet DSL
for storage of bucket and object along with access controls in google_storage.

## Requirements

* [google-api-ruby-client](`https://github.com/google/google-api-ruby-client`)

ruby gem

* Ruby 2.x, google-api-ruby-client won't work with 1.8.7 or 1.9.x

* Puppet 3.x / 4.x

## Platform Support

The following platforms have been tested with BEAKER/RSPEC:

```Matrix
|----------------+-----|
|                | 1.0 |
|----------------+-----|
| debian-7       |   X |
|----------------+-----|
| debian-8       |   X |
|----------------+-----|
| ubuntu-12.04   |   X |
|----------------+-----|
| ubuntu-14.04   |   X |
|----------------+-----|
| ubuntu-16.04   |   X |
|----------------+-----|
| centos-5       |   X |
|----------------+-----|
| centos-6       |   X |
|----------------+-----|
| centos-7       |   X |
|----------------+-----|
| fedora         |     |
|----------------+-----|
| openSUSE 13.2  |     |
|----------------+-----|
| openSUSE 42.1  |     |
|----------------+-----|
```

## Dependencies

There are no tightly coupled dependencies.

## Usage

Download and install  module.

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

--no-ri --no-rdoc- Use these flags to skip document generation for the gem and
speed up it's installation

inifile- This is a native Ruby package for reading and writing INI files. In
this module, when the value for 'Project' is not specified by user, it is
referred by default from this inifile.

## Configuring credentials

We use 'Google Application Default Credentials' to get authorization
credentials for use in calling Google APIs.
To set your credentials, please follow this:
[application-default-credentials]('https://developers.google.com/identity/protocols/application-default-credentials#howtheywork')

## Resources Overview

### Examples

#### bucket

The Buckets resource represents a bucket in Google Cloud Storage.
There is a single global namespace shared by all buckets.
For more information, see Bucket Name Requirements.

Buckets contain objects which can be accessed by their own methods.
In addition to the acl property, buckets contain bucketAccessControls,
for use in fine-grained manipulation of an existing bucket's access controls.

A bucket is always owned by the project team owners group.

```puppet
google_storage_bucket{'puppet-bucket-testing1':
            ensure  => 'present',
            bucket  => 'puppet-bucket-testing1',
            project => 'graphite-development',
        }
```

#### bucket_access_control

The BucketAccessControls resource represents the Access Control Lists (ACLs)
for buckets within Google Cloud Storage.
ACLs let you specify who has access to your data and to what extent.

```puppet
google_storage_bucket_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            role   => 'OWNER',
            }

```

#### default_object_access_control

The DefaultObjectAccessControls resources represent the Access Control Lists (ACLs)
applied to a new object within Google Cloud Storage
when no ACL was provided for that object.
ACLs let you specify who has access to your data and to what extent.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            object => 'puppet-object',
            role   => 'OWNER',
            }
```

#### object

The Objects resource represents an object within Google Cloud Storage.
Objects are pieces of data that you have uploaded to Google Cloud Storage.
For more information, see Object Name Requirements.

Every object in Google Cloud Storage resides in a bucket.
The object is owned by its original uploader,
who will always retain OWNER permission on it.

In addition to the acl property, objects contain objectAccessControls,
for use in fine-grained manipulation of an existing object's access controls.

```puppet
google_storage_object{'puppet-object':
            ensure        => 'present',
            bucket        => 'puppet-bucket-testing1',
            upload_source => 'metadata.json',
            content_type  => 'text/plain',
        }
```

#### object_access_control

The ObjectAccessControls resources represent the Access Control Lists (ACLs)
for objects within Google Cloud Storage.
ACLs let you specify who has access to your data and to what extent.

```puppet
google_storage_object_access_control{'group-cloud-logs@google.com':
            ensure => 'present',
            bucket => 'puppet-bucket-testing1',
            object => 'puppet-object',
            role   => 'OWNER',
            }
            }
```

### Properties

#### bucket Properties

* `acl` - Access controls on the bucket.

* `bucket` - Name of a bucket. If unspecified,

by default this value is fetched from config file.

Needed for update, delete Needed for update, delete

* `cors` - The bucket's Cross-Origin Resource Sharing (CORS) configuration.

* `default_object_acl` - Default access controls to apply

to new objects when no ACL is provided.

* `etag` - HTTP 1.1 Entity tag for the bucket.

* `id` - The ID of the bucket.

* `if_metageneration_match` - If set, only deletes the bucket

if its metageneration matches this value. Needed for delete

* `if_metageneration_not_match` - If set, only deletes the bucket

if its metageneration does not match this value. Needed for delete

* `kind` - The kind of item this is. For buckets, this is always storage#bucket.

* `lifecycle` - The bucket's lifecycle configuration.

See lifecycle management for more information.

* `location` - The location of the bucket.

Object data for objects in the bucket resides in physical storage

within this region. Defaults to US.

See the developer's guide for the authoritative list.

* `logging` - The bucket's logging configuration,

which defines the destination bucket and optional name prefix
for the current bucket's logs.

* `max_results` - Maximum number of buckets to return.

Needed for list Needed for list

* `metageneration` - The metadata generation of this bucket.

* `name` - The name of the bucket.

* `owner` - The owner of the bucket. This is always the project team's owner group.

* `page_token` - A previously-returned page token representing part

of the larger set of results to view.

Needed for list Needed for list

* `predefined_acl` - Apply a predefined set of access controls to this bucket.

(Acceptable values are: "authenticatedRead", "private",
"projectPrivate", "publicRead", "publicReadWrite") Needed for insert

* `predefined_default_object_acl` -

Apply a predefined set of default object access controls to this bucket.
(Acceptable values are: "authenticatedRead", "bucketOwnerFullControl",
"bucketOwnerRead", "private", "projectPrivate", "publicRead")Needed for insert

* `prefix` - Filter results to buckets whose names begin with this prefix.

Needed for list Needed for list

* `project` - A valid API project identifier.

Needed for list, insert Needed for list, insert

* `project_number` - The project number of the project the bucket belongs to.

* `projection` - Set of properties to return. Defaults to full.

(Acceptable values are: "full", "noAcl")
Needed for update, list, insert Needed for update, list, insert

* `self_link` - The URI of this bucket.

* `storage_class` - The bucket's storage class.

This defines how objects in the bucket are stored
and determines the SLA and the cost of storage.
Values include STANDARD, NEARLINE and DURABLE_REDUCED_AVAILABILITY.
Defaults to STANDARD. For more information, see storage classes.

* `time_created` - The creation time of the bucket in RFC 3339 format.

* `updated` - The modification time of the bucket in RFC 3339 format.

* `versioning` - The bucket's versioning configuration.

* `website` - The bucket's website configuration,

controlling how the service behaves when accessing bucket contents as a web site.
See the Static Website Examples for more information.

#### bucket_access_control Properties

* `bucket` - The name of the bucket.

* `domain` - The domain associated with the entity, if any.

* `email` - The email address associated with the entity, if any.

* `entity` - The entity holding the permission, in one of the following forms:

    user-userId

    user-email

    group-groupId

    group-email

    domain-domain

    project-team-projectId

    allUsers

   allAuthenticatedUsers

Examples:

 The user liz@example.com would be `user-liz@example.com`.
 The group `example@googlegroups.com` would be `group-example@googlegroups.com`.
 To refer to all members of the Google Apps for Business domain `example.com`,
 the entity would be `domain-example.com`.

* `entity_id` - The ID for the entity, if any.

* `etag` - HTTP 1.1 Entity tag for the access-control entry.

* `id` - The ID of the access-control entry.

* `kind` - The kind of item this is.

For bucket access control entries,this is always storage#bucketAccessControl.

* `project_team` - The project team associated with the entity, if any.

* `role` - The access permission for the entity.

* `self_link` - The link to this access-control entry.

#### default_object_access_control Properties

* `bucket` - The name of the bucket.

* `domain` - The domain associated with the entity, if any.

* `email` - The email address associated with the entity, if any.

* `entity` - The entity holding the permission, in one of the following forms:

  user-userId

  user-email

  group-groupId

  group-email

 domain-domain

 project-team-projectId

 allUsers

 allAuthenticatedUsers

Examples:

 The user liz@example.com would be 'user-liz@example.com'.
 The group 'example@googlegroups.com' would be 'group-example@googlegroups.com'.
 To refer to all members of the Google Apps for Business domain 'example.com',
 the entity would be 'domain-example.com'.

* `entity_id` - The ID for the entity, if any.

* `etag` - HTTP 1.1 Entity tag for the access-control entry.

* `generation` - The content generation of the object.

* `id` - The ID of the access-control entry.

* `if_metageneration_match` - If present, only return default ACL

listing if the bucket's current metageneration matches this value.
Needed for list Needed for list

* `if_metageneration_not_match` - If present, only return default ACL

listing if the bucket's current metageneration does not match the given value.
Needed for list Needed for list

* `kind` - The kind of item this is. For object access control entries,

this is always storage#objectAccessControl.

* `object` - The name of the object.

* `project_team` - The project team associated with the entity, if any.

* `role` - The access permission for the entity.

* `self_link` - The link to this access-control entry.

#### object Properties

* `acl` - Access controls on the object.

* `bucket` - The name of the bucket containing this object.

* `cache_control` - Cache-Control directive for the object data.

If omitted, and the object is accessible to all anonymous users,
the default will be public, max-age=3600.

* `component_count` - Number of underlying components

that make up this object. Components are accumulated by compose operations.

* `content_disposition` - Content-Disposition of the object data.

* `content_encoding` - Content-Encoding of the object data.

* `content_language` - Content-Language of the object data.

* `content_type` - Content-Type of the object data.

If contentType is not specified, object downloads will be served as application/octet-stream.

* `crc32c` - CRC32c checksum, as described in RFC 4960,

Appendix B; encoded using base64 in big-endian byte order.
For more information about using the CRC32c checksum,
see Hashes and ETags: Best Practices.

* `customer_encryption` - Metadata of customer-supplied encryption key,

if the object is encrypted by such a key.

* `delimiter` - Returns results in a directory-like mode.

Items will contain only objects whose names, aside from the prefix,
do not contain delimiter.
Objects whose names, aside from the prefix,
contain delimiter will have their name,
truncated after the delimiter, returned in prefixes.
Duplicate prefixes are omitted. Needed for list Needed for list

* `etag` - HTTP 1.1 Entity tag for the object.

* `generation` - The content generation of this object. Used for object versioning.

* `id` - The ID of the object.

* `if_generation_match` - Makes the operation conditional on

whether the object's current generation matches the given value. Needed for insert

* `if_generation_not_match` - Makes the operation conditional on whether the object's

current generation does not match the given value. Needed for insert

* `if_metageneration_match` - Makes the operation conditional on whether the object's

current metageneration matches the given value. Needed for insert

* `if_metageneration_not_match` - Makes the operation conditional on whether

the object's current metageneration does not match the given value.
Needed for insert

* `kind` - The kind of item this is. For objects, this is always storage#object.

* `max_results` - Maximum number of items plus prefixes to return.

As duplicate prefixes are omitted,
fewer total results may be returned than requested.

The default value of this parameter is 1,000 items. Needed for list Needed for list

* `md5_hash` - MD5 hash of the data;encoded using base64.

For more information about using the MD5 hash,
see Hashes and ETags: Best Practices.

* `media_link` - Media download link.

* `metadata` - User-provided metadata, in key/value pairs.

* `metageneration` - The version of the metadata for this object at this generation.

Used for preconditions and for detecting changes in metadata.

A metageneration number is only meaningful in the context of a particular generation
of a particular object.

* `name` - The name of this object. Required if not specified by URL parameter.

* `object` - Name of the object. For information about how

to URL encode object names to

be path safe, see Encoding URI Path Parts.
If unspecified, by default this value is fetched
from config file. Needed for update, delete Needed for update, delete

* `owner` - The owner of the object. This will always be the uploader of the object.

* `page_token` - A previously-returned page token

representing part of the larger set of results to view.
Needed for list Needed for list

* `predefined_acl` - Apply a predefined set of access controls to this object.

(Acceptable values are: "authenticatedRead",
"bucketOwnerFullControl", "bucketOwnerRead",
"private", "projectPrivate", "publicRead") Needed for insert

* `prefix` - Filter results to objects whose names

begin with this prefix. Needed for list Needed for list

* `projection` - Set of properties to return. Defaults to full.

(Acceptable values are: "full", "noAcl")
Needed for update, list, insert Needed for update, list, insert

* `self_link` - The link to this object.

* `size` - Content-Length of the data in bytes.

* `storage_class` - Storage class of the object.

* `time_created` - The creation time of the object in RFC 3339 format.

* `time_deleted` - The deletion time of the object in RFC 3339 format.

Will be returned if and only if this version of the object has been deleted.

* `updated` - The modification time of the object metadata in RFC 3339 format.

* `upload_source` - IO stream or filename containing content

to upload Needed for insert Needed for insert

* `versions` - If true, lists all versions of an object as distinct results.

The default is false. For more information,
see Object Versioning. Needed for list Needed for list

#### object_access_control Properties

* `bucket` - The name of the bucket.

* `domain` - The domain associated with the entity, if any.

* `email` - The email address associated with the entity, if any.

* `entity` - The entity holding the permission in one of the following forms.

* `user-email

 group-groupId

 group-email

 domain-domain

 project-team-projectId

 allUsers

 allAuthenticatedUsers

Examples:

 The user `liz@example.com` would be `user-liz@example.com`.
 The group `example@googlegroups.com` would be `group-example@googlegroups.com`.
 To refer to all members of the Google Apps for Business domain `example.com`,
the entity would be `domain-example.com`.

* `entity_id` - The ID for the entity, if any.

* `etag` - HTTP 1.1 Entity tag for the access-control entry.

* `generation` - The content generation of the object.

* `id` - The ID of the access-control entry.

* `kind` - The kind of item this is.

For object access control entries, this is always storage#objectAccessControl.

* `object` - The name of the object.

* `project_team` - The project team associated with the entity, if any.

* `role` - The access permission for the entity.

* `self_link` - The link to this access-control entry.

### Methods

#### bucket Methods

* `delete` - Permanently deletes an empty bucket.

* `insert` - Creates a new bucket.

* `list` - Retrieves a list of buckets for a given project.

* `update` - Updates a bucket.

#### bucket_access_control Methods

* `delete` - Permanently deletes the ACL entry

for the specified entity on the specified bucket.

* `insert` - Creates a new ACL entry on the specified bucket.

* `list` - Retrieves ACL entries on the specified bucket.

* `update` - Updates an ACL entry on the specified bucket.

#### default_object_access_control Methods

* `delete` - Permanently deletes the default object ACL entry

for the specified entity on the specified bucket.

* `insert` - Creates a new default object ACL entry on the specified bucket.

* `list` - Retrieves default object ACL entries on the specified bucket.

* `update` - Updates a default object ACL entry on the specified bucket.

#### object Methods

* `delete` - Deletes an object and its metadata.

Deletions are permanent

if versioning is not enabled for the bucket, or if the generation parameter is used.

* `insert` - Stores a new object and metadata.

* `list` - Retrieves a list of objects matching the criteria.

* `update` - Updates an object's metadata.

#### object_access_control Methods

* `delete` - Permanently deletes the ACL entry

for the specified entity on the specified object.

* `insert` - Creates a new ACL entry on the specified object.

* `list` - Retrieves ACL entries on the specified object.

* `update` - Updates an ACL entry on the specified object.

## Development

Much of the code for this module is auto-generated using the
puppet-swagger-generator project. This means modifications to the resources
and providers should be done there, rather than within this project. Files
which are auto-generated should have a suitable comment indicating as such.

## License

Copyright 2016 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
[License](`http://www.apache.org/licenses/LICENSE-2.0/`)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
