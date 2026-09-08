# Architecture

## Goal
Keep the Roblox codebase understandable when multiple humans or AIs work on it independently.

## Logical layers

```text
Client
  ↓ RemoteEvents / RemoteFunctions
Server gameplay services
  ↓
Shared configuration / utilities
  ↓
Persistence / platform services
```

The client is for input, presentation, and prediction where safe. The server owns authoritative game state.

## Recommended Roblox layout

```text
ReplicatedStorage/
  Shared/
    Config/
    Types/
    Utilities/
  Remotes/

ServerScriptService/
  Services/
    PlayerService
    AuraService
    DataService
    CombatService
    PvPService
    NPCService
    ProgressionService
    AFKService
    ShopService
    AdminService
    EventService
  ServerMain.server.lua

StarterPlayer/
  StarterPlayerScripts/
    ClientMain.client.lua
    Controllers/

StarterGui/
  HUD/
  Shop/
  Notifications/

Workspace/
  Map/
  NPCs/
  Zones/
```

Exact folders may evolve with implementation, but responsibilities must remain separated.

## Service ownership

### AuraService
The only service allowed to mutate Aura in normal gameplay.

Responsibilities:
- read Aura;
- add/remove/set Aura;
- validate amounts;
- record reasons for changes;
- expose events/hooks for UI and analytics.

### DataService
Responsibilities:
- load player data;
- save player data;
- retry transient failures;
- session safety.

It should not decide gameplay rewards.

### CombatService
Responsibilities:
- validate attacks;
- hit detection;
- damage application;
- attack cooldowns;
- combat attribution.

It should not directly implement Aura economy.

### PvPService
Responsibilities:
- player-vs-player eligibility;
- death handling;
- Aura loss calculation;
- reward pool;
- contribution tracking;
- anti-farm eligibility.

### NPCService
Responsibilities:
- NPC lifecycle;
- NPC stats;
- NPC rewards configuration;
- respawning;
- PvE contribution.

Rewards are granted through AuraService.

### ProgressionService
Responsibilities:
- derive/unlock HP, damage, and skills from Aura milestones;
- apply progression safely;
- read configuration.

### AFKService
Responsibilities:
- identify valid AFK state/zone;
- calculate passive reward;
- apply reward through AuraService;
- enforce AFK limits.

### ShopService
Responsibilities:
- shop catalog;
- entitlement checks;
- MarketplaceService integration;
- consumable activation.

Never trust a client claim that a Robux purchase happened.

### AdminService
Responsibilities:
- permission checks;
- admin commands/actions;
- validation;
- audit log.

### EventService
Responsibilities:
- event lifecycle;
- event configuration;
- event rewards;
- start/stop/status.

## Remote security

Every remote request must be treated as untrusted input. Validate:

- player identity;
- target identity;
- distance/range;
- cooldown;
- state/zone;
- numeric bounds;
- permission;
- purchase entitlement.

Never accept client-supplied Aura, damage, reward, or admin authority.

## Configuration

Keep balance in shared/server configuration modules:

```text
NPCConfig
ProgressionConfig
CombatConfig
PvPConfig
AFKConfig
ShopConfig
EventConfig
```

A balance change should normally require editing configuration, not gameplay algorithms.

## Cross-service rule

Avoid circular dependencies. Prefer a narrow public API. If Service A needs Service B, document why. Do not reach into Service B's private state.

## Definition of a good module

A module should have:
- one clear responsibility;
- explicit inputs/outputs;
- server/client boundary clearly stated;
- configurable constants where appropriate;
- predictable error handling;
- testable behavior.
