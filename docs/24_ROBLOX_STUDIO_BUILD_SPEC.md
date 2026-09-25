# AURA BATTLE — ROBLOX STUDIO BUILD SPEC

## Purpose

Use this document when asking Roblox Studio Assistant to build the physical world. It is a build specification, not permission to implement the entire game at once.

## Mandatory workflow

1. Inspect the current Data Model before creating anything.
2. Inspect existing `Workspace["AFK-Zone"]` and preserve it.
3. Split the work into small tasks.
4. Build only the current task.
5. Playtest the current task.
6. Verify names, hierarchy, collisions, tags and attributes.
7. Stop and report what changed before moving to the next task.
8. Never rebuild the entire map in one operation.

## World hierarchy

```text
Workspace
└── World
    ├── SafeHaven
    ├── TrainingGrounds
    ├── Wildlands
    ├── Ruins
    ├── VoidTerritory
    ├── BossArena
    └── EventZone
```

Each zone should contain only relevant geometry, spawn points, NPC spawn markers, boundaries, portals and decorations.

## Build order

### Map Task 1 — Safe Haven blockout
Create the central hub with:
- Main spawn.
- Shop location.
- Skill shop location.
- Profile/stat location.
- Leaderboard location.
- Portal to Training Grounds.
- Clear walking paths.

Do not build detailed decoration yet.

### Map Task 2 — Training Grounds blockout
Add:
- Training dummies.
- Weak NPC spawn markers.
- Tutorial area.
- Return portal.

### Map Task 3 — Wildlands
Add:
- Terrain/paths.
- Multiple NPC camps.
- PvP boundary markers.
- Route to Ruins.
- Small landmarks.

### Map Task 4 — Ruins
Add:
- Ruined structures.
- Elite NPC camps.
- Vertical routes.
- Hazard placeholders.
- Void gate.

### Map Task 5 — Void Territory
Add:
- Void landmark.
- Rare/elite camps.
- Loot points.
- High-risk traversal.
- Boss portal.

### Map Task 6 — Boss Arena
Add:
- Entrance.
- Player spawn area.
- Boss spawn.
- Arena boundary.
- Phase/telegraph space.

### Map Task 7 — Event Zone
Create a reusable event arena rather than a one-off map that can never be reused.

### Map Task 8 — Polish
Only after blockout is playable:
- Lighting.
- Atmosphere.
- VFX locations.
- Audio zones.
- Materials.
- Signs.
- Props.
- Hidden areas.

## Naming rules

Use stable PascalCase names for Models/major objects:
- `SafeHaven`
- `TrainingGrounds`
- `Wildlands`
- `Ruins`
- `VoidTerritory`
- `BossArena`
- `EventZone`
- `NPCSpawns`
- `PlayerSpawns`
- `Portals`
- `Boundaries`

Use descriptive names for individual important objects:
- `MainSpawn`
- `TrainingGate`
- `VoidGate`
- `BossEntrance`
- `WorldBossSpawn`

## Attributes / tags

Where useful, use:
- Attribute `ZoneId` = zone identifier.
- Attribute `SafeZone` = true/false.
- Attribute `PvPEnabled` = true/false.
- Attribute `TeleportDestination` = destination identifier.
- Attribute `SpawnType` = player/npc/boss/event.

Useful CollectionService tags:
- `ZoneBoundary`
- `SafeZone`
- `PvPZone`
- `NPCSpawn`
- `TeleportPoint`
- `LootPoint`
- `EventArena`

## Collision rules

Static map geometry should normally be anchored.

Do not make decorative props unnecessarily collidable.

Teleport triggers and zone detectors should generally use `CanCollide = false` and be clearly separated from visible geometry.

Never depend on decorative walls to enforce gameplay security. Server services must validate zone state independently.

## Suggested approximate scale

These are starting proportions, not strict final dimensions:
- Safe Haven: roughly 180×180 studs.
- Training Grounds: roughly 220×180 studs.
- Wildlands: roughly 400×300 studs.
- Ruins: roughly 300×250 studs.
- Void Territory: roughly 450×350 studs.
- Boss Arena: roughly 220–300 stud diameter/width depending on boss mechanics.
- Event Zone: roughly 200×200 studs.

Keep routes readable. Do not make the world huge merely to make it look large.

## Spawn design

Every zone needs clearly identifiable spawn/entry points.

Safe Haven:
- protected player spawn.

Training:
- safe entry.

Wildlands/Ruins/Void:
- arrival point outside immediate NPC aggro range.

Boss Arena:
- player staging spawn outside boss hitbox.

Event Zone:
- event-specific spawn point.

## Zone communication

Players should visually understand danger before entering it.

Use:
- architecture
- lighting
- color/material shifts
- particles
- signs
- ambient audio
- NPC strength
- portal/gate design

Do not rely on text alone.

## Optimization

- Prefer simple anchored geometry.
- Avoid excessive unions and high-part-count decorations.
- Keep particle emitters bounded.
- Clean temporary effects.
- Use StreamingEnabled for large worlds.
- Avoid unnecessary scripts inside individual decorative parts.
- Centralize zone detection and map interactions in services where practical.

## Acceptance criteria

A map task is complete when:
- The intended zone exists.
- Hierarchy/names are stable.
- Spawn/entry works.
- Boundaries are correct.
- Collision is sensible.
- No existing systems were broken.
- The area can be playtested comfortably.
- The next zone can be added without rebuilding the current one.
