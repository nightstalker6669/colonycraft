# Colonycraft Application Documentation

## Overview

**Colonycraft** is a colony management application designed for the **Minecolonies** mod in Minecraft, utilizing Lua scripting with the **CC:Tweaked** mod. The application interfaces with Minecolonies through the Advanced Peripherals **Colony Integrator** block and manages the **Applied Energistics 2 (AE2)** system via the ME Bridge block.

The application's functionality includes:
- Discovering and managing materials for Minecolonies builders.
- Monitoring builders' assignments and task progressions.
- Automating the crafting process for needed materials.
- Providing a user interface on an in-game monitor.

## Features

Users of Colonycraft can expect the following features:
- **Material Management**: Automatic detection and crafting of low-stock items for the colony's builders.
- **Builder Monitoring**: Display of assigned builders, their tasks, and required construction materials.
- **Crafting Automation**: If necessary items are craftable and in short supply, the system will automatically instruct the ME system to craft them and export to a designated chest.
- **Interactive Display**: Users can view builder statuses and interact with the display to review specific details.

## User Stories

- As a user, I want to monitor the status of Minecolonies builders within Minecraft including their construction tasks and assigned locations.

## Technologies

- Minecraft
- CC:Tweaked
- Advanced Peripherals
- Applied Energistics 2
- Minecolonies

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

## Installation and Setup

To integrate Colonycraft into your Minecraft experience:
1. Install the required mods: CC:Tweaked, Advanced Peripherals, Applied Energistics 2, and Minecolonies.
2. Copy the Colonycraft Lua scripts into the computer provided by CC:Tweaked within Minecraft.
3. Restart the in-game computer to run the `startup/startup.lua` which initializes the application.

## Usage

Once installed, the app will display information on a monitor in Minecraft for real-time management. For additional functionality and detailed interactions:
- Refer to the `application.lua` for interface operations.
- Use `inventory_manager.lua` and `me_bridge.lua` to manage automated crafting.

## Contributing

We welcome contributions from the community. Please follow these steps to contribute:
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some YourFeatureName'`).
4. Push the feature branch to your repository (`git push origin feature/YourFeatureName`).
5. Submit a pull request to the original repository.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## Support

Should you need assistance or encounter issues, please submit an issue on the project's issues page or reach out to the project maintainers.