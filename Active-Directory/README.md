# Active Directory Homelab

## Overview

This project demonstrates the deployment and administration of Microsoft Active Directory Domain Services in a multi-domain Windows Server environment.

The lab uses a parent and child domain structure to provide centralized authentication, user and group management, and administrative control across the Windows Server environment.

## Lab Environment

| System | Role | Domain |
|---|---|---|
| WSERVER1 | Parent Domain Controller | London.local |
| WSERVER4 | Child Domain Controller | Wembley.London.local |
| HR | Windows 11 Client | London.local |

## Domain Structure

```text
London.local
│
├── WSERVER1
│   └── Parent Domain Controller
│
├── HR
│   └── Windows 11 Domain Client
│
└── Wembley.London.local
    └── WSERVER4
        └── Child Domain Controller
```

## Project Components

### [Domain Architecture](Domain-Architecture/README.md)
Parent and child domain configuration and Active Directory infrastructure.

### [Users, Groups and OUs](Users-Groups-OUs/README.md)
Organizational Units, domain users, security groups, and group-based administration.

### [Cross-Domain Access](Cross-Domain-Access/README.md)
Group-based Read and Modify access for Wembley domain users to resources hosted in the London domain.

### [Administrative Tasks](Administrative-Tasks/README.md)
Common Active Directory administration and management tasks.

### [Testing & Troubleshooting](Testing-Troubleshooting/README.md)
Domain connectivity, authentication, DNS, domain join, and troubleshooting.

## Skills Demonstrated

- Active Directory Domain Services
- Parent and Child Domain Administration
- Domain Controller Administration
- Organizational Unit Management
- User and Security Group Management
- Group Scope and Group Nesting
- Cross-Domain Access Control
- NTFS Permission Management
- Windows Domain Join
- DNS Integration
- Active Directory Troubleshooting
