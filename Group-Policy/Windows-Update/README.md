# Windows Update Management

## Objective

The objective of this project was to centrally manage Windows Update settings on domain-joined workstations using Group Policy.

The policy was designed to automate update installation while reducing the risk of unexpected workstation restarts during working hours.

## Configuration

The **Rastro - Workstation Windows Update** GPO was linked to the Workstations Organizational Unit.

The following settings were configured:

### Automatic Updates

- **Configure Automatic Updates:** Enabled
- **Option:** Auto download and schedule the install

### Active Hours and Restart Management

- **Turn off auto-restart for updates during active hours:** Enabled
- **Active Hours Start:** 08:00
- **Active Hours End:** 18:00

This prevents automatic update-related restarts during the configured active hours.

## Implementation

The Windows Update policy was configured under Computer Configuration and applied to domain-joined workstations through the Workstations OU.

This allows update behaviour to be managed centrally rather than configured individually on each workstation.

## Testing and Verification

The policy was tested on a domain-joined Windows client.

### Commands Used

- `gpupdate /force` – forced an immediate Group Policy refresh
- `gpresult /r /scope computer` – confirmed that the Windows Update GPO was applied
- `gpresult /h` – generated a detailed Group Policy Results report

### Additional Verification

The Group Policy Results report confirmed:

- Rastro - Workstation Windows Update was applied
- Configure Automatic Updates was enabled
- Automatic download and scheduled installation was configured
- Active hours were configured from 08:00 to 18:00
- Automatic restart during active hours was disabled

## Result

The domain-joined workstation successfully received the centralized Windows Update configuration, providing automated update management while preventing automatic update-related restarts during working hours.
