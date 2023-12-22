# Colonycraft Application Documentation

## Overview

**Colonycraft** is a colony management application designed for the **Minecolonies** mod in Minecraft, utilizing Lua scripting with the **CC:Tweaked** mod. The application interfaces with Minecolonies via the Colony Integrator provided by the **Advanced Peripherals** mod and navigates the **Applied Energistics 2 (AE2)** system using the ME Bridge block.

The application achieves several automation goals:
- Automating the discovery and management of materials required by the Minecolonies builders.
- Overseeing builders' assignment to construction tasks and the status of those tasks.
- Displaying relevant information through an in-game monitor interface and responding to shortages by crafting necessary items.

## User Stories

- As a user, I want to monitor the status of Minecolonies builders within Minecraft including their construction tasks and assigned locations.

## Technologies

- Applied Energistics 2
- CC:Tweaked
- Advanced Peripherals
- Minecolonies
- Minecraft

## File Structure

- `startup/startup.lua`: Sets up the environment and verifies that CC:Tweaked is correctly initialized.
- `colony_integrator.lua`: Manages the interaction with the Colony Integrator block.
- `main.lua`: The primary entry point for the application, coordinating different modules.
- `inventory_manager.lua`: Handles inventory checks and the crafting of items via the ME System.
- `me_bridge.lua`: Provides functions for interacting with the ME System.
- `monitor_manager.lua`: Manages the monitor's display functions for user interaction.
- `application.lua`: Contains the main application logic for the UI.
- `monitoring/crafting_monitor.lua`: Monitors the crafting queue and provides display capabilities.
- `utils/queue.lua`: Provides queue data structure implementation.

## Setup

1. Ensure the required mods are installed in Minecraft.
2. Place the Lua scripts in the computer's directory provided by CC:Tweaked.
3. Reboot the in-game computer to execute the `startup/startup.lua` and initialize the system.

## Contribution Guidelines

1. Fork this repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -am 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Support

For support, please open an issue or contact the project maintainers.