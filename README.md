flutter_challenge
=================

## Overview

- Architecture: The app is organized into Data, Domain, and Presentation layers to keep responsibilities separated.(DTOs and entities are specially not implemented.)  

- Local database: Uses sqflite for on-device persistence in the Data layer. 

- State management: Uses MobX stores to drive the UI reactively in the Presentation layer.  

- Theming: Central text and color theme that follows the system light/dark mode (light theme in system light mode, dark theme in system dark mode).  

- Dependency injection: Uses get_it for service registration and provider to expose stores to the widget tree.
