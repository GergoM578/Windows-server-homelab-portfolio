# PowerShell Automation Portfolio

## Overview

This section of my Windows Server Homelab Portfolio demonstrates the use of **PowerShell for Windows administration and automation**.

The projects focus on practical administrative tasks rather than isolated PowerShell commands. They demonstrate how PowerShell can be used to automate repetitive tasks, work with Windows Server components, manage security identities, and verify successful execution.

The current PowerShell portfolio includes:

1. **Screenshot Watcher Automation**
2. **gMSA Service Account Automation**

Additional PowerShell projects will be added as the homelab develops.

---

## PowerShell Environment

The projects were developed and tested primarily in the following environment:

- Windows Server 2022
- Active Directory Domain Services
- PowerShell
- Windows Task Scheduler
- Oracle VirtualBox
- Domain: `London.local`
- Primary Domain Controller: `WSERVER1`

---

# Projects

## 1. Screenshot Watcher Automation

The Screenshot Watcher is a PowerShell automation project designed to detect newly created screenshot files and automatically copy them to a VirtualBox shared folder.

The script:

- Monitors a screenshot directory
- Detects newly created `.png` files
- Tracks files that have already been processed
- Copies new screenshots to a destination folder
- Runs continuously using a PowerShell loop
- Uses Windows Task Scheduler to start automatically at user logon
- Runs hidden in the background

### Technologies and Concepts

- PowerShell variables
- Hash tables
- `Get-ChildItem`
- `ForEach-Object`
- Conditional logic
- `Copy-Item`
- `Join-Path`
- `Start-Sleep`
- Continuous automation loops
- Windows Task Scheduler
- VirtualBox shared folders

### Project

[View Screenshot Watcher Automation](Screenshot-Watcher/README.md)

---

## 2. gMSA Service Account Automation

This project demonstrates the implementation of a **Group Managed Service Account (gMSA)** and its use with PowerShell automation.

A dedicated gMSA was created in Active Directory and authorized for use by `WSERVER1`.

The managed service account was then used to execute a PowerShell system-report script through Windows Task Scheduler.

The project demonstrates:

- KDS Root Key configuration
- Group Managed Service Account creation
- Server authorization for managed password retrieval
- gMSA installation and validation
- PowerShell system-report generation
- Scheduled Task creation using PowerShell
- Running automation under a dedicated service identity
- Execution Policy troubleshooting
- Verification of the actual execution identity
- Scheduled Task result verification

The final system report confirmed that the script executed as:

```text
LONDON\gMSA_Automation$
```

The Scheduled Task also returned:

```text
LastTaskResult : 0
```

confirming successful execution.

### Technologies and Concepts

- Active Directory
- Group Managed Service Accounts (gMSA)
- Key Distribution Service (KDS)
- PowerShell
- Windows Task Scheduler
- `New-ADServiceAccount`
- `Install-ADServiceAccount`
- `Test-ADServiceAccount`
- `New-ScheduledTaskAction`
- `New-ScheduledTaskPrincipal`
- `Register-ScheduledTask`
- PowerShell Execution Policy
- Service identity management

### Project

[View gMSA Service Account Automation](gMSA-Service-Account-Automation/README.md)

---

# Skills Demonstrated

These projects demonstrate practical experience with:

- PowerShell scripting
- Windows Server administration
- Administrative task automation
- Active Directory integration
- Windows Task Scheduler
- File-system automation
- Service account management
- gMSA implementation
- PowerShell pipelines
- Variables and objects
- Conditional logic
- Script troubleshooting
- Execution Policy troubleshooting
- Automated task verification
- Security-focused administration

---

# Repository Structure

```text
PowerShell/
│
├── README.md
│
├── Screenshot-Watcher/
│   ├── README.md
│   ├── ScreenshotWatcher2.ps1
│   └── Screenshots/
│
└── gMSA-Service-Account-Automation/
    ├── README.md
    ├── gMSA-SystemReport.ps1
    └── Screenshots/
```

Each project contains its own documentation, PowerShell source code, implementation details, troubleshooting notes, and supporting screenshots.

---

# Future Development

As my PowerShell knowledge develops, additional automation projects will be added to this section.

Potential future projects include:

- Active Directory user provisioning automation
- Server health monitoring and reporting
- Active Directory health checks
- Administrative reporting tools

The objective is to continue developing PowerShell skills through practical Windows Server administration scenarios rather than only individual command examples.

---

## Portfolio Goal

The goal of this PowerShell portfolio is to demonstrate the ability to use scripting and automation to solve practical Windows administration problems.

The projects combine PowerShell with technologies already implemented elsewhere in the homelab, including **Active Directory, Windows Server, security identities, scheduled tasks, and virtualization**.
