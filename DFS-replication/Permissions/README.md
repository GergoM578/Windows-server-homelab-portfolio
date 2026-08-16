# DFS Permissions and Access Control

## Objective

The objective of this part of the project was to control access to DFS shared resources using Active Directory security groups, Share permissions, and NTFS permissions.

This demonstrates centralized access management rather than assigning permissions directly to individual users.

## Access Control Design

Active Directory security groups were used to manage access to shared resources.

For the HumanResources folder, separate security groups were used to provide different levels of access.

This allows permissions to be managed by changing group membership rather than modifying folder permissions for individual users.

## Share and NTFS Permissions

Access to the shared folders was controlled using a combination of:

- SMB Share permissions
- NTFS permissions
- Active Directory security groups

NTFS permissions were used to provide the required level of access to files and folders.

The configuration was tested to ensure that authorized users could access and modify resources according to their assigned permissions.

## DFS and Permissions

Users accessed the HumanResources resource through the DFS Namespace:

```text
\\London.local\DFS\HumanResources
```

The DFS Namespace provides the access path, while the underlying Share and NTFS permissions determine what the user is allowed to do with the files and folders.

## Testing and Verification

Access was tested using domain user accounts on the Windows 11 client.

Testing included:

- Accessing the HumanResources folder through the DFS Namespace
- Creating files and folders
- Editing existing files
- Verifying access based on Active Directory security group membership
- Confirming that Share and NTFS permissions worked together correctly

During testing, Share permissions were adjusted after identifying that NTFS Modify permission alone did not allow the expected file creation because the Share permission was more restrictive.

After correcting the Share permission, authorized users were able to create and modify files successfully.

## Result

DFS folder access was successfully controlled using Active Directory security groups together with Share and NTFS permissions.

The testing also demonstrated how effective access is determined by the combination of Share and NTFS permissions when users access resources over the network.
