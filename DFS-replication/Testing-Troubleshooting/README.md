# DFS Testing and Troubleshooting

## Objective

The objective of this part of the project was to verify DFS Replication and troubleshoot issues affecting synchronization between WSERVER1 and WSERVER4.

Testing was performed from both servers and from the domain-joined Windows 11 client.

## Replication Testing

Bidirectional replication was tested by creating files on both DFS Replication members.

### WSERVER1 → WSERVER4

A test file was created on WSERVER1.

The file successfully appeared on WSERVER4, confirming replication from the parent-domain server to the child-domain server.

### WSERVER4 → WSERVER1

A separate test file was created on WSERVER4.

The file successfully appeared on WSERVER1, confirming replication in the opposite direction.

This verified that DFS Replication was operating bidirectionally.

## DFSR Service Verification

The DFS Replication service was checked using:

```cmd
sc query dfsr
```

The service reported:

```text
STATE: RUNNING
```

This confirmed that the DFS Replication service was operational.

## DFS Replication Diagnostics

The following DFSR diagnostic commands were used during testing and troubleshooting:

```cmd
dfsrdiag pollad
dfsrdiag replicationstate
```

`dfsrdiag pollad` was used to force DFS Replication to poll Active Directory for updated configuration information.

`dfsrdiag replicationstate` was used to inspect current DFS Replication activity.

## Time Synchronization Troubleshooting

During the lab, time synchronization between the Windows Servers caused problems with domain services and Group Policy processing.

WSERVER1 was used as the domain time source, while WSERVER4 was configured to synchronize its time with the domain environment.

VirtualBox Guest Additions time synchronization was also investigated because the virtual machines could inherit time from their physical hosts.

Correct time synchronization was important for reliable Active Directory authentication and communication between the servers.

## Replication Recovery

During testing, DFS Replication did not always resume as expected after the virtual servers were restarted.

The environment was checked by:

- Verifying the DFS Replication service
- Checking server connectivity
- Verifying Active Directory and DNS communication
- Checking time synchronization
- Polling Active Directory for DFSR configuration
- Testing replication with new files

After troubleshooting and rebuilding the replication configuration when required, bidirectional replication was successfully restored.

## Verification Commands

Commands used during testing and troubleshooting included:

```cmd
sc query dfsr
dfsrdiag pollad
dfsrdiag replicationstate
w32tm /query /source
w32tm /query /status
w32tm /resync
nslookup
ping
```

These commands were used to verify DFSR service status, replication activity, time synchronization, DNS resolution, and network connectivity.

## Result

DFS Replication was successfully tested in both directions between WSERVER1 and WSERVER4.

The troubleshooting process provided practical experience diagnosing DFS Replication, Active Directory, DNS, network connectivity, and time synchronization issues in a multi-domain Windows Server environment.
