## Scenario-1

* Get a list of processes that are using more than 100mb of RAM

### PowerShell Script:
```powershell
# Get a list of processes using more than 100 MB of RAM
Get-Process | Where-Object { $_.WorkingSet64 -gt 100MB } | Select-Object Name, ID, @{Name="Memory (MB)"; Expression={ [math]::round($_.WorkingSet64 / 1MB, 2) }}
```

### Explanation:
- **Get-Process**: Retrieves all the processes running on the system.
- **Where-Object**: Filters the processes where the `WorkingSet64` property (which represents memory usage in bytes) is greater than 100 MB.
- **Select-Object**: Formats the output by selecting the `Name`, `ID`, and a calculated property that displays the memory usage in MB, rounded to two decimal places.

### Output:
This will produce a list like the following:
```
Name       ID   Memory (MB)
----       --   ------------
chrome     1234 105.50
explorer   5678 150.75
```

## Scenario-2

* Display all services and their state in a table.

### PowerShell Script:
```powershell
# Get all services and display their name and status in a table
Get-Service | Select-Object Name, Status | Format-Table -AutoSize
```

### Explanation:
- **Get-Service**: Retrieves all services on the system.
- **Select-Object**: Selects only the `Name` and `Status` properties for display.
- **Format-Table**: Formats the output as a table and uses `-AutoSize` to automatically adjust the column width for better readability.

### Output:
This will produce output similar to the following:
```
Name                         Status
----                         ------
AppHostSvc                   Running
AppMgmt                      Stopped
AudioSrv                     Running
```

## Scenario-3

* 