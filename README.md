## Examples
## PUPPET APPLY
## ProjectLog Resource
### 1. WRITE
------------
Writes log entries to Stackdriver Logging. All log entries are written by this method.

Create method called only with mandatory parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "write",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
Create method called without mandatory parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "write",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
Create method called with invalid parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "writes",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
## 2. LIST
------------
Lists the monitored resource descriptors used by Stackdriver Logging.

List method called along with mandatory parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "list",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
List method called without mandatory parameter
```puppet
google_cloud_logging_project_log{'testname':
ensure => "list",
project => "graphite-development",
}
```
List method called with invalid parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "lists",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
## 3. DELETE
------------
Deletes a log and all its log entries. The log will reappear if it receives new entries.

Delete method called along with mandatory parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "delete",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "global" }
}]
}
```
Delete method called along without mandatory parameter 
```puppet
google_cloud_logging_project_log{'testname':
ensure => "delete",
        }
```
Delete method called with invalid parameter
```puppet
google_cloud_logging_project_log{'testname':
ensure => "delete",
project => "graphite-development",
entries => [{
textPayload => "testing log entry",
resource=> {
type => "" }
}]
}
```
## ProjectMetric Resource
### 1. CREATE
------------
Creates a logs-based metric.

Create method called only with mandatory parameter 
```puppet
google_cloud_logging_project_metric{'my_metric':
ensure => "present",
parent => "projects/graphite-development",
description => "test descriptions",
filter => " logName:syslog AND severity>=ERROR"
}
```

## 2. LIST
------------
Lists logs-based metrics.

List method called along with mandatory parameter 
```puppet
google_cloud_logging_project_metric{'my_metric':
ensure => "list",
parent => "projects/graphite-development",
description => "test descriptions",
filter => " logName:syslog AND severity>=ERROR"
}
```

## 3. GET
------------
Gets a logs-based metric.

Get method called along with mandatory parameter
```puppet
google_cloud_logging_project_metric{'my_metric':
ensure => "get",
parent => "projects/graphite-development",
description => "test descriptions",
filter => " logName:syslog AND severity>=ERROR"
}
```
## 4. DELETE
------------
Deletes a logs-based metric.

Delete method called along with mandatory parameter 
```puppet
google_cloud_logging_project_metric{'my_metric':
ensure => "absent",
parent => "projects/graphite-development",
description => "test descriptions",
filter => " logName:syslog AND severity>=ERROR"
}
```
## ProjectSink Resource
### 1. CREATE
------------
Creates a sink.

Create method called only with mandatory parameter 
```puppet
google_cloud_logging_project_sink{'my_sink':
ensure => "present",
destination => "storage.googleapis.com/unit_acceptance_dont_delete",
parent => "projects/graphite-development",
filter => "logName:syslog AND severity>=ERROR",
output_version_format => "V2",
}
```

## 2. LIST
------------
Lists sinks.

List method called along with mandatory parameter 
```puppet
google_cloud_logging_project_sink{'my_sink':
ensure => "list",
parent => "projects/graphite-development",
}
```

## 3. GET
------------
Gets a sink.

Get method called along with mandatory parameter
```puppet
google_cloud_logging_project_sink{'my_sink':
ensure => "get",
parent => "projects/graphite-development",
}
```
## 4. DELETE
------------
Deletes a sink.

Delete method called along with mandatory parameter 
```puppet
google_cloud_logging_project_sink{'my_sink':
ensure => "absent",
parent => "projects/graphite-development",
output_version_format => "V2",
}
```
----------------------

## METHOD 2 PUPPET RESOURCE COMMANDS
## ProjectMetric Resource
### 1. CREATE
------------
Create method called only with mandatory parameter 
```puppet
puppet resource google_cloud_logging_project_metric 'my_metric1' ensure='present' parent='projects/graphite-development' description='test description' filter='logName:syslog AND severity>=ERROR'
 
```
## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
puppet resource google_cloud_logging_project_metric 'my_metric1' ensure='list' parent='projects/graphite-development' description='test description' filter='logName:syslog AND severity>=ERROR'
```
## 3. GET
------------
Get method called along with mandatory parameter
```puppet
puppet resource google_cloud_logging_project_metric 'my_metric1' ensure='get' parent='projects/graphite-development' description='test description' filter='logName:syslog AND severity>=ERROR'
```
## 4. DELETE
------------
Delete method called along with mandatory parameter 
```puppet
puppet resource google_cloud_logging_project_metric 'my_metric1' ensure='absent' parent='projects/graphite-development' description='test description' filter='logName:syslog AND severity>=ERROR'
 
```

## ProjectSink Resource
### 1. CREATE
------------
Create method called only with mandatory parameter 
```puppet
puppet resource google_cloud_logging_project_sink 'my_sink1' ensure='present' destination='storage.googleapis.com/container_gcp' parent='projects/graphite-development' filter='logName:syslog AND severity>=ERROR' output_version_format='V2'
 
```
## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
puppet resource google_cloud_logging_project_sink 'my_sink1' ensure='list' parent='projects/graphite-development'
```
## 3. GET
------------
Get method called along with mandatory parameter
```puppet
puppet resource google_cloud_logging_project_sink 'my_sink1' ensure='get' parent='projects/graphite-development'
```
## 4. DELETE
------------
Delete method called along with mandatory parameter 
```puppet
 puppet resource google_cloud_logging_project_sink 'my_sink1' ensure='absent' parent='projects/graphite-development' output_version_format='V2'
 
```
