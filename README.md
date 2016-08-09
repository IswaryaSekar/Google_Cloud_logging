## Manual TestCases

# Setup
# Installing the google_cloud_debugger module

Download and install googleclouddebugger module.

    puppet module install google_cloud_debugger
    
Install the required gems with this command:

    gem install google-api-client --no-ri --no-rdoc
    gem install inifile
    
Steps to Run Acceptance TestCases:

    $ git clone <repo url>
    $ cd <local repo path>
    $ bundle install
    $ sudo BEAKER_set=ubuntu_16_LTR_LTP  bundle exec rspec spec/acceptance
    
# Resources and Providers

## PUPPET APPLY
## Debugger Debuggee Resource
### 1. REGISTER
------------
Registers the debuggee with the controller service.

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
It registers and gives the debuggee_id as a response.

## Debugger Breakpoint
### 1. SET
------------
Sets the breakpoint to the debuggee.
By using the debuggee_id registered above, here breakpoint can be set to the debuggee.
The response will give us the breakpoint_id.

Set method called only with mandatory parameter 
```puppet
google_cloud_debugger_breakpoint {'Set breakpoint':
ensure => 'present',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
client_version => "google.com/intellij/v1"
}
```

## 2. GET
------------
Gets breakpoint information.

Get method called along with mandatory parameter
```puppet
google_cloud_debugger_breakpoint {'538dc3a713839-d9eb-c7028':
ensure => 'get',
client_version => "google.com/intellij/v1",
}
```

## 3. DELETE
------------
Deletes the breakpoint from the debuggee.

Delete method called along without mandatory parameter 
```puppet
google_cloud_debugger_breakpoint {'123':
ensure => 'absent',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
client_version => "google.com/intellij/v1"
    }
}
```

## Debugger Debuggee Active Breakpoint

## 1. UPDATE
------------
Updates the breakpoint state.

Update method called along with mandatory parameter 
```puppet
google_cloud_debugger_active_breakpoint {'538dc3a713839-d9eb-c7028':
ensure => 'update',
debuggee_id => 'gcp:994996842918:5520b6c6188f9f2d',
location => {
line => 32
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

## 3. DELETE
------------
Delete method called along without mandatory parameter 
```puppet
puppet resource google_cloud_debugger_breakpoint '123' ensure='absent' client_version='google.com/intellij/v1'
```

## Debugger Debuggee Active Breakpoint

## 1. LIST
------------
List method called along with mandatory parameter
```puppet
puppet resource google_cloud_debugger_active_breakpoint "list active breakpoint" ensure='list' debuggee_id='gcp:994996842918:5520b6c6188f9f2d'

```

