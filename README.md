## Examples
## PUPPET APPLY
## Debugger Debuggee Resource
### 1. REGISTER
------------
Create method called only with mandatory parameter 
```puppet
google_cloud_debugger_debuggee {'Register Debugee':
ensure => 'register',
project => "graphite-development",
uniquifier => "graphite-development/1",
description => "testing register method",
agent_version => "google.com/gcp-java/v1.1"
}
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
google_cloud_debugger_debuggee{'List ':
ensure      => 'list',
project     => 'graphite-development',
}
```

## Debugger Debuggee Active Breakpoint

## 1. UPDATE
------------
List method called along with mandatory parameter 
```puppet
google_cloud_debugger_active_breakpoint {'538dc3a713839-d9eb-c7028':
ensure => 'update',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
location => {
line => 32
}
}
```

## 3. LIST
------------
Get method called along with mandatory parameter
```puppet
google_cloud_debugger_active_breakpoint {'list active breakpoint':
ensure => 'list',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d', 
}
```

## Debugger Breakpoint
### 1. SET
------------
Create method called only with mandatory parameter 
```puppet
google_cloud_debugger_breakpoint {'Set breakpoint':
ensure => 'present',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
client_version => "google.com/intellij/v1"
}
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
google_cloud_debugger_breakpoint {'list breakpoint':
ensure => 'list',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
client_version => "google.com/intellij/v1"
}
```

## 3. GET
------------
Get method called along with mandatory parameter
```puppet
google_cloud_debugger_breakpoint {'538dc3a713839-d9eb-c7028':
ensure => 'get',
client_version => "google.com/intellij/v1",
}
```
## 4. DELETE
------------
Delete method called along without mandatory parameter 
```puppet
google_cloud_debugger_breakpoint {'123':
ensure => 'absent',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
client_version => "google.com/intellij/v1"
    }
}
```
----------------------

## METHOD 2 PUPPET RESOURCE COMMANDS
## Debugger Debuggee Resource
### 1. REGISTER
------------
Create method called only with mandatory parameter 
```puppet
puppet resource google_cloud_debugger_debuggee "Register Debugee" ensure='register' project='graphite-development' uniquifier='graphite-development/1' description='testing register method' agent_version='google.com/gcp-java/v1.1'
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
puppet resource google_cloud_debugger_debuggee "List" ensure='list' project='graphite-development'
```

## Debugger Debuggee Active Breakpoint

## 1. LIST
------------
List method called along with mandatory parameter
```puppet
puppet resource google_cloud_debugger_active_breakpoint "list active breakpoint" ensure='list' debuggee_id='gcp:994996842918:5520b6c6188f9f2d'

```
## Debugger Breakpoint
### 1. SET
------------
Set method called only with mandatory parameter 
```puppet
puppet resource google_cloud_debugger_breakpoint "Set Breakpoint" ensure='present' debuggee_id='gcp:994996842918:5520b6c6188f9f2d' client_version='google.com/intellij/v1'
```

## 2. LIST
------------
List method called along with mandatory parameter 
```puppet
puppet resource google_cloud_debugger_breakpoint "list breakpoint" ensure='list' debuggee_id='gcp:994996842918:5520b6c6188f9f2d' client_version='google.com/intellij/v1'
```

## 4. DELETE
------------
Delete method called along without mandatory parameter 
```puppet
puppet resource google_cloud_debugger_breakpoint '123' ensure='absent' client_version='google.com/intellij/v1'
```
