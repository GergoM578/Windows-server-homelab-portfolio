# Group Policy Management

## Overview

Implemented and tested Group Policy in a Windows Server Active Directory environment to centrally manage domain users and workstations.

## Implemented Policies

- [HR Network Drive Mapping](HR-Drive-Mapping/) using Group Policy Preferences and a DFS namespace
- [Workstation Security Baseline](Workstation-Security/) including automatic screen lock, Microsoft Defender and Windows Firewall
- [Windows Update Management](Windows-Update/) for centralized update and restart management
- [Password and Account Lockout Policies](Account-Security/) for domain account security
- [Advanced Security Auditing](Security-Auditing/) for logon and account lockout monitoring

## Testing and Verification

Policies were tested on a domain-joined Windows client using:

- `gpupdate`
- `gpresult`
- PowerShell
- Event Viewer
- Windows Security Event Logs

## Troubleshooting

Resolved a Group Policy processing issue caused by incorrect workstation time-zone configuration and restored successful domain time synchronization.

## Skills Demonstrated

- Group Policy Management
- Active Directory Administration
- Group Policy Preferences
- Workstation Security Hardening
- Windows Update Management
- Account Security
- Windows Security Auditing
- Event Viewer Analysis
- Group Policy Troubleshooting

- 
