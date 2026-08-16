# Domain Account Security

## Objective

The objective of this project was to improve the security of Active Directory domain user accounts by implementing centralized password and account lockout policies through Group Policy.

## Configuration

The domain account policies were configured through the **Default Domain Policy**.

### Password Policy

The following password requirements were configured:

- **Enforce password history:** 10 passwords
- **Maximum password age:** 90 days
- **Minimum password age:** 1 day
- **Minimum password length:** 12 characters
- **Password complexity requirements:** Enabled
- **Store passwords using reversible encryption:** Disabled

### Account Lockout Policy

The following account lockout settings were configured:

- **Account lockout threshold:** 5 invalid logon attempts
- **Account lockout duration:** 15 minutes
- **Reset account lockout counter after:** 15 minutes

## Implementation

The password and account lockout policies were configured at the domain level so that they apply to Active Directory domain user accounts.

The account lockout policy helps protect user accounts against repeated password guessing attempts.

### GPO Configuration

The domain password and account lockout policies were centrally configured through the Default Domain Policy.

#### Password Policy

![Domain Password Policy](screenshots/account-security-server-side-password-policy.png)

#### Account Lockout Policy

![Account Lockout Policy](screenshots/account-security-server-side-lockout-policy.png)

## Testing and Verification

The effective domain account policy was verified using:

- `gpupdate /force` – refreshed Group Policy
- `net accounts` – verified the effective password and account lockout settings

### Account Lockout Test

A test domain user account was used to verify the lockout policy.

Five incorrect password attempts were intentionally entered on a domain-joined Windows workstation.

After the fifth failed attempt:

- The domain user account was successfully locked
- The locked status was verified in Active Directory Users and Computers
- The account was manually unlocked by an administrator
- Successful authentication was confirmed after the account was unlocked

  ### Lockout Verification

The account lockout policy was tested using a domain test account. After the configured number of failed authentication attempts, the account was successfully locked.

The locked account status was verified in Active Directory Users and Computers, where the administrator could also manually unlock the account.

![Locked Domain User Account](screenshots/account-security-server-side-user-lockout.png)

## Result

The domain password and account lockout policies were successfully implemented and tested, demonstrating centralized Active Directory account security and administrative account recovery.
