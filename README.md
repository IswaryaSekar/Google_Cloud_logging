# gclogging

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with gclogging](#setup)
    * [What gclogging affects](#what-gclogging-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with gclogging](#beginning-with-gclogging)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs package for Google Cloud Logging and starts the agent (google-fluentd).

This module does the following:

   * Configures the required apt or yum repository. The environment variable REPO_SUFFIX can be set to alter which repository is used. * A dash (-) will be inserted prior to the supplied suffix. Example values are 'unstable' or '20151027-1'.
   * Installs the logging agent.
   *Installs "catch-all" configuration files (unless the environment variable DO_NOT_INSTALL_CATCH_ALL_CONFIG is set to suppress this.)
   *Starts the logging agent.
   *Sends a test message which should be visible in the log viewer.

Google Cloud Logging collects and stores logs from applications and services on the Google Cloud Platform:

   *View your logs with the Logs Viewer, including third-party logs from your virtual machine instances.
   *Export your logs to Google Cloud Storage, Google BigQuery, or Google Cloud Pub/Sub.
   *Create logs-based metrics to use for monitoring and alerting in Google Cloud Monitoring.
   *Get immutable audit logs for auditing and compliance.
   *Use the Cloud Logging API to read, write, and configure logs.

## Setup

### What gclogging affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

### Beginning with gclogging

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
