
# DFS Replication Homelab

## Project Overview

This project demonstrates the deployment and configuration of Microsoft Distributed File System (DFS) Replication in a Windows Server environment.

The lab simulates an enterprise file server infrastructure where data is replicated automatically between two Windows Server 2022 servers to provide redundancy and improve availability.

---

## Objectives

- Install the DFS role
- Configure DFS Namespace
- Configure DFS Replication
- Replicate shared folders between two servers
- Validate replication
- Test failover scenarios
- Understand enterprise file replication concepts

---

## Lab Environment

| Component | Details |
|----------|---------|
| Hypervisor | VirtualBox |
| Operating System | Windows Server 2022 |
| Domain | lab.local |
| Domain Controller | DC01 |
| File Server 1 | FS01 |
| File Server 2 | FS02 |
| Client | Windows 11 |

---

## Network Diagram

![Network Diagram](diagrams/network-diagram.png)

---

## Server Configuration

### FS01

- IP Address: 192.168.1.20
- DFS Namespace Server
- DFS Replication Member

### FS02

- IP Address: 192.168.1.21
- DFS Replication Member

---

## Software Installed

- DFS Namespaces
- DFS Replication
- File Server Role

Screenshot:

![DFS Roles](screenshots/install-role.png)

---

# Step 1 – Install DFS Role

Installed the following Windows Server roles:

- DFS Namespace
- DFS Replication

PowerShell:

```powershell
Install-WindowsFeature FS-DFS-Namespace, FS-DFS-Replication -IncludeManagementTools
```

Screenshot:

![Install DFS](screenshots/dfs-install.png)

---

# Step 2 – Create Shared Folder

Created the following shared folder:

```
D:\CompanyData
```

Permissions

Share Permissions

- Everyone – Full Control

NTFS Permissions

- Domain Admins
- Domain Users

Screenshot:

![Folder](screenshots/share.png)

---

# Step 3 – Configure DFS Namespace

Namespace:

```
\\lab.local\CompanyFiles
```

Namespace Type

- Domain-based Namespace

Namespace Server

- FS01

Screenshot:

![Namespace](screenshots/namespace.png)

---

# Step 4 – Configure DFS Replication

Replication Group

```
CompanyFiles
```

Members

- FS01
- FS02

Topology

- Full Mesh

Primary Member

- FS01

Bandwidth

- Full

Schedule

- 24/7

Screenshot:

![Replication](screenshots/replication-group.png)

---

# Step 5 – Verify Replication

Created test files:

```
Test1.txt
HR.xlsx
Finance.docx
```

Verified that all files appeared automatically on FS02.

Screenshot:

![Replication Success](screenshots/replication-success.png)

---

# Validation

## Test 1

Created file on FS01

Result

✅ Successfully replicated

---

## Test 2

Modified file

Result

✅ Changes replicated

---

## Test 3

Deleted file

Result

✅ Deletion replicated

---

## Test 4

Restarted DFS Replication Service

Result

✅ Replication resumed automatically

---

## Troubleshooting

Problem

Replication did not begin immediately.

Cause

DFS Replication service had not completed initial synchronization.

Solution

Waited several minutes and confirmed replication status using:

```powershell
dfsrdiag backlog
```

---

## Skills Demonstrated

- Windows Server Administration
- DFS Namespace
- DFS Replication
- File Sharing
- NTFS Permissions
- Active Directory Integration
- PowerShell
- Troubleshooting

---

## What I Learned

During this project I learned how DFS Replication enables automatic synchronization of data between multiple file servers.

I gained practical experience configuring namespaces, replication groups, permissions, and validating replication. I also learned how enterprise environments improve file availability and redundancy while maintaining centralized access for users.

---

## Future Improvements

- Add a third file server
- Configure replication schedules
- Test WAN replication
- Implement folder targets
- Create PowerShell automation
- Monitor replication health

